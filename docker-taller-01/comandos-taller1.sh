docker run -it --rm -d -p 8080:80 --name web nginx
docker run -it --rm -d --name my-apache-app -p 8080:80 -v "$PWD":/usr/local/apache2/htdocs/ httpd:2.4
docker run -it --rm -d -p 8081:8080 tomcat:9.0