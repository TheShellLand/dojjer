FROM ubuntu:20.04

LABEL maintainer="naisanza@gmail.com"
LABEL description="For all your devops things"

COPY entry.sh /

WORKDIR /install
RUN apt update && apt install -y git
RUN git clone https://github.com/TheShellLand/antsable && \
    cd antsable && \
    ./install-ansible.sh && \
    ./ansible.sh playbooks/ldap.yml && \
    ./ansible.sh playbooks/devops.yml && \
    ./ansible.sh playbooks/apt_upgrade.yml

WORKDIR /root

VOLUME ["/root"]

# ssh port
EXPOSE 22

# shell
CMD ["/bin/bash"]

# start ssh
ENTRYPOINT ["/bin/bash", "/entry.sh"]
