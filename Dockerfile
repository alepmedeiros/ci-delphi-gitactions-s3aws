#Imagem do conteiner que executa o código
FROM debian:9

#Atualiza o repositório e baixa/instala o server/client ssh
RUN apt-get update && apt-get install openssh-server openssh-client -y

#Copia os arquivos do host para o conteiner
COPY . /

#Dando permissão de executação ao arquivo de script
RUN chmod +x entrypoint.sh

#Arquivo de script a ser executado quando o conteiner for iniciado ('entrypoint.sh')
ENTRYPOINT ["/entrypoint.sh"]
