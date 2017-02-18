FROM daocloud.io/peterz3g/docker_django198_py27 
MAINTAINER peterz3g <peterz3g@163.com>

RUN mkdir -p /code/vol
WORKDIR /code

COPY . /code/
ADD cron_jobs.txt /var/spool/cron/crontabs/root

RUN touch /code/jobs.log && \
chmod +x /code/entrypoint.sh && \
chmod 0600 /var/spool/cron/crontabs/root && \
pip install --upgrade pip && \
pip install -r /code/requirements.txt && \
apt-get clean && \
apt-get autoclean && \
rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/* && \
ls

EXPOSE 8000
ENTRYPOINT ["/bin/bash", "/code/entrypoint.sh"]
