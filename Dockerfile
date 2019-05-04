FROM ubuntu:18.04

LABEL maintainer="naisanza@gmail.com"
LABEL description="For all your devops things"
LABEL dockername="theshellland/dojjer"
LABEL dockertag="devops"
LABEL version="0.1"

ENV APP /app
WORKDIR $APP

RUN apt update && apt install -y git
RUN \
    # clone repo
    git clone https://github.com/TheShellLand/antsable \
    \
    # install
    && ./antsable/shells/devops.sh \
    \
    # cleanup
    && rm -rf $APP \
    && apt autoclean -y; apt clean; apt autoremove -y

WORKDIR /root

# root
VOLUME ["/root"]

# shell
CMD ["/bin/bash"]

