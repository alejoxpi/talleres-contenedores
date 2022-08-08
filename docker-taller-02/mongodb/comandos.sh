docker run -d \
--name mongoserver \
-p 27017:27017 \
-e MONGO_INITDB_ROOT_USERNAME=mongoadmin \
-e MONGO_INITDB_ROOT_PASSWORD=92a09f7ab296d2dee9cd \
-v /tmp/mongodata:/data/db \
--expose 27017 --network vnet01 \
mongo:latest


#docker network create vnet01
#docker network ls
#docker network inspect bridge
#docker network inspect vnet01

#docker stop mongoserver
#docker rm mongoserver