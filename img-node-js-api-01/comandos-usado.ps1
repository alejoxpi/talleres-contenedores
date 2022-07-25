docker login
docker build . -t nodeapptaller01
docker build . -t ndroidxpi/nodeapptaller01:latest
docker push ndroidxpi/nodeapptaller01:latest