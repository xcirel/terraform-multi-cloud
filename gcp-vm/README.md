# VPN com Pritunl

## Configurações de database

Após subir a intância, acesse o navegador http://ip-do-servidor

Será solicitado a **setup-key**, para obtê-la, conecte via SSH e execute o comando abaixo.

```sh
sudo pritunl setup-key
```
Agora copie esta chave, cole campo e clique em **Save**.

## Configuração de usuário e senha (Admin) de acesso ao console
A partir de agora, já podemos ver a tela de login, porém, precisamos de um usuário e senha. Volte ao terminal, execute o comando abaixo para gerar um usuário e senha.

```sh
sudo pritunl default-password
```

Pronto, faça o login, você pode alterar o usuário e senha de sua preferência.

## Configurações do serviço

1. Acesse **Users** e clique no botão **Add Organization** para adicionar uma organização;
2. Agora, clique em **Add User** para criar um usuário para se conectar a VPN;
3. Vá em **Servers** e clique em **Add Server**dê o nome de sua preferência;
4. Anexe o servidor na organização criada no passo 1. Clique em **Attach Organization**.

Pronto, seu servidor já pode ser iniciado. Para isso, basta clicar no botão **Start Server**.

Você verá uma output similar a esta abaixo.

```sh
[snowy-waves-9104] 2024-06-29 14:01:57 Note: Treating option '--ncp-ciphers' as  '--data-ciphers' (renamed in OpenVPN 2.5).
[snowy-waves-9104] 2024-06-29 14:01:57 OpenVPN 2.5.9 x86_64-pc-linux-gnu [SSL (OpenSSL)] [LZO] [LZ4] [EPOLL] [PKCS11] [MH/PKTINFO] [AEAD] built on Sep 29 2023
[snowy-waves-9104] 2024-06-29 14:01:57 library versions: OpenSSL 3.0.2 15 Mar 2022, LZO 2.10
[snowy-waves-9104] 2024-06-29 14:01:57 TUN/TAP device tun0 opened
[snowy-waves-9104] 2024-06-29 14:01:57 net_iface_mtu_set: mtu 1500 for tun0
[snowy-waves-9104] 2024-06-29 14:01:57 net_iface_up: set tun0 up
[snowy-waves-9104] 2024-06-29 14:01:57 net_addr_v4_add: 192.168.227.1/28 dev tun0
[snowy-waves-9104] 2024-06-29 14:01:57 setsockopt(IPV6_V6ONLY=0)
[snowy-waves-9104] 2024-06-29 14:01:57 UDPv6 link local (bound): [AF_INET6][undef]:16347
[snowy-waves-9104] 2024-06-29 14:01:57 UDPv6 link remote: [AF_UNSPEC]
[snowy-waves-9104] 2024-06-29 14:01:57 Initialization Sequence Completed
[snowy-waves-9104] 2024-06-29 14:01:58 COM> SUCCESS: bytecount interval changed
```

Observe que uma vez que seu servidor foi iniciado, você tem uma **porta UDP** que precisará ser liberada no seu firewall.


## Conectando na sua VPN

Para finalizar, precisamos de um *client* instalado em nosso computador ou utilizar as configurações do sistema. Neste caso utilizaremos a primeira opção.

1. Faça o download e instale de acordo com o seu sistema operacional, [clique aqui](https://client.pritunl.com/). Observação: você pode usar outro client se preferir. 
2. Abra cliente do Pritunl e clique **Import** para importar sua chave.

Observe que não fizemos o download da chave do usuário que criamos previamente quando configuramos o serviço, então, volte no painel e, em **Users** clique no ícone de download para salvar sua chaves no seu computador. Vocẽ precisará descompactar o arquivo.

Pronto, clique em **Import**, selecione o arquivo da sua chave e clique em **Import**. Agora **Connect** e pronto!

Link de referência [server.](https://docs.pritunl.com/docs)