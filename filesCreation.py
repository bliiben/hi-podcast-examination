import librosa
import pickle

####
#	This file takes episode 88, and from the timestamps recorded
#	creates a serie of sample file for each member of the podcast
#	This are stored and used by preprocess to create mfcc spectograms
####

# Load the data
data, sr = librosa.load("HI/88.mp3")

# This file contains a list of starting timestamp (in millisecond) of Grey and Brady on the episode 88
with open("voices.txt") as file:
	timestamps = file.read().split("\n")

# Go though each timestamp
names= {}
for t in range(len(timestamps)-1):
	lis1 = timestamps[t].split(";")
	lis2 = timestamps[t+1].split(";")
	name1,stamp1 = lis1[0], int(lis1[1])
	name2,stamp2 = lis2[0], int(lis2[1])
	
	# Just checking if the data is ok
	if( name1==name2):
		exit("Concecutive names founds : "+name1)

	# If the sample is more than 5 second long
	time = stamp2 - stamp1
	if( (time / 1000) > 5 ):
		print ("from : ", stamp1, " to ", stamp2, " is ", name1, " ramble for ", time/1000)
		if( not name1 in names ):
			names[name1] = []

		# We take the start of the clip and the end of it (sr is the sampling rate)
		start = sr * stamp1 / 1000
		end = sr * stamp2 / 1000
		print name1,start,end

		# We go through the clip and we take 1 second clip, and we ignore the 1st and last 2 seconds
		for multipleFrame in range(start+(sr*2),end-(sr*2), sr * 1) :
			# We create an dictionnary where the key is the speaker and the value is an array of clips
			names[name1].append( (data[multipleFrame:multipleFrame+(sr*1)], sr) )
			# We store wav file of this sample in voices, this is useful to debug.
			librosa.output.write_wav("voices/"+name1+"_"+str(len(names[name1])).zfill(4)+'.wav', data[multipleFrame:multipleFrame+(sr*1)], sr)

# We save the result to get processed in preprocess.py
save = open("voices.pp","w")
pickle.dump(names,save)
save.close()