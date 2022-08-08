dotnet build .
dotnet run . --urls=http://localhost:5000

docker build . -t netcoreapi
docker run -d --name netcoreapi -p 5000:80 --network vnet01 netcoreapi:latest
docker exec -it nodeapi /bin/bash