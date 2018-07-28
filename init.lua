
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

set = wifi.setmode(wifi.STATION)
wifi.sta.getap(1, listap)
wifi.sta.disconnect()

-- this part is only used the first time you need to connect to a network
--station_cfg={}    
--station_cfg.ssid="HUAWEI-hNFT"
--station_cfg.pwd= "certorio"
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

function shallow_copy(t)
  local t2 = {}
  for k,v in pairs(t) do
    t2[k] = v
  end
  return t2
end

function abre_porta()
  local alarm_bzz=tmr.create()
  local alarm_pwm=tmr.create()
  -- starts sending servo PWM pulses
  startPWM = function()
    alarm_pwm:alarm(20, 1, 
    function() 
    gpio.write(pin,gpio.HIGH) tmr.delay(pl) gpio.write(pin,gpio.LOW)
    end)
  end
  
  closed_start_position = function()
    pl = serAng(100) --commonly at 100% (maximum angle)
    -- wait 5 seconds
    alarm_bzz:alarm(5000,tmr.ALARM_SINGLE,
    function() 
      open_position()
    end)  
  end
  
  open_position = function()
    pl = serAng(  0) --commonly at   0% (minimum angle)
    -- wait 20 seconds
    alarm_bzz:alarm(20000,tmr.ALARM_SINGLE,
    function()
      closed_end_position() 
    end)
  end

  closed_end_position = function()
    pl = serAng(100) --commonly at 100% (maximum angle)
    -- wait 5 seconds
    alarm_bzz:alarm(5000,tmr.ALARM_SINGLE,
    function()
      cleanup() 
    end)    
  end
  
  cleanup = function()
    alarm_bzz:unregister()
    alarm_pwm:unregister()    
  end
  
  startPWM()
  closed_start_position() 
end

pin_bot = 7
time_repeat = 0;
gpio.mode(7,gpio.INPUT,gpio.PULLUP)
local alarm_porta = tmr.create():alarm(2000, tmr.ALARM_AUTO, 
    function()
    if time_repeat<1 then
      if (gpio.read(pin_bot))==0 then
          print("abre porta pelo botao") 
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
        else        
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
  end ) 
end

srv=net.createServer(net.TCP) 
srv:listen(80, connection)
print("all good")

tmr.create():alarm(30000, tmr.ALARM_AUTO, function()
if (wifi.sta.status() ~= wifi.STA_GOTIP) then
  wifi.sta.connect()
end
end
)
