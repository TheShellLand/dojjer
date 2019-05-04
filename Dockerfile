FROM ubuntu:18.04

LABEL maintainer="naisanza@gmail.com"
LABEL description="dojjer template"
LABEL dockername="theshellland/dojjer"
LABEL dockertag="bash"
LABEL version="0.1"

WORKDIR /root

VOLUME ["/root"]

# run app
CMD ["/bin/bash"]

