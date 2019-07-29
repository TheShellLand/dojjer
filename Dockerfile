FROM nginx:1.17.2

LABEL maintainer="naisanza@gmail.com"
LABEL description="nginx with certbot"
LABEL dockername="theshellland/dojjer"
LABEL dockertag="certbot"
LABEL version="0.1"

WORKDIR /

COPY entry.sh .

# Install certbot-auto
RUN apt update \
  && apt install -y wget \
  && wget https://dl.eff.org/certbot-auto \
  && chmod a+x certbot-auto \
  && mv certbot-auto /usr/local/sbin/ \
  && certbot-auto renew


VOLUME ["/root"]
VOLUME ["/etc/letsencrypt"]
VOLUME ["/var/lib/letsencrypt"]
VOLUME ["/etc/nginx/conf.d"]

# run app
CMD ["/bin/bash"]
ENTRYPOINT ["/bin/bash", "/entry.sh"]
