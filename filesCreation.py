import librosa
import pickle
data, sr = librosa.load("HI88.mp3")
with open("voices.txt") as file:
	timestamps = file.read().split("\n")

names= {}
for t in range(len(timestamps)-1):
	lis1 = timestamps[t].split(";")
	lis2 = timestamps[t+1].split(";")
	name1,stamp1 = lis1[0], int(lis1[1])
	name2,stamp2 = lis2[0], int(lis2[1])
	if( name1==name2):
		exit("Concecutive names founds : "+name1)

	time = stamp2 - stamp1
	if( (time / 1000) > 5 ):
		print ("from : ", stamp1, " to ", stamp2, " is ", name1, " ramble for ", time/1000)
		if( not name1 in names ):
			names[name1] = []

		start = sr * stamp1 / 1000
		end = sr * stamp2 / 1000
		print name1,start,end
		for multipleFrame in range(start+(sr*2),end-(sr*2), sr * 1) :
			names[name1].append( (data[multipleFrame:multipleFrame+(sr*1)], sr) )
			librosa.output.write_wav("voices/"+name1+"_"+str(len(names[name1])).zfill(4)+'.wav', data[multipleFrame:multipleFrame+(sr*1)], sr)

save = open("voices.pp","w")
pickle.dump(names,save)
save.close()