FROM ubuntu:18.04

LABEL maintainer="naisanza@gmail.com"
LABEL description="dojjer template"
LABEL dockername="theshellland/dojjer"
LABEL dockertag="ubuntu"
LABEL version="0.1"

ENV APP /app
COPY app $APP
WORKDIR $APP

# run app
ENTRYPOINT ["/bin/bash", "app.sh"]

