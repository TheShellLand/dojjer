#FROM centos:7
FROM centos/systemd

LABEL maintainer="naisanza@gmail.com"
LABEL description="Splunk Phantom"
LABEL dockername="theshellland/phantom-docker"
LABEL dockertag="0.1.0"
LABEL version="0.1.0"

# update
RUN set -xe; yum update -y

# install deltarpm
RUN set -xe; yum install -y deltarpm

# install phantom
RUN set -xe; rpm -Uvh --force https://repo.phantom.us/phantom/4.6/base/7/x86_64/phantom_repo-4.6.19142-1.x86_64.rpm

ENV entry_user ENTER EMAIL
ENV entry_passwd ENTER PASSWORD
ENV proceed y

RUN sed -i '345,364d' /opt/phantom/bin/phantom_setup.sh
RUN sed -i 's/^unset*/#/' /opt/phantom/bin/phantom_setup.sh
RUN sed -i 's/^read*/#/' /opt/phantom/bin/phantom_setup.sh
RUN sed -i 's/read -r proceed*/#/' /opt/phantom/bin/phantom_setup.sh

VOLUME ["/opt/phantom/data"]
VOLUME ["/opt/phantom/apps"]
VOLUME ["/opt/phantom/local_data/app_states"]
VOLUME ["/opt/phantom/scm"]
VOLUME ["/opt/phantom/vault"]
VOLUME ["/opt/phantom/tmp/shared/"]

RUN set -x; /opt/phantom/bin/phantom_setup.sh install --no-prompt

EXPOSE 22 80 443 8888 4369 5671 8300 8301 8302 15672 25672

ENTRYPOINT ["/opt/phantom/bin/start_phantom.sh"]
CMD ["/bin/bash"]
