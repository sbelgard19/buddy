# Orig "base image" 
# FROM ubuntu:18.04 

#CHAINGUARD "base images"
FROM cgr.dev/chainguard/wolfi-base
RUN apk add nginx

COPY html/index.html       /var/lib/nginx/html/index.html
COPY html/images/Buddy.jpg /var/lib/nginx/html/images/Buddy.jpg
COPY html/images/Jagger.jpg /var/lib/nginx/html/images/Jagger.jpg

COPY html/okta.html       /var/lib/nginx/html/index.html

COPY nginx.conf 		/etc/nginx/nginx.conf
COPY ca-certificates.crt 	/etc/ssl/certs/ca-certificates.crt
COPY My-NGINX.cer 		/etc/nginx/cert.pem
COPY My-NGINX.key 		/etc/nginx/cert.key

RUN mkdir /var/lib/nginx/tmp/
RUN adduser -D nginx

#EXPOSE 80
EXPOSE 443
CMD ["/usr/sbin/nginx", "-g", "daemon off;"]


