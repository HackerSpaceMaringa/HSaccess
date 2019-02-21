
pin_pwm  =  0;
pin_d1   =  1;
pin_motor = 2; -- activates the relay
pin_led  =  3;
pin_bzz  = 4;
pin_en1  = 5;
pin_en2  = 6;
pin_en3  = 7;
pin_bot  = 8;

gpio.mode(pin_pwm,gpio.OUTPUT);
gpio.mode(pin_motor,gpio.OUTPUT);
gpio.mode(pin_led,gpio.OUTPUT);
gpio.mode(pin_bzz,gpio.OUTPUT);
gpio.mode(pin_bot,gpio.INPUT);

gpio.write(pin_pwm,0);
gpio.write(pin_motor,0);
gpio.write(pin_led,0);
gpio.write(pin_bzz,0);


uart.setup(0, 115200, 8, uart.PARITY_NONE, uart.STOPBITS_1, 1)

a=file.open("key","r")
if a then
  global_key = a:read(512)
  a:close()
  global_key = global_key:sub(1,#global_key-1)
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
