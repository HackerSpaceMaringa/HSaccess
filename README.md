# HSaccess

Códigos para cadastrar usuários que possam entrar no HS Maringá e para permitir o acesso, feito via WiFi com uma NodeMCU
 
## cadastro.html

Recebe usuário, senha e repetição da senha e gera um JSON com usuário, salt e um server-hash (feito a partir de um SHA512(SHA512(senha+usuário)+salt)). O JSON deverá ser colocado pelo administrador no sistema para permitir o acesso da pessoa.

## mobile.html

Página que será entregue ao usuário que tentar acessar a porta do HS. Ele não funciona sem Javascript, pois precisa do mesmo para ser seguro. Ao receber o usuário e senha ele faz um client-hash (SHA512(senha+usuário)) e envia as duas informações para a NodeMCU. Para entregar a página é necessário quebrar a mesma em vários pedaços, varios substrings. Tal processo é feito manualmente atualmente (criar um código para fazer isso)

## init.lua

Código da NodeMCU. Se conecta a rede local (sendo possível criar a própria rede) e serve o mobile.html em pedaços. Recebe o usuário e o client-hash,...


# TODO
* Receber o usuário e o client-hash, pesquisar o usuário, pegar o salt relacionado, fazer server-hash e comparar com o armazenado.

* Código de controle do servo motor

* Código que soe um buzzer 




