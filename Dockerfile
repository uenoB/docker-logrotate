FROM debian:12 AS build
RUN apt-get update
RUN apt-get install -y --no-install-recommends logrotate gcc libc6-dev
COPY pause.c /root
RUN gcc -O2 -o /usr/bin/pause /root/pause.c

FROM gcr.io/distroless/base-nossl-debian12
COPY --from=build \
  /lib/x86_64-linux-gnu/libacl.so.1 \
  /lib/x86_64-linux-gnu/libselinux.so.1  \
  /lib/x86_64-linux-gnu/libpopt.so.0 \
  /lib/x86_64-linux-gnu/libpcre2-8.so.0 \
  /lib/x86_64-linux-gnu
COPY --from=build /usr/sbin/logrotate /usr/sbin
COPY --from=build /usr/bin/pause /usr/bin
CMD ["logrotate", \
     "-s", "/data/var/lib/logrotate.state", \
     "/data/etc/logrotate.conf"]
