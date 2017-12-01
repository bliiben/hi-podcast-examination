import librosa
import json
import numpy as np
import tensorflow as tf
from tensorflow.contrib import predictor
import pickle

# Compressed
compressValue = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789-_"
# 1 second segments
SECONDS = 1
predict_fn = predictor.from_saved_model("exportedmodel3/1512120452",signature_def_key="predict")

result = {}
filenames = map( lambda x : str(x)+".mp3", range(1,98))
filenames.append("The_Shortlist.mp3")

filenames = ["The_Shortlist.mp3"]
for filename in filenames:
	print ("Loading "+filename)
	
	data, sr = librosa.load("HI/"+filename)
	inputLayers = []
	i=0
	for start in range( 0, len(data) - (sr*SECONDS), sr*SECONDS ):
		if( i % 60 == 0 and i != 0):
			print ("On "+str(i/60)+" min")
			
		i+=1
		# Segment the file into 1 second segments
		end = start + sr*SECONDS
		cropped = data[start:end]

		# Generate mfcc for the cropped file
		S = librosa.feature.melspectrogram(cropped, sr=sr, n_mels=128)
		log_S = librosa.logamplitude(S, ref_power=np.max)
		mfcc = librosa.feature.mfcc(S=log_S, sr=sr, n_mfcc=16)

		# Transform the mfcc into an input layer
		inputLayer = np.array(mfcc).ravel()
		inputLayers.append(inputLayer)

	print ("Predicting "+filename)
	# Recognize the voices from the trained model
	predictions = predict_fn({"x": np.array(inputLayers)})
	probability = map(lambda x : (x[0][0],x[0][1], int(x[1][0])) , zip(predictions["probabilities"],predictions["classes"]))

	secondSerie = ""
	for p in probability:
		#print str(round(r[0]*100))+" " +str(round(r[1]*100)) + " " + names[r[2]]
		#Insert the probability that it is class 0 probability that is class 1 = 1-p0 as there is only two speakers
		secondSerie+=compressValue[int(round(p[0]*63))]
	result[filename] = secondSerie

print ("Saving ")
with open("whoTalks.json","w") as file:
	json.dump( result, file )