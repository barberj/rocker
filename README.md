Rocker is a Rails Docker Helloworld app.

One controller for the root path which simply displays ENV variables.

Docker image can be found at [https://registry.hub.docker.com/u/barberj/rocker/](https://registry.hub.docker.com/u/barberj/rocker/)
or can be built using Dockerfile found in this repository.

`docker build -t <desired_image_name> .`


Experiments with links

```
docker build -t rocker_web .
docker run -d -P --hostname rockerweb.com --name web rocker_web rails s -b 0.0.0.0 -p 3000
```

```
docker run -it --link web:web busybox
# env
WEB_ENV_RUBY_VERSION=2.2.2
HOSTNAME=e3fa7e3726de
SHLVL=1
HOME=/root
WEB_PORT=tcp://172.17.0.26:3000
WEB_NAME=/sleepy_yalow/web
WEB_ENV_RUBY_DOWNLOAD_SHA256=5ffc0f317e429e6b29d4a98ac521c3ce65481bfd22a8cf845fa02a7b113d9b44
WEB_ENV_BUNDLE_APP_CONFIG=/usr/local/bundle
TERM=xterm
PATH=/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin
WEB_ENV_RUBY_MAJOR=2.2
WEB_ENV_ORANGE=stuff
WEB_PORT_3000_TCP_ADDR=172.17.0.26
WEB_PORT_3000_TCP_PORT=3000
WEB_PORT_3000_TCP_PROTO=tcp
PWD=/
WEB_ENV_GEM_HOME=/usr/local/bundle
WEB_PORT_3000_TCP=tcp://172.17.0.26:3000
```

```
docker run -it --hostname test.rockerweb.com  rocker_web sh
# env
RUBY_MAJOR=2.2
HOSTNAME=test.rockerweb.com
HOME=/root
BUNDLE_APP_CONFIG=/usr/local/bundle
RUBY_VERSION=2.2.2
TERM=xterm
PATH=/usr/local/bundle/bin:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin
GEM_HOME=/usr/local/bundle
ORANGE=stuff
RUBY_DOWNLOAD_SHA256=5ffc0f317e429e6b29d4a98ac521c3ce65481bfd22a8cf845fa02a7b113d9b44
PWD=/src
# cat /etc/hosts
172.17.0.29     test.rockerweb.com rockerweb
127.0.0.1       localhost
::1     localhost ip6-localhost ip6-loopback
fe00::0 ip6-localnet
ff00::0 ip6-mcastprefix
ff02::1 ip6-allnodes
ff02::2 ip6-allrouters
```
