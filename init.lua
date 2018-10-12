

a=file.open("key","r")
if a then
  global_key = a:read(512)
  a:close()
end

node.compile("aux.lua")
collectgarbage()
node.compile("mobile.lua")
collectgarbage()
node.compile("main.lua")
collectgarbage()

print(node.heap())
dofile("aux.lc")
collectgarbage()
print(node.heap())
dofile("mobile.lc") -- where the mobile webpage is stored in many parts
collectgarbage();
print(node.heap())
dofile("main.lc")
collectgarbage()
print(node.heap())
