FROM php:8.2-alpine@sha256:b5884ca8bf409cf571b321143ff30cfea16b9abab7245b9742343d3eee4abf3b

ENV REVIEWDOG_VERSION=v0.14.1

RUN apk --no-cache add git
RUN wget -O - -q https://raw.githubusercontent.com/reviewdog/reviewdog/master/install.sh| sh -s -- -b /usr/local/bin/
RUN wget -c https://github.com/phpstan/phpstan/releases/latest/download/phpstan.phar && mv phpstan.phar /usr/local/bin

COPY entrypoint.sh /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]
