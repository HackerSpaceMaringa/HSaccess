# HSaccess

Códigos para cadastrar usuários que possam entrar no HS Maringá e para permitir o acesso, feito via WiFi com uma NodeMCU
 
## cadastro.html

Recebe usuário, senha e repetição da senha e gera um JSON com usuário, salt e um server-hash (feito a partir de um SHA512(SHA512(senha+usuário)+salt)). O JSON deverá ser colocado pelo administrador no sistema para permitir o acesso da pessoa.

## mobile.html

Página que será entregue ao usuário que tentar acessar a porta do HS. Ele não funciona sem Javascript, pois precisa do mesmo para ser seguro. Ao receber o usuário e senha ele faz um client-hash (SHA512(senha+usuário)) e envia as duas informações para a NodeMCU. Para entregar a página é necessário quebrar a mesma em vários pedaços, varios substrings. Tal processo é feito manualmente atualmente (criar um código para fazer isso)

## init.lua

Código da NodeMCU. Se conecta a rede local (sendo possível criar a própria rede) e serve o mobile.html em pedaços. Recebe o usuário e o client-hash, procura em um arquivo se o usuário existe e a senha está correta. Se estiver, abre a trava da porta com um servo motor.

Para gravar o firmware
esptool.py --port /dev/ttyUSB0 write_flash --flash_mode dio --flash_size detect 0x0 /home/certorio/Downloads/nodemcu-master-7-modules-2017-12-27-02-34-19-float.bin 


para enviar todos os arquivos
```bash
bash upload.sh
```
para enviar um arquivo 
```bash
nodemcu-uploader upload init.lua
```
para se comunicar por serial

```bash
screen /dev/ttyUSB0 115200,cs8
```


