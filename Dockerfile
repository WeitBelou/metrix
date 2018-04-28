FROM python:2.7
RUN mkdir /app

WORKDIR /app

ADD . .

ENTRYPOINT ["/app/metrixpp.sh"]