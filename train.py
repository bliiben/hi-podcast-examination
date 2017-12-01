import numpy as np
import tensorflow as tf
import pickle
import tempfile

with open("mfcc.pp") as file:
	dataset = pickle.load(file)

labels = dataset[0]
data = map(lambda x : x.ravel(), dataset[1])
names = list(set(labels))
labels = np.array(map(lambda x :  names.index(x), labels))

# DNN classifier
print len(np.array(data[20:-20])), len(labels[20:-20])

feature_columns = [tf.feature_column.numeric_column("x", shape=[len(data[0])])]

def serving_input_receiver_fn():
	# Input layer
	inputs = {"x": tf.placeholder(shape=[None,len(data[0])], dtype=tf.float32 )}
	return tf.estimator.export.ServingInputReceiver(inputs,inputs)

model = tf.estimator.DNNClassifier(
	feature_columns=feature_columns,
	n_classes=len(names),
	model_dir="model3",
	hidden_units=[128,32]
	)

train_input_fn = tf.estimator.inputs.numpy_input_fn(
	x={"x" : np.array(data[20:-20])},
	y=labels[20:-20],
	shuffle=True)

eval_input_fn = tf.estimator.inputs.numpy_input_fn(
	x={"x" : np.array(data[:20] + data[-20:])},
	y=np.append(labels[:20] , labels[-20:]),
	shuffle=False)

model.train(input_fn=train_input_fn, steps=1000)
result = model.evaluate(input_fn=train_input_fn, steps=1)

for p in result:
	print p+" -> "+str(result[p])


export_dir = model.export_savedmodel(
	export_dir_base="exportedmodel3",
	serving_input_receiver_fn=serving_input_receiver_fn)

print export_dir

if( False ):
	predictions = list(model.predict(input_fn=eval_input_fn))
	predicted_classes = [names[int(p["classes"][0])] for p in predictions]
	for clas in predicted_classes:
		print clas

