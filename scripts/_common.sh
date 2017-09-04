# common.sh

ROCKETCHAT_VERSION=0.58.1
ROCKETCHAT_SHASUM=49650c68339f5e862a8db45eef3ffbeb5da0e425f186ebcefa50f7e89e1a567c
NODE_VERSION=4.7.1

waitforservice() {
  isup=false; x=90; while [ $x -gt 0 ];do echo "Waiting approx. $x seconds..."; \
  x=$(( $x - 1 )); sleep 1; if $(curl -m 1 -s localhost:$port${path:-/}/api/v1/info | \
  grep -e "success.*true" >/dev/null 2>&1); then isup=true; break; fi; done && if $isup; \
  then echo "service is up"; else ynh_die "$app could not be started"; fi
}