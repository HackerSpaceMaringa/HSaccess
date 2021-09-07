
function log(phrase)
  a=file.open("access.log","a")
  if a then
    a:write(phrase.."\n")
    a:close()
  else
    print("não foi possível registrar o log")
  end
end

-- pl = serAng(100)

set = wifi.setmode(wifi.STATION)
wifi.sta.getap(1, listap)
wifi.sta.disconnect()

-- this part is only used the first time you need to connect to a network
--station_cfg={}
--station_cfg.ssid=""
--station_cfg.pwd= ""
--station_cfg.auto=true
--set = wifi.sta.config(station_cfg)

wifi.sta.connect()
print("config ",set)
print(wifi.sta.status())

local timer_count = 0;
alarm_ip = tmr.create()
alarm_ip:alarm(3000, 1,
function()
  if (wifi.sta.status() ~= wifi.STA_GOTIP ) then
    print("no IP")
  else
    print(wifi.sta.getip())
    alarm_ip:unregister()
  end
  timer_count = timer_count + 1
  if (timer_count>20) then
    alarm_ip:unregister()
  end
end)

sntp.sync(nil, nil, nil, 1)

time_repeat = 0;
local alarm_porta = tmr.create():alarm(2000, tmr.ALARM_AUTO,
function()
  if time_repeat<1 then
    if (gpio.read(pin_bot))==1 then
      print("abre porta pelo botao")
      sec, _, _ = rtctime.get()
      log("door opened through the button,,"..sec)
      time_repeat = 15
      abre_porta()
    end
  else
    time_repeat = time_repeat - 1
  end
end)

function connection(conn)    
  print("   |||   \n")
  local response_local = shallow_copy(response)
  conn:on ("receive",
  function(sck, req)
    --print(req)
    local _, _, method, path_vars = string.find(req, "([A-Z]+) (.+) HTTP");
    if(method=="POST")then
      if(path_vars=="/ping")then
        -- PING request
        sck:on("sent", function(sock) sock:close() end)
        sck:send("pong")
      else
        local _, _, user, pass = string.find(req, "user=(.+)&pass=(.+)");
        --local req_tab = split(req,"\n") não existe essa função
        print("peguei do post")
        print(user)
        --print(pass)
        --check if user and pass exist
        local done_html = [[<!doctype html>
        <html lang="en">
        <head>
        <meta charset="utf-8">
        </head>
        <link rel="icon" href="data:;base64,iVBORw0KGgo=">
        <body>
        <title>Acesso - HackerSpace Maringá</title>
        <meta name="description" content="Access page">
        <meta name="author" content="HS Maringa">
        </body>

        <H1>HackerSpace Maringá</H1><br>
        ]]
        sck:on("sent", function(sock) sock:close() end)
        sck:send(done_html)
        local r = DBsearch(user,"fakedb.csv")
        if r ~= nil then
          -- r.user,r.salt,r.hash
          final_hash = crypto.toHex(crypto.hash("sha512",pass .. r.salt))
          sec, _, _ = rtctime.get()        
          if (final_hash == r.hash) then
            print("loggin allowed")
            log("loggin allowed,"..user..","..sec)
            abre_porta()
          else
            print("loggin error, wrong password")
            log("wrong password,"..user..","..sec)
          end
        else
          print("loggin error, no user")
          log("loggin error no user, ,"..sec)
          return nil
        end
      end
    elseif(method=="GET")then
      if(path_vars=="/")then
        print("é um get /")
        local function sender (sck)
          if #response_local>0 then
            sck:send(table.remove(response_local,1))
          else
            sck:close()
            collectgarbage();
          end
        end
        sck:on("sent", sender)
        sender(sck)
      elseif(path_vars=="/log")then
        b=file.open("access.log","r")
        if(b:seek("end",-512)==nil)then
        print("file too short to be sent")
      else
        local str_tmp = b:read(512)
        local str_tmp = crypto.toHex(crypto.encrypt("AES-CBC", global_key, str_tmp))
        collectgarbage();
        sck:on("sent",function(sck) sck:close() end)
        sck:send(str_tmp)
      end
      b:close()
    end
  else
    print("é um outro")
  end
end)  
end

srv=net.createServer(net.TCP)
srv:listen(80, connection)
print("all good")

tmr.create():alarm(30000, tmr.ALARM_AUTO, function()
  local sec, _, _ = rtctime.get()
  if last_motor_use>sec+10 then
    sec, _, _ = rtctime.get()
    log("motor time exceeded,,"..sec) 
    gpio.write(pin_motor,gpio.LOW) 
  end
  --make sure it is closed
  gpio.write(pin_pwm,gpio.HIGH) tmr.delay(serAng(100)) gpio.write(pin_pwm,gpio.LOW)

  if (wifi.sta.status() ~= wifi.STA_GOTIP) then
    wifi.sta.connect()
  end
end)


