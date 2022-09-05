
 FROM nginx
 
 RUN apt-get update && apt-get upgrade -y
 
 COPY static-html-directory /usr/share/nginx/html
 
 EXPOSE 8080
 
 CMD ["nginx", "-g", "daemon off;"]