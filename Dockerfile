FROM busybox AS builder
WORKDIR /app
COPY --chmod=0755 build.sh /usr/bin
RUN build.sh

FROM lipanski/docker-static-website:latest AS final
COPY --from=0 /app ./
