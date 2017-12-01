import tensorflow as tf
import numpy as np
import pickle

from tensorflow.contrib import predictor

with open("mfcc.pp") as file:
	dataset = pickle.load(file)

labels = dataset[0]
data = map(lambda x : x.ravel(), dataset[1])
names = list(set(labels))
labels = np.array(map(lambda x :  names.index(x), labels))

predict_fn = predictor.from_saved_model("exportedmodel3/1512120452",signature_def_key="predict")
predictions = predict_fn({"x": np.array(data[-20:])})


result = map(lambda x : (x[0][0],x[0][1], int(x[1][0])) , zip(predictions["probabilities"],predictions["classes"]))
for r in result:
	print str(round(r[0]*100))+" " +str(round(r[1]*100)) + " " + names[r[2]]