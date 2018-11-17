# docker-popcorntime
Using popcorntime

---
Mapping display X for volume inside container "/tmp/.X11-unix:/tmp/.X11-unix"
Set environment "DISPLAY: $DISPLAY"
Remapping xhost "xhost local:root"

Create file docker-compose.yml
```version: '2'

services:
  app:
    image: cbsan/popcorntime
    restart: always
    environment:
      DISPLAY: $DISPLAY
    volumes:
      - "/tmp/.X11-unix:/tmp/.X11-unix"
      - "/dev:/dev"
    tty: true
```

Running:
``` $ docker-compose up -d
$docker-compose exec app popcorntime
```