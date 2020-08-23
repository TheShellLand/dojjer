FROM ubuntu:18.04

LABEL maintainer="naisanza@gmail.com"
LABEL description="For all your devops things"

COPY entry.sh /

WORKDIR /install
RUN apt update && apt install -y git
RUN git clone https://github.com/TheShellLand/antsable && \
    cd antsable && \
    ./ansible.sh playbooks/devops.yml && \
    ./shells/ssh-docker.sh && \
    ./ansible.sh playbooks/apt_upgrade.yml

WORKDIR /root

VOLUME ["/etc/ssh"]
VOLUME ["/root"]

# ssh port
EXPOSE 22

# shell
CMD ["/bin/bash"]

# start ssh
ENTRYPOINT ["/bin/bash", "/entry.sh"]
