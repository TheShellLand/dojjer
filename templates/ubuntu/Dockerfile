FROM ubuntu:18.04

LABEL maintainer="naisanza@gmail.com"
LABEL description="dojjer template"
LABEL dockername="theshellland/dojjer"
LABEL dockertag="ubuntu"
LABEL version="0.1"

ENV APP /app
WORKDIR $APP

COPY app .

# run app
ENTRYPOINT ["/bin/bash", "app.sh"]

