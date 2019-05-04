FROM ubuntu:18.04

LABEL maintainer="naisanza@gmail.com"
LABEL description="For all your devops things"
LABEL dockername="theshellland/dojjer"
LABEL dockertag="ssh"
LABEL version="0.1"

ENV APP /app

RUN apt update && apt install -y git
RUN mkdir -p $APP \
    && cd $APP \
    \
    # clone repo
    && git clone https://github.com/TheShellLand/antsable \
    \
    # install
    && ./antsable/shells/ssh-docker.sh \
    \
    # cleanup
    && rm -rf $APP \
    && apt autoclean -y; apt clean; apt autoremove -y

# ssh keys
VOLUME ["/etc/ssh"]

# ssh port
EXPOSE 22

# shell
CMD ["/bin/bash"]

