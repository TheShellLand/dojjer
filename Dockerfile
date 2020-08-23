FROM ubuntu:18.04

LABEL maintainer="naisanza@gmail.com"
LABEL description="dojjer template"

WORKDIR /root

RUN apt update && apt upgrade -y

VOLUME ["/root"]

# run app
CMD ["/bin/bash"]

