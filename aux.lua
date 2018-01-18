function listap(t)
    for k,v in pairs(t) do
        print(k.." : "..v)
    end
end

function DBsearch(user_name,dbFile)
	file.open(dbFile) -- check if file exists
	found = false
	ended = false
	while ((not found)and(not ended) ) do
	  local result = ""
	  local last = ""
	  while(string.sub(last,#last,#last) ~= "\n" and last ~= nil) do
	    last = file.readline()
	    if (last == nil) then
	      file.close()
	      return nil --EOF and no result matched
	    end
	    result = result .. last
	  end
		if result == nil then
			ended = true
			break
		end
		user,salt,hash = string.match(result,"(.*),(.*),(.*)\n")
		if user == user_name then
			file.close()
			return {user=user,salt=salt,hash=hash}
		end
	end
end

