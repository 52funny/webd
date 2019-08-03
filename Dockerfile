FROM alpine:latest

MAINTAINER 52funny

ENV TZ=Asia/Shanghai

ADD file/webd /temp/webd

RUN sed -i 's/dl-cdn.alpinelinux.org/mirrors.ustc.edu.cn/g' /etc/apk/repositories

RUN \
   echo "starting...." \
   #&& echo https://mirrors.tuna.tsinghua.edu.cn/alpine/edge/main > /etc/apk/repositories \
   #&& echo https://mirrors.tuna.tsinghua.edu.cn/alpine/edge/community >> /etc/apk/repositories \
   && chmod +x /temp/webd \
   && apk add libgcc
EXPOSE 80
VOLUME ["/mnt"]
ENTRYPOINT /temp/webd -l 80 -w /mnt

