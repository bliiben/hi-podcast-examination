import pickle
import librosa
import librosa.display
from matplotlib import pyplot
import numpy as np
with open("voices.pp") as file:
	names = pickle.load(file)
data = []
labels = []
i=0
for name in names:
	for inp in names[name]:
		i+=1
		y=inp[0]
		sr=inp[1]
		S = librosa.feature.melspectrogram(y, sr=sr, n_mels=128)
		log_S = librosa.logamplitude(S, ref_power=np.max)
		mfcc = librosa.feature.mfcc(S=log_S, sr=sr, n_mfcc=16)
		
		# librosa.display.specshow(mfcc)
		# pyplot.show()
		labels.append(name)
		data.append(mfcc)
		print(i)
with open("mfcc.pp","w") as file:
	pickle.dump((labels, data),file)