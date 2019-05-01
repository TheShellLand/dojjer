FROM python:3

LABEL maintainer="naisanza@gmail.com"
LABEL description="dojjer template"
LABEL dockername="theshellland/dojjer:python3"
LABEL version="0.1"

ENV APP /app
COPY app $APP
WORKDIR $APP

RUN python3 -m venv venv
RUN . venv/bin/activate
RUN python3 -m pip install --upgrade pip -r requirements.txt

# run tests
#RUN python3 -m pytest

# run app
ENTRYPOINT ["python3", "app.py"]

