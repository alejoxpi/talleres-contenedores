npm install express
npm install mongo
docker build . -t nodeapi
docker run -d --name nodeapi -p 3000:3000 --network vnet01 nodeapi:latest
docker exec -it nodeapi /bin/bash

#docker network inspect vnet01
#docker stop nodeapi
#docker rm nodeapi