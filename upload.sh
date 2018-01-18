
##Breaks the html into smaller chucks and put them in lua strings
python3 breakHTML.py mobile.html 1700 mobile.lua
#sends all the files
nodemcu-uploader upload init.lua aux.lua mobile.lua fakedb.csv


