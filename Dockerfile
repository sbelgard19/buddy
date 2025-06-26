# Orig "base image" 
# FROM ubuntu:18.04 

# CHAINGUARD "base images"
# FROM cgr.dev/chainguard/wolfi-base

ARG BASE_REGISTRY=cgr.dev
ARG BASE_IMAGE=chainguard/wolfi-base
ARG BASE_TAG="latest"

#IronBank 17-June-2024
#ARG BASE_REGISTRY=registry1.dso.mil

#UBI9
#ARG BASE_IMAGE=ironbank/redhat/ubi/ubi9
#ARG BASE_TAG="9.3"

#NGINX
#ARG BASE_IMAGE=ironbank/opensource/nginx/nginx
#ARG BASE_TAG="1.26.1"

FROM ${BASE_REGISTRY}/${BASE_IMAGE}:${BASE_TAG}
RUN apk add nginx

# or okta
# COPY html/okta.html       /var/lib/nginx/html/index.html
# or normal

COPY html/index.html       /var/lib/nginx/html/index.html
COPY html/images/Buddy.jpg /var/lib/nginx/html/images/Buddy.jpg
COPY html/images/Jagger.jpg /var/lib/nginx/html/images/Jagger.jpg

COPY nginx.conf 			/etc/nginx/nginx.conf
COPY ca-certificates.crt 		/etc/ssl/certs/ca-certificates.crt
COPY NGINX-18-June-2024-B.cer 		/etc/nginx/cert.pem
COPY NGINX-18-June-2024-B.key 		/etc/nginx/cert.key

COPY NGINX-13-May-2025.cer 		/etc/nginx/cert.pem
COPY NGINX-29-Apr-2025.key 		/etc/nginx/cert.key
# COPY full-chain.pem 		        /etc/nginx/cert.pem
  
RUN mkdir /var/lib/nginx/tmp/
RUN adduser -D nginx

EXPOSE 80
EXPOSE 443
CMD ["/usr/sbin/nginx", "-g", "daemon off;"]
# CMD ["nginx", "-g", "daemon off;"]

## #

