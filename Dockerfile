#FROM busybox as builder
FROM ubuntu as builder
WORKDIR /app

RUN apt-get update && apt-get install -y wget tree
COPY --chmod=0755 build.sh /usr/bin
RUN build.sh

FROM nginx as final
COPY --from=0 /app /usr/share/nginx/html
