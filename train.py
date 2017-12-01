import numpy as np
import tensorflow as tf
import pickle
import tempfile

###
# This file loads preprocessed file mfcc.pp to train a nn classifier model
# The model is exported to exportedmodel3 folder
# The file is composed by a tuple, where
# - index 0 is an array of labels with the names of the podcast member [Brady, Brady, Grey, ...]
# - index 1 is an array of mfcc spectrograms (these are numpy array) corresponding to
#	an 1 second sample of the voice of the voice of the podcast member at the same index
#	in the label array
###

## Load the file (come from preprocess.py)
with open("mfcc.pp") as file:
	dataset = pickle.load(file)

# Data is array of numpy array that we ravel to put them in 1D
data = map(lambda x : x.ravel(), dataset[1])

# Labels in the first index of the tuple, we change the string value to an index value
labels = dataset[0]
names = list(set(labels))
labels = np.array(map(lambda x :  names.index(x), labels))

# Input layer
feature_columns = [tf.feature_column.numeric_column("x", shape=[len(data[0])])]

# We need this for exporting the model
def serving_input_receiver_fn():
	inputs = {"x": tf.placeholder(shape=[None,len(data[0])], dtype=tf.float32 )}
	return tf.estimator.export.ServingInputReceiver(inputs,inputs)

# Directory we save the model during creation
modelDir = tempfile.mkdtemp()

# DNN classifier 
model = tf.estimator.DNNClassifier(
	feature_columns=feature_columns,
	n_classes=len(names),
	model_dir=modelDir,
	hidden_units=[128,32]
	)

# Training data corresponds to all of the data we have available minus 1st 20 and last 20 elements
train_input_fn = tf.estimator.inputs.numpy_input_fn(
	x={"x" : np.array(data[20:-20])},
	y=labels[20:-20],
	shuffle=True)

# Evaluation data corresponds to the 1st 20 and last 20 elements
eval_input_fn = tf.estimator.inputs.numpy_input_fn(
	x={"x" : np.array(data[:20] + data[-20:])},
	y=np.append(labels[:20] , labels[-20:]),
	shuffle=False)

# Train the model
model.train(input_fn=train_input_fn, steps=1000)
result = model.evaluate(input_fn=train_input_fn, steps=1)

# Show the result
for p in result:
	print p+" -> "+str(result[p])

# Export the model to exportedmodel3
export_dir = model.export_savedmodel(
	export_dir_base="exportedmodel3",
	serving_input_receiver_fn=serving_input_receiver_fn)

# Model is stored in there
print "The model is stored in : "+export_dir

# We can look at the algorithm prediction on the evaluated data
if( False ):
	predictions = list(model.predict(input_fn=eval_input_fn))
	predicted_classes = [names[int(p["classes"][0])] for p in predictions]
	for clas in predicted_classes:
		print clas

