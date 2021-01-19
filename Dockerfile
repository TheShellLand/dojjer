FROM ubuntu:20.04

LABEL maintainer="naisanza@gmail.com"
LABEL description="An engineer's environment"

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
    && ./ansible.sh playbooks/readyup.yml \
    && ./ansible.sh playbooks/apt_upgrade.yml \
    \
    # cleanup
    && rm -rf $APP

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
