import json
with open("whoTalks.json") as file :
	res = json.loads(file.read())

compress = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789-_"

result = {}
for episode in res:
	values = map(lambda x :(float(compress.index(x)) /63),res[episode])
	brady = 0
	grey = 0
	for v in values:
		if( v < .20 ):
			brady+=1
		elif( v > .80):
			grey+=1
	result[episode] = {"brady":brady, "grey": grey}

csv = ";Brady;Grey\n"
for i in range(1, 94):
	csv += str(i)+";"+str(result[str(i)+".mp3"]["brady"])+";"+str(result[str(i)+".mp3"]["grey"])+"\n"

with open("totalRepartion.csv","w") as file:
	file.write(csv)