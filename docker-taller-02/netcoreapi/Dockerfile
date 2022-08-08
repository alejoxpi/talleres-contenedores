FROM mcr.microsoft.com/dotnet/sdk:6.0 AS build-env
WORKDIR /app
COPY . ./
RUN dotnet restore
RUN dotnet publish -c Release -o out
FROM mcr.microsoft.com/dotnet/aspnet:6.0
RUN apt-get update
RUN apt-get install iputils-ping curl -y
RUN apt-get upgrade -y
WORKDIR /app
COPY --from=build-env /app/out .
ENV ASPNETCORE_ENVIRONMENT=Development
ENTRYPOINT ["dotnet", "netcoreapi.dll"]