FROM ubuntu:18.04

LABEL maintainer="naisanza@gmail.com"
LABEL description="An engineer's environment"
LABEL dockername="theshellland/dojjer"
LABEL dockertag="readyup"
LABEL version="0.1"

ENV APP /app
WORKDIR $APP

RUN apt update && apt upgrade -y
RUN apt update && apt install -y git
RUN \
    # clone repo
    git clone https://github.com/TheShellLand/antsable \
    \
    # install
    && cd antsable \
    && chmod +x shells/*.sh \
    && ./shells/readyup.sh \
    \
    # cleanup
    && rm -rf $APP \
    && apt autoclean -y; apt clean; apt autoremove -y

# copy entrypoint
COPY entry.sh /

WORKDIR /root

# ssh keys
VOLUME ["/etc/ssh"]
VOLUME ["/root"]

# ssh port
EXPOSE 22

# shell
CMD ["/bin/bash"]

# start ssh
ENTRYPOINT ["/bin/bash", "/entry.sh"]

