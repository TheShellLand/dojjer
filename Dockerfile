FROM ubuntu:20.04

LABEL maintainer="naisanza@gmail.com"
LABEL description="Ansible in a container"

COPY entry.sh /

WORKDIR /
RUN apt update && apt install -y git
RUN git clone https://github.com/TheShellLand/antsable
WORKDIR /antsable
RUN ./install-ansible.sh && \
    ./ansible.sh playbooks/apt_upgrade.yml

VOLUME ["/antsable"]

# ssh port
EXPOSE 22

# shell
CMD ["/bin/bash"]

# start ssh
ENTRYPOINT ["/bin/bash", "/entry.sh"]
