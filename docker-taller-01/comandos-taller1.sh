git clone https://github.com/alejoxpi/talleres-contenedores.git
#########
Set-ExecutionPolicy -ExecutionPolicy RemoteSigned -Scope LocalMachine
#########
docker run -it --rm -d -p 8080:80 --name web nginx
docker run -it --rm -d -p 8081:8080 tomcat:9.0
docker run -it --rm -d -p 8082:3000 ndroidxpi/nodeapptaller01:latest

