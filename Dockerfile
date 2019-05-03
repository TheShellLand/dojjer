FROM ubuntu:18.04

LABEL maintainer="naisanza@gmail.com"
LABEL description="For all your devops things"
LABEL dockername="theshellland/dojjer:devops"
LABEL version="0.1"

ENV APP /app
RUN mkdir -p $APP
WORKDIR $APP

RUN apt update && apt install -y git
RUN git clone https://github.com/TheShellLand/antsable

# install
RUN /bin/bash antsable/shells/devops.sh

# cleanup
RUN apt autoclean -y && apt clean && apt autoremove -y
RUN rm -rf $APP

# run app
CMD ["/bin/bash"]

