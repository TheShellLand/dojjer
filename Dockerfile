FROM registry:2

LABEL maintainer="naisanza@gmail.com"
LABEL description="dojjer template"
LABEL dockername="theshellland/dojjer"
LABEL dockertag="private-registry"
LABEL version="0.1"

WORKDIR /root

VOLUME ["/root"]

# run app
CMD ["/bin/bash"]

