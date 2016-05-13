FROM debian:latest

RUN apt-get update
RUN apt-get install -y python default-jre-headless python-tk python-pip python-dev libxml2-dev libxslt-dev zlib1g-dev
RUN pip install bzt
RUN pip install --upgrade bzt

COPY . /scripts

WORKDIR /scripts

CMD ["bzt" , "quick_test.yml", "-o", "modules.console.disable=true", "-report", "-o", "modules.blazemeter.browser-open=none"]

