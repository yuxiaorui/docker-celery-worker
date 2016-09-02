FROM python:2.7-slim

MAINTAINER Yu XiaoRui <yxiaorui2012@gmail.com>

RUN set -x \
	&& buildDeps=' \
		curl \
		g++ \
		gcc \
		libbz2-dev \
		libc6-dev \
		libffi-dev \
		libmysqld-dev \
		libncurses-dev \
		libreadline-dev \
		libsqlite3-dev \
		libssl-dev \
		libxml2-dev \
		libxslt-dev \
		libblas-dev \
		liblapack-dev \
		libatlas-base-dev \
		gfortran \
		make \
		supervisor \
		xz-utils \
		zlib1g-dev \
	' \
	&& apt-get update && apt-get install -y $buildDeps --no-install-recommends && rm -rf /var/lib/apt/lists/*
RUN pip install --no-cache-dir virtualenv
RUN pip install lxml \
 && pip install pyopenssl \
 && pip install mysql \
 && pip install 'MySQL-python<=1.2.3' \
 && pip install leancloud-sdk \
 && pip install Celery \
 && pip install sqlalchemy \
 && pip install pymongo \
 && pip install pandas \
 && pip install Scrapy

VOLUME ["/opt/celery/worker"]
WORKDIR /opt/celery/worker
ENTRYPOINT ["celery"]
