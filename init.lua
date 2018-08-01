
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
dofile("main.lua")
collectgarbage()
print(node.heap())

sh = [[
tmr.create():alarm(12000, tmr.ALARM_SINGLE, function()
if (wifi.sta.status() == wifi.STA_GOTIP) then
  srv_tls = tls.createConnection()
  srv_tls:on("receive", function(sck, c) end)
  srv_tls:on("connection", function(sck, c)
  -- Wait for connection before sending.
  print("connection")
  print(node.heap())
  sck:send("GET /macros/s/AKfycbzeKNZ5oDHdzi82Nf5JGuKLzK1kEYcONnCgj9xQSy6mKL7nqPmk/exec HTTP/1.1\r\nHost: script.google.com\r\nConnection: keep-alive\r\nAccept: */*\r\n\r\n")
  sck:close()
  end)
  srv_tls:connect(443,"google.com")
  print(err)
  print(node.heap())
end
end
)
]]
