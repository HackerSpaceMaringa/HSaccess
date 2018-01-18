
dofile("aux.lua")
dofile("mobile.lua") -- where the mobile webpage is stored in many parts

pin = 0;
pl  = 12000;
gpio.mode(pin, gpio.OUTPUT);
servo = {min=500,max=2400}

-- pl = serAng(100)

function serAng( x )
  if (x<0) then x = 0; end;
  if (x>100) then x = 100; end;
  return servo.min+(servo.max-servo.min)*x/100;
end

wifi.sta.getap(1, listap)

set = wifi.setmode(wifi.STATION)
wifi.sta.disconnect()

-- this part is only used the first time you need to connect to a network
--station_cfg={}    
--station_cfg.ssid="HUAWEI-hNFT" "jair"
--station_cfg.pwd= "certorio"
--station_cfg.auto=true
--set = wifi.sta.config(station_cfg)

wifi.sta.connect()
print("config ",set)
print(wifi.sta.status())

local timer_count = 0;
tmr.alarm(5, 1000, 1, 
function()
  
  if (wifi.sta.status() ~= wifi.STA_GOTIP ) then
    print("no IP")
  else
    print(wifi.sta.getip())
    tmr.unregister(5)
  end
  timer_count = timer_count + 1
  if (timer_count>20) then
    tmr.unregister(5) 
  end
end)

function shallow_copy(t)
  local t2 = {}
  for k,v in pairs(t) do
    t2[k] = v
  end
  return t2
end

function abre_porta()
  -- starts sending servo PWM pulses
  startPWM = function()
    tmr.alarm(4,20, 1, 
    function() 
    gpio.write(pin,gpio.HIGH) tmr.delay(pl) gpio.write(pin,gpio.LOW)
    end)
  end
  
  closed_start_position = function()
    pl = serAng(100) --commonly at 100% (maximum angle)
    -- wait 5 seconds
    tmr.alarm(5,5000,tmr.ALARM_SINGLE,
    function() 
      open_position()
    end)  
  end
  
  open_position = function()
    pl = serAng(  0) --commonly at   0% (minimum angle)
    -- wait 20 seconds
    tmr.alarm(5,20000,tmr.ALARM_SINGLE,
    function()
      closed_end_position() 
    end)
  end

  closed_end_position = function()
    pl = serAng(100) --commonly at 100% (maximum angle)
    -- wait 5 seconds
    tmr.alarm(5,5000,tmr.ALARM_SINGLE,
    function()
      cleanup() 
    end)    
  end
  
  cleanup = function()
    tmr.unregister(5)
    tmr.unregister(4)    
  end
  
  startPWM()
  closed_start_position() 
end

function connection(conn)
    print("   |||   \n")
    local response_local = shallow_copy(response)
    conn:on ("receive",
    function(sck, req)
      print(req)
      local _, _, method, path, vars = string.find(req, "([A-Z]+) (.+)?(.+) HTTP");
        if(method == nil)then
            _, _, method, path = string.find(req, "([A-Z]+) (.+) HTTP");
        end
        local _GET = {}
        if (vars ~= nil)then
            for k, v in string.gmatch(vars, "(%w+)=(%w+)&*") do
                _GET[k] = v
            end
        end
          
        if((_GET["user"] ~= nil) and (_GET["pass"] ~= nil)) then
          local user = _GET["user"]
          local pass = _GET["pass"]
          
          local r = DBsearch(user,"fakedb.csv")
          if r ~= nil then
            -- r.user,r.salt,r.hash
            final_hash = crypto.toHex(crypto.hash("sha512",pass .. r.salt))
            if (final_hash == r.hash) then
              print("loggin allowed")
              abre_porta()
            else    
              print("loggin error, wrong password")
            end
          else
            print("loggin error, no user")
            return nil
          end
        end          
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
  end ) 
end

srv=net.createServer(net.TCP) 
srv:listen(80, connection)
print("all good")

