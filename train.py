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

columns=[]
test_data = {}
eval_data = {}
for feature in range(len(data[0])):
	columns.append(tf.feature_column.numeric_column("v"+str(feature)))
	test_data["v"+str(feature)] = np.array([])
	eval_data["v"+str(feature)] = np.array([])


for di in range(len(data)):
	for w in range(len(data[di])):
		if( di < 20 or di > (len(data) -21) ):
			eval_data["v"+str(w)] = np.append(eval_data["v"+str(w)],data[di][w])
		else:
			test_data["v"+str(w)] = np.append(test_data["v"+str(w)],data[di][w])


eval_labels = np.append(labels[0:20] , labels[-20:])
test_labels = labels[20:-20]

print len(eval_labels), len(test_data["v1"]), len(test_labels), len(eval_data["v1"])


modelDir = tempfile.mkdtemp()

m = tf.estimator.DNNLinearCombinedClassifier(
	model_dir = "model2/",
	dnn_feature_columns = columns,
	dnn_hidden_units=[512,128,8])

train_input_fn = tf.estimator.inputs.numpy_input_fn(
	x=test_data,
	y=test_labels,
	shuffle = True,
	num_threads =3,
	num_epochs = 100 )


eval_input_fn = tf.estimator.inputs.numpy_input_fn(
	x=eval_data,
	y=eval_labels,
	shuffle = True,
	num_threads =3,
	num_epochs = 1 )

for i in range(5):
	m.train( input_fn = train_input_fn )
	results = m.evaluate(input_fn=eval_input_fn)
	for key in sorted(results):
		print("%s: %s" % (key, results[key]))
# tf.classifier.train(input_fn=train_input_fn, steps=2000)
