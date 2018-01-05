webpage0 = [[<!doctype html>

<html lang="en">
<head>
  <meta charset="utf-8">
</head>

<body>
  <title>Acesso - HackerSpace Maringá</title>
  <meta name="description" content="Access page">
  <meta name="author" content="HS Maringa">

  
  <H1>HackerSpace Maringá</H1><br>
  <p id="warning"> Without JavaScript you cannot login, because it is insecure
  <form id="submission" style="display: none;" name="login">
    Nome: <input type="text" name="user" tabindex=1> 
    <input value="Enviar" type="submit" onclick="return check(this.form)" tabindex=3><br>
    Senha: <input type="password" name="pass" tabindex=2> <br>
  </form>
  <style media="screen" type="text/css">
    h1 {font-size: 10vmin;text-align: center}
    h2 {font-size: 8vmin;text-align: center}
    p {font-size: 5vmin;text-align: center}
    form {font-size: 5vmin;text-align: center}
    input {font-size: 5vmin;text-align: center}
    textarea {font-size: 2vmin;display: block;margin-left: auto;margin-right: auto;}
  </style>


  <!-- https://github.com/Caligatio/jsSHA/blob/master/src/sha512.js -->
<script language="javascript">

  document.getElementById("warning").style.display = "none"
  document.getElementById("submission").style.display = "inline"

  /*
 A JavaScript implementation of the SHA family of hashes, as
 defined in FIPS PUB 180-4 and FIPS PUB 202, as well as the corresponding
 HMAC implementation as defined in FIPS PUB 198a
 Copyright Brian Turek 2008-2017
 Distributed under the BSD License
 See http://caligatio.github.com/jsSHA/ for more information
 Several functions taken from Paul Johnston
*/
'use strict';(function(K){function x(b,a,d){var e=0,g=[],k=0,f,c,m,h,l,p,t,q,y=!1,u=[],r=[],v,A=!1;d=d||{} ]] 
webpage1 = [[;f=d.encoding||"UTF8";v=d.numRounds||1;if(v!==parseInt(v,10)||1>v)throw Error("numRounds must a integer >= 1");if(0===b.lastIndexOf("SHA-",0))if(p=function(a,d){return B(a,d,b)},t=function(a,d,g,e){var c,k;if("SHA-384"===b||"SHA-512"===b)c=(d+129>>>10<<5)+31,k=32;else throw Error("Unexpected error in SHA-2 implementation");for(;a.length<=c;)a.push(0);a[d>>>5]|=128<<24-d%32;d=d+g;a[c]=d&4294967295;
a[c-1]=d/4294967296|0;g=a.length;for(d=0;d<g;d+=k)e=B(a.slice(d,d+k),e,b);if("SHA-384"===b)a=[e[0].a,e[0].b,e[1].a,e[1].b,e[2].a,e[2].b,e[3].a,e[3].b,e[4].a,e[4].b,e[5].a,e[5].b];else if("SHA-512"===b)a=[e[0].a,e[0].b,e[1].a,e[1].b,e[2].a,e[2].b,e[3].a,e[3].b,e[4].a,e[4].b,e[5].a,e[5].b,e[6].a,e[6].b,e[7].a,e[7].b];else throw Error("Unexpected error in SHA-2 implementation");return a},q=function(a){return a.slice()},"SHA-384"===b)l=1024,h=384;else if("SHA-512"===b)l=1024,h=512;else throw Error("Chosen SHA variant is not supported");

else throw Error("Chosen SHA variant is not supported");m=C(a,f);c=z(b);this.setHMACKey=function(a,d,g){var k;if(!0===y)throw Error("HMAC key already set");if(!0===A)throw Error("Cannot set HMAC key after calling update");f=(g||{}).encoding||"UTF8";d=C(d,f)(a);a=d.binLen;d=d.value;k=l>>>3;g=k/4-1;if(k<a/8){for(d=t(d,a,0,z(b));d.length<=g;)d.push(0);d[g]&=4294967040}else if(k>a/8){for(;d.length<=g;)d.push(0);d[g]&=4294967040}for(a=0;a<=g;a+=1)u[a]=d[a]^909522486,r[a]=d[a]^1549556828;c=p(u,c);e=l;y=
!0};this.update=function(a){var d,b,n,f=0,h=l>>>5;d=m(a,g,k);a=d.binLen;b=d.value;d=a>>>5;for(n=0;n<d;n+=h)f+l<=a&&(c=p(b.slice(n,n+h),c),f+=l);e+=f;g=b.slice(f>>>5);k=a%l;A=!0};this.getHash=function(a,d){var f,l,m,p ]] 
webpage2 = [[;if(!0===y)throw Error("Cannot call getHash after setting HMAC key");m=D(d);switch(a){case "HEX":f=function(a){return E(a,h,m)};break;case "B64":f=function(a){return F(a,h,m)};break;case "BYTES":f=function(a){return G(a,h)};break;case "ARRAYBUFFER":try{l=new ArrayBuffer(0)}catch(w){throw Error("ARRAYBUFFER not supported by this environment");


}f=function(a){return H(a,h)};break;default:throw Error("format must be HEX, B64, BYTES, or ARRAYBUFFER");}p=t(g.slice(),k,e,q(c));for(l=1;l<v;l+=1)p=t(p,h,0,z(b));return f(p)};this.getHMAC=function(a,d){var f,m,u,v;if(!1===y)throw Error("Cannot call getHMAC without first setting HMAC key");u=D(d);switch(a){case "HEX":f=function(a){return E(a,h,u)};break;case "B64":f=function(a){return F(a,h,u)};break;case "BYTES":f=function(a){return G(a,h)};break;case "ARRAYBUFFER":try{f=new ArrayBuffer(0)}catch(w){throw Error("ARRAYBUFFER not supported by this environment");
}f=function(a){return H(a,h)};break;

default:throw Error("outputFormat must be HEX, B64, BYTES, or ARRAYBUFFER");}m=t(g.slice(),k,e,q(c));v=p(r,z(b));v=t(m,h,l,v);return f(v)}}function b(b,a){this.a=b;this.b=a}function E(b,a,d){var e="";a/=8;var g,k;for(g=0;g<a;g+=1)k=b[g>>>2]>>>8*(3+g%4*-1),e+="0123456789abcdef".charAt(k>>>4&15)+"0123456789abcdef".charAt(k&15);return d.outputUpper?e.toUpperCase():e}function F(b,a,d){var e="",g=a/8,k,f,c;for(k=0;k<g;k+=3)for(f=k+1<g?b[k+1>>>2]:0,c=k+2<g?b[k+2>>>2]:
0,c=(b[k>>>2]>>>8*(3+k%4*-1)&255)<<16|(f>>>8*(3+(k+1)%4*-1)&255)<<8|c>>>8*(3+(k+2)%4*-1)&255,f=0;4>f;f+=1)8*k+6*f<=a?e+="ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789+/".charAt(c>>>6*(3-f)&63):e+=d.b64Pad;return e}function G(b,a){var d="",e=a/8,g,c;for(g=0;g<e ]] 
webpage3 = [[;g+=1)c=b[g>>>2]>>>8*(3+g%4*-1)&255,d+=String.fromCharCode(c);return d}function H(b,a){var d=a/8,e,g=new ArrayBuffer(d),c;c=new Uint8Array(g);


for(e=0;e<d;e+=1)c[e]=b[e>>>2]>>>8*(3+e%4*-1)&255;return g}function D(b){var a={outputUpper:!1,
b64Pad:"=",shakeLen:-1};b=b||{};a.outputUpper=b.outputUpper||!1;!0===b.hasOwnProperty("b64Pad")&&(a.b64Pad=b.b64Pad);if("boolean"!==typeof a.outputUpper)throw Error("Invalid outputUpper formatting option");if("string"!==typeof a.b64Pad)throw Error("Invalid b64Pad formatting option");return a}function C(b,a){var d;switch(a){case "UTF8":case "UTF16BE":case "UTF16LE":break;default:throw Error("encoding must be UTF8, UTF16BE, or UTF16LE");}switch(b){case "HEX":d=function(a,b,d){var f=a.length,c,n,h,l,
p;if(0!==f%2)throw Error("String of HEX type must be in byte increments");b=b||[0];d=d||0;p=d>>>3;for(c=0;c<f;c+=2){n=parseInt(a.substr(c,2),16);if(isNaN(n))throw Error("String of HEX type contains invalid characters");l=(c>>>1)+p;for(h=l>>>2;b.length<=h;)b.push(0);

b[h]|=n<<8*(3+l%4*-1)}return{value:b,binLen:4*f+d}};break;case "TEXT":d=function(b,d,c){var f,n,m=0,h,l,p,t,q,r;d=d||[0];c=c||0;p=c>>>3;if("UTF8"===a)for(r=3,h=0;h<b.length;h+=1)for(f=b.charCodeAt(h),n=[],128>f?n.push(f):2048>f?(n.push(192|
f>>>6),n.push(128|f&63)):55296>f||57344<=f?n.push(224|f>>>12,128|f>>>6&63,128|f&63):(h+=1,f=65536+((f&1023)<<10|b.charCodeAt(h)&1023),n.push(240|f>>>18,128|f>>>12&63,128|f>>>6&63,128|f&63)),l=0;l<n.length;l+=1){q=m+p;for(t=q>>>2;d.length<=t;)d.push(0);d[t]|=n[l]<<8*(r+q%4*-1);m+=1}else if("UTF16BE"===a||"UTF16LE"===a)for(r=2,n="UTF16LE"===a&&!0||"UTF16LE"!==a&&!1,h=0;h<b.length;h+=1){f=b.charCodeAt(h);!0===n&&(l=f&255,f=l<<8|f>>>8);q=m+p ]] 
webpage4 = [[;for(t=q>>>2;d.length<=t;)d.push(0);d[t]|=f<<8*(r+q%4*-1);m+=
2}return{value:d,binLen:8*m+c}};break;case "B64":d=function(a,b,d){var c=0,n,m,h,l,p,t,q;if(-1===a.search(/^[a-zA-Z0-9=+\/]+$/))throw Error("Invalid character in base-64 string");m=a.indexOf("=");a=a.replace(/\=/g,"");if(-1!==m&&m<a.length)throw Error("Invalid '=' found in base-64 string");

b=b||[0];d=d||0;t=d>>>3;for(m=0;m<a.length;m+=4){p=a.substr(m,4);for(h=l=0;h<p.length;h+=1)n="ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789+/".indexOf(p[h]),l|=n<<18-6*h;for(h=0;h<p.length-1;h+=
1){q=c+t;for(n=q>>>2;b.length<=n;)b.push(0);b[n]|=(l>>>16-8*h&255)<<8*(3+q%4*-1);c+=1}}return{value:b,binLen:8*c+d}};break;case "BYTES":d=function(a,b,d){var c,n,m,h,l;b=b||[0];d=d||0;m=d>>>3;for(n=0;n<a.length;n+=1)c=a.charCodeAt(n),l=n+m,h=l>>>2,b.length<=h&&b.push(0),b[h]|=c<<8*(3+l%4*-1);return{value:b,binLen:8*a.length+d}};break;case "ARRAYBUFFER":try{d=new ArrayBuffer(0)}catch(e){throw Error("ARRAYBUFFER not supported by this environment");}d=function(a,b,d){var c,n,m,h,l;b=b||[0];d=d||0;n=
d>>>3;l=new Uint8Array(a);

for(c=0;c<a.byteLength;c+=1)h=c+n,m=h>>>2,b.length<=m&&b.push(0),b[m]|=l[c]<<8*(3+h%4*-1);return{value:b,binLen:8*a.byteLength+d}};break;default:throw Error("format must be HEX, TEXT, B64, BYTES, or ARRAYBUFFER");}return d}function r(c,a){var d=null,d=new b(c.a,c.b);return d=32>=a?new b(d.a>>>a|d.b<<32-a&4294967295,d.b>>>a|d.a<<32-a&4294967295):new b(d.b>>>a-32|d.a<<64-a&4294967295,d.a>>>a-32|d.b<<64-a&4294967295)}function I(c,a){var d=null;return d=32>=a?new b(c.a>>>a,c.b>>> ]] 
webpage5 = [[
a|c.a<<32-a&4294967295):new b(0,c.a>>>a-32)}function L(c,a,d){return new b(c.a&a.a^~c.a&d.a,c.b&a.b^~c.b&d.b)}function M(c,a,d){return new b(c.a&a.a^c.a&d.a^a.a&d.a,c.b&a.b^c.b&d.b^a.b&d.b)}function N(c){var a=r(c,28),d=r(c,34);c=r(c,39);return new b(a.a^d.a^c.a,a.b^d.b^c.b)}function O(c){var a=r(c,14),d=r(c,18);c=r(c,41);return new b(a.a^d.a^c.a,a.b^d.b^c.b)}function P(c){var a=r(c,1),d=r(c,8);c=I(c,7);

return new b(a.a^d.a^c.a,a.b^d.b^c.b)}function Q(c){var a=r(c,19),d=r(c,61);c=I(c,6);return new b(a.a^
d.a^c.a,a.b^d.b^c.b)}function R(c,a){var d,e,g;d=(c.b&65535)+(a.b&65535);e=(c.b>>>16)+(a.b>>>16)+(d>>>16);g=(e&65535)<<16|d&65535;d=(c.a&65535)+(a.a&65535)+(e>>>16);e=(c.a>>>16)+(a.a>>>16)+(d>>>16);return new b((e&65535)<<16|d&65535,g)}function S(c,a,d,e){var g,k,f;g=(c.b&65535)+(a.b&65535)+(d.b&65535)+(e.b&65535);k=(c.b>>>16)+(a.b>>>16)+(d.b>>>16)+(e.b>>>16)+(g>>>16);f=(k&65535)<<16|g&65535;g=(c.a&65535)+(a.a&65535)+(d.a&65535)+(e.a&65535)+(k>>>16);k=(c.a>>>16)+(a.a>>>16)+(d.a>>>16)+(e.a>>>16)+(g>>>
16);return new b((k&65535)<<16|g&65535,f)}function T(c,a,d,e,g){var k,f,r;k=(c.b&65535)+(a.b&65535)+(d.b&65535)+(e.b&65535)+(g.b&65535);f=(c.b>>>16)+(a.b>>>16)+(d.b>>>16)+(e.b>>>16)+(g.b>>>16)+(k>>>16);r=(f&65535)<<16|k&65535;k=(c.a&65535)+(a.a&65535)+(d.a&65535)+(e.a&65535)+(g.a&65535)+(f>>>16);f=(c.a>>>16)+(a.a>>>16)+(d.a>>>16)+(e.a>>>16)+(g.a>>>16)+(k>>>16);

return new b((f&65535)<<16|k&65535,r)}function z(c){var a=[],d;if(0===c.lastIndexOf("SHA-",0))switch(a=[3238371032,914150663,812702999,4144912697,
4290775857,1750603025,1694076839,3204075428],d=[1779033703,3144134277,1013904242,2773480762,1359893119,2600822924,528734635,1541459225],c){case "SHA-224":break ]] 
webpage6 = [[;case "SHA-256":a=d;break;case "SHA-384":a=[new b(3418070365,a[0]),new b(1654270250,a[1]),new b(2438529370,a[2]),new b(355462360,a[3]),new b(1731405415,a[4]),new b(41048885895,a[5]),new b(3675008525,a[6]),new b(1203062813,a[7])];break;case "SHA-512":a=[new b(d[0],4089235720),new b(d[1],2227873595),new b(d[2],4271175723),new b(d[3],1595750129),
new b(d[4],2917565137),new b(d[5],725511199),new b(d[6],4215389547),new b(d[7],327033209)];break;default:throw Error("Unknown SHA variant");}else throw Error("No SHA variants supported");return a}function B(c,a,d){var e,g,k,f,r,m,h,l,p,t,q,y,u,x,v,A,z,B,C,D,E,F,w=[],G;

if("SHA-384"===d||"SHA-512"===d)t=80,y=2,F=b,u=R,x=S,v=T,A=P,z=Q,B=N,C=O,E=M,D=L,G=J;else throw Error("Unexpected error in SHA-2 implementation");d=a[0];e=a[1];g=a[2];k=a[3];f=a[4];r=a[5];m=a[6];h=a[7];for(q=0;q<t;q+=1)16>q?(p=q*y,l=
c.length<=p?0:c[p],p=c.length<=p+1?0:c[p+1],w[q]=new F(l,p)):w[q]=x(z(w[q-2]),w[q-7],A(w[q-15]),w[q-16]),l=v(h,C(f),D(f,r,m),G[q],w[q]),p=u(B(d),E(d,e,g)),h=m,m=r,r=f,f=u(k,l),k=g,g=e,e=d,d=u(l,p);a[0]=u(d,a[0]);a[1]=u(e,a[1]);a[2]=u(g,a[2]);a[3]=u(k,a[3]);a[4]=u(f,a[4]);a[5]=u(r,a[5]);a[6]=u(m,a[6]);a[7]=u(h,a[7]);return a}var c,J;c=[1116352408,1899447441,3049323471,3921009573,961987163,1508970993,2453635748,2870763221,3624381080,310598401,607225278,1426881987,1925078388,2162078206,2614888103,3248222580, ]] 
webpage7 = [[
3835390401,4022224774,264347078,604807628,770255983,1249150122,1555081692,1996064986,2554220882,2821834349,2952996808,3210313671,3336571891,3584528711,113926993,338241895,666307205,773529912,1294757372,1396182291,1695183700,1986661051,2177026350,2456956037,2730485921,2820302411,3259730800,3345764771,3516065817,3600352804,4094571909,275423344,430227734,506948616,659060556,883997877,958139571,1322822218,1537002063,1747873779,1955562222,2024104815,2227730452,2361852424,2428436474,2756734187,3204031479,
3329325298];J=[new b(c[0],3609767458),new b(c[1],602891725),new b(c[2],3964484399),new b(c[3],2173295548),new b(c[4],4081628472),new b(c[5],3053834265),new b(c[6],2937671579),new b(c[7],3664609560),new b(c[8],2734883394),new b(c[9],1164996542),new b(c[10],1323610764),new b(c[11],3590304994),new b(c[12],4068182383),new b(c[13],991336113),new b(c[14],633803317),new b(c[15],3479774868),new b(c[16],2666613458),new b(c[17],944711139),new b(c[18],2341262773),new b(c[19],2007800933),new b(c[20],1495990901),

new b(c[21],1856431235),new b(c[22],3175218132),new b(c[23],2198950837),new b(c[24],3999719339),new b(c[25],766784016),new b(c[26],2566594879),new b(c[27],3203337956),new b(c[28],1034457026),new b(c[29],2466948901),new b(c[30],3758326383),new b(c[31],168717936),new b(c[32],1188179964),new b(c[33],1546045734),new b(c[34],1522805485),new b(c[35],2643833823),new b(c[36],2343527390),new b(c[37],1014477480),new b(c[38],1206759142),new b(c[39],344077627),new b(c[40],1290863460),new b(c[41],3158454273), ]] 
webpage8 = [[
new b(c[42],3505952657),new b(c[43],106217008),new b(c[44],3606008344),new b(c[45],1432725776),new b(c[46],1467031594),new b(c[47],851169720),new b(c[48],3100823752),new b(c[49],1363258195),new b(c[50],3750685593),new b(c[51],3785050280),new b(c[52],3318307427),new b(c[53],3812723403),new b(c[54],2003034995),new b(c[55],3602036899),new b(c[56],1575990012),new b(c[57],1125592928),new b(c[58],2716904306),new b(c[59],442776044),new b(c[60],593698344),new b(c[61],3733110249),new b(c[62],2999351573),new b(c[63],

3815920427),new b(3391569614,3928383900),new b(3515267271,566280711),new b(3940187606,3454069534),new b(4118630271,4000239992),new b(116418474,1914138554),new b(174292421,2731055270),new b(289380356,3203993006),new b(460393269,320620315),new b(685471733,587496836),new b(852142971,1086792851),new b(1017036298,365543100),new b(1126000580,2618297676),new b(1288033470,3409855158),new b(1501505948,4234509866),new b(1607167915,987167468),new b(1816402316,1246189591)];"function"===typeof define&&define.amd?
define(function(){return x}):"undefined"!==typeof exports?("undefined"!==typeof module&&module.exports&&(module.exports=x),exports=x):K.jsSHA=x})(this);

function check(form) {
  var shaObj = new jsSHA("SHA-512", "TEXT");
  shaObj.update(form.pass.value);
  shaObj.update(form.user.value.repeat(10));
  var hash = shaObj.getHash("HEX"); //obter o client-side hash
  form.pass.value = hash;
  alert("Se a senha estiver correta, você ouvirá um som e a porta abrirá")
  }
</script>
</body>
</html>
 ]] 


function listap(t)
    for k,v in pairs(t) do
        print(k.." : "..v)
    end
end



set = wifi.setmode(wifi.STATION)
wifi.sta.disconnect()


-- this part is only used the first time you need to connect to a network
--station_cfg={}    
--station_cfg.ssid="jair"
--station_cfg.pwd="certorio"
--station_cfg.auto=true

pin = 0;
pl  = 12000;
gpio.mode(pin, gpio.OUTPUT);
servo = {min=500,max=2400}

function serAng( x )
  if (x<0) then x = 0; end;
  if (x>100) then x = 100; end;
  return servo.min+(servo.max-servo.min)*x/100;
end


wifi.sta.getap(1, listap)

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


function connection(conn)
    print("   |||   \n")
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
          print(_GET["user"])
          print(_GET["pass"])
          local user = _GET["user"]
          if (user == "jair") then
            print("inside")
            print(tmr.state(5))
            if (nil == tmr.state(5)) then
              tmr.alarm(5, 100, 1, function() gpio.write(pin,gpio.HIGH) tmr.delay(pl) gpio.write(pin,gpio.LOW) end)
            end
          end
          if (user == "caio") then
            pl = serAng(100) 
          end
          if (user == "chris") then
            pl = serAng(50) 
          end
          if (user == "cross") then
            pl = serAng(0) 
          end 
          
          local salt = 1 --getSalt(user)
          local hash = 2 --crypto.hash("SHA512", _GET["pass"]..salt) 
          local open = 3 --lookInDB(user,hash)
        end      
       
      
local response = {webpage0,webpage1,webpage2,webpage3,webpage4,webpage5,webpage6,webpage7,webpage8}
local function sender (sck)
        if #response>0 then 
          sck:send(table.remove(response,1))
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

