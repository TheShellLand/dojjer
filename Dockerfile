FROM ubuntu:18.04

LABEL maintainer="naisanza@gmail.com"
LABEL description="For all your devops things"
LABEL dockername="theshellland/dojjer:devops"
LABEL version="0.1"

RUN apt update && apt install -y git
RUN git clone https://github.com/TheShellLand/antsable

ENV APP /antsable
WORKDIR $APP

# install
RUN /bin/bash shells/devops.sh

# run app
CMD ["/bin/bash"]

