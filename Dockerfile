FROM centos:7


LABEL maintainer="naisanza@gmail.com"
LABEL description="Splunk Phantom"
LABEL dockername="theshellland/phantom-docker"
LABEL dockertag="phantom-docker"
LABEL version="0.1"

# install phantom
RUN set -xe; rpm -Uvh --force https://repo.phantom.us/phantom/4.6/base/7/x86_64/phantom_repo-4.6.19142-1.x86_64.rpm

ENV entry_user ENTER EMAIL
ENV entry_passwd ENTER PASSWORD
ENV proceed y

RUN sed -i 's/unset*//' /opt/phantom/bin/phantom_setup.sh
RUN sed -i 's/^read*//' /opt/phantom/bin/phantom_setup.sh
RUN sed -i 's/read -r proceed*//' /opt/phantom/bin/phantom_setup.sh

RUN /opt/phantom/bin/phantom_setup.sh install --no-prompt

EXPOSE 80 443

CMD ["/bin/bash"]
