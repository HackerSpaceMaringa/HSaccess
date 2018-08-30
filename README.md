# HSaccess

Códigos para cadastrar usuários que possam entrar no HS Maringá e para permitir o acesso, feito via WiFi com uma NodeMCU
 
## cadastro.html

Recebe usuário, senha e repetição da senha e gera uma linha de CSV com usuário, salt e um server-hash (feito a partir de um SHA512(SHA512(senha+usuário)+salt)). A linha de CSV deverá ser colocado pelo administrador no sistema para permitir o acesso da pessoa.

## mobile.html

Página que será entregue ao usuário que tentar acessar a porta do HS. Ele não funciona sem Javascript, pois precisa do mesmo para ser seguro. Ao receber o usuário e senha ele faz um client-hash (SHA512(senha+usuário)) e envia as duas informações para a NodeMCU. Para entregar a página é necessário quebrar a mesma em vários pedaços, varios substrings. Tal processo é feito manualmente atualmente (criar um código para fazer isso)

## init.lua

Código da NodeMCU. Se conecta a rede local (sendo possível criar a própria rede) e serve o mobile.html em pedaços. Recebe o usuário e o client-hash, procura em um arquivo se o usuário existe e a senha está correta. Se estiver, abre a trava da porta com um servo motor.

## access.log
Grava vários eventos dentro do sistema, para que o administrador possa recolher de tempos em tempos.

Para gravar o firmware
```bash
esptool.py --port /dev/ttyUSB0 write_flash --flash_mode dio --flash_size detect 0x0 /nodemcu-float.bin 
```

## exemplo de tabela de usuários
```csv
A,1b1aebb5ef08cc16c9f181e2d36d129c729c9b9e49feeabf9c3aa5b406da92c9ef97cf6f52276643878ffd9f85e5d3e1d569b0d1f31c9b7656b46186a44c022,2bf6b81d16b09953e128844643f5c22e609358c60b4f7eca251491efc8be93c1979b867619ef39bdabdc851d587b0f30666092b63aba5a9fd69c20fd1830742f
B,1318304c720f6cd8c9407973bbabeadd9f966c1859bae46394eb6b2d72b73b7af2d3e69c9532602872d5927041ab908a2e5bc7d5d63b95197a7451361d,976fa4001f3ccd5aa1015d2a61d505079e6199c84c9d02129d2bebcb6dee2d3a0e981e8ca016096a3483d75f4050131756d2b06990a60ad4ed9770698ce2a2de
C,1d7531e860f676c9d51614fde24199a18ee9ac39a2ffa126fd2afe16e57cc3c2462f3c315e346bd278b4ee8b839e217eaae272cb12a478e9f66b1fd971543a,7819ede1e36f01254507b3a24e0dbd11197d3871af6ec96970a926c9f345d1a84588e18144da6f753dea6ed0a030639d17eeec5c82411e14c1666022a1666740
```

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

