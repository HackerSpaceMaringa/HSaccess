
last_motor_use = 0;
motor_rest_time = 120;

porta_abrindo = false 

pl  = 12000;
gpio.mode(pin_pwm, gpio.OUTPUT);
servo = {min=500,max=2400}

done_page=[[<!doctype html>
<html lang="en">
<head>
  <meta charset="utf-8">
</head>
<link rel="icon" href="data:;base64,iVBORw0KGgo=">
<body>
  <title>Acesso - HackerSpace Maringá</title>
  <meta name="description" content="Access page">
  <meta name="author" content="HS Maringa">
  <H1>HackerSpace Maringá</H1><br>]]

function listap(t)
  for k,v in pairs(t) do
    print(k.." : "..v)
  end
end

function DBsearch(user_name,dbFile)
	f = file.open(dbFile) -- check if file exists
	found = false
	ended = false
	while ((not found)and(not ended) ) do
	  local result = ""
	  local last = ""
	  while(string.sub(last,#last,#last) ~= "\n" and last ~= nil) do
	    last = f:readline()
	    if (last == nil) then
	      f:close()
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
			f:close()
			return {user=user,salt=salt,hash=hash}
		end
	end
	f:close()
end

function shallow_copy(t)
  local t2 = {}
  for k,v in pairs(t) do
    t2[k] = v
  end
  return t2
end

function serAng( x )
  if (x<0) then x = 0; end;
  if (x>100) then x = 100; end;
  return servo.min+(servo.max-servo.min)*x/100;
end

function abre_porta()
  if porta_abrindo == true then
    return
  end
  porta_abrindo = true
  

  local alarm_bzz=tmr.create()
  local alarm_pwm=tmr.create()
  local alarm_motor=tmr.create()

  -- starts sending servo PWM pulses
  startPWM = function()
    alarm_pwm:alarm(20, 1, 
    function() 
      gpio.write(pin_pwm,gpio.LOW) tmr.delay(pl) gpio.write(pin_pwm,gpio.HIGH)
    end)
  end
  
  closed_start_position = function()
    pl = serAng(100) --commonly at 100% (maximum angle)
    -- wait 5 seconds
    alarm_bzz:alarm(500,tmr.ALARM_SINGLE,
    function() 
      open_position()
    end)  
  end
  
  open_position = function()
    pl = serAng(  0) --commonly at   0% (minimum angle)
    alarm_motor:alarm(1000,tmr.ALARM_SINGLE,
    function()
      local sec, _, _ = rtctime.get()
      if last_motor_use + motor_rest_time < sec then
        last_motor_use = sec 
        gpio.write(pin_motor,gpio.HIGH)
        alarm_motor:alarm(7000,tmr.ALARM_SINGLE,
        function()
          gpio.write(pin_motor,gpio.LOW)  
        end)
      end
    end)
    -- wait 20 seconds
    alarm_bzz:alarm(20000,tmr.ALARM_SINGLE,
    function()
      closed_end_position() 
    end)
  end

  closed_end_position = function()
    pl = serAng(100) --commonly at 100% (maximum angle)
    -- wait 5 seconds
    alarm_bzz:alarm(500,tmr.ALARM_SINGLE,
    function()
      cleanup() 
    end)    
  end
  
  cleanup = function()
    alarm_bzz:unregister()
    alarm_pwm:unregister()
    alarm_motor:unregister()
    porta_abrindo = false
  end
  
  startPWM()
  closed_start_position() 
end

