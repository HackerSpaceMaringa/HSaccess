import string

# 1757
with open('mobile.html', 'r') as content_file:
	webpage = content_file.read()
	i = 0
	res = []
	while i < len(webpage):
		ix = []
		ix.append(webpage.find(";", i))
		ix.append(webpage.find("\n", i))

		ix = min(ix)
		if (ix < i):
			i = len(webpage)+1
		else:
			i = ix
			res.append(i)
			i = i + 1;


	
	with open('result.lua', 'w') as result_file:
		pass
	toBreak = []
	j = 0
	while j < (max(res)-1700):
		toBreak.append(max(list(filter(lambda x : x < (1700+j) ,res))))
		j = toBreak[-1]
	toBreak.append(len(webpage))
	webpages = ""
	with open('result.lua', 'a') as result_file:
		for key in range(0,len(toBreak)):
			result_file.write("webpage"+str(key)+" = [[")
			webpages = webpages+"webpage"+str(key)+","
			last  = toBreak[key] 
			first = 0 if key == 0  else toBreak[key-1]
			result_file.write(webpage[first:last])
			result_file.write(" ]] \n")
		webpages = webpages[:-1]
		result_file.write("local response = {")
		result_file.write(webpages)
		result_file.write("}")
		
      

