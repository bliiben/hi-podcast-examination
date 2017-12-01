import pickle
import librosa
import librosa.display
from matplotlib import pyplot
import numpy as np

####
#	This file generate mfcc spectrums from sample created in filesCreation.py
#	It stores them in mfcc.pp which is a tuple containing two arrays
#	One with the names (labels)
#	One with the mfcc spectrums
####


# File created as result in filesCreation.py
with open("voices.pp") as file:
	names = pickle.load(file)

data = []
labels = []
for name in names:
	for inp in names[name]:

		# Generation of the spectrum from the file
		y=inp[0]
		sr=inp[1]
		S = librosa.feature.melspectrogram(y, sr=sr, n_mels=128)
		log_S = librosa.logamplitude(S, ref_power=np.max)
		mfcc = librosa.feature.mfcc(S=log_S, sr=sr, n_mfcc=16)
		
		# We can display the spectrum if we want to

		# librosa.display.specshow(mfcc)
		# pyplot.show()

		# Storing into a file
		labels.append(name)
		data.append(mfcc)

with open("mfcc.pp","w") as file:
	pickle.dump((labels, data),file)