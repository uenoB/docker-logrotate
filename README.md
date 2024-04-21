# docker-logrotate

This is a Docker container image of logrotate constructed atop [distroless].

[distroless]: https://github.com/GoogleContainerTools/distroless

## Setup

```sh
docker pull ghcr.io/uenob/logrotate
```

## Usage

Mount a volume containing the following to `/data`.
- `etc/logrotate.conf`: configuration file
- `var/lib/logrotate.status`: state file

For example:
```sh
docker run -v conf:/data/etc:ro -v state:/data/var/lib ghcr.io/uenob/logrotate
```
