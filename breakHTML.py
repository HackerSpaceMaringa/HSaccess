#!/usr/bin/python

import sys
import string

# Para nodeMCU o maximo deve ser 1700 char

if len(sys.argv) < 1+1:
	print("Faltam parâmetros")
	print("O uso deve ser: .\\"+ sys.argv[0] +" pageToBreak.hmtl maxCharPerSeg outputFile")
	quit() 

page_to_break =  sys.argv[1]
maxChar    = int(sys.argv[2]) if len(sys.argv)>2 else 1700
outfile    =     sys.argv[3] if len(sys.argv)>3 else "result.lua"

if len(sys.argv) < 1+3:
	print("Parâmetros omitidos")
	print("Usando como: .\\"+ sys.argv[0] +" "+page_to_break+" "+str(maxChar)+" "+outfile)


with open(page_to_break, 'r') as content_file:
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


	
	with open(outfile, 'w') as result_file:
		pass
	toBreak = []
	j = 0
	while j < (max(res)-maxChar):
		toBreak.append(max(list(filter(lambda x : x < (maxChar+j) ,res))))
		j = toBreak[-1]
	toBreak.append(len(webpage))
	webpages = ""
	with open(outfile, 'a') as result_file:
		for key in range(0,len(toBreak)):
			result_file.write("webpage"+str(key)+" = [[")
			webpages = webpages+"webpage"+str(key)+","
			last  = toBreak[key] 
			first = 0 if key == 0  else toBreak[key-1]
			result_file.write(webpage[first:last])
			result_file.write(" ]] \n")
		webpages = webpages[:-1]
		result_file.write("response = {")
		result_file.write(webpages)
		result_file.write("}")
		
      

