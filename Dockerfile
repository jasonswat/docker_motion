FROM debian:wheezy

MAINTAINER jason.swat@gmail.com 

RUN apt-get update && apt-get install -q -y --no-install-recommends \
    libc6 \
    libc6-dev \
    libjpeg62 \
    libjpeg62-dev \
    zlib1g \
    zlib1g-dev \
    ffmpeg \
    bsd-mailx \
    motion \
    mutt \
    cron \
    ssmtp \
    x264

# Create the user and group
RUN groupadd -g 1984 docker_motion && useradd -u 1984 -g 1984 -G motion,video -d /home/docker_motion -m -c "Motion stream user" docker_motion

RUN mkdir -p /home/docker_motion/images /home/docker_motion/.motion && cp /usr/share/zoneinfo/America/Los_Angeles /etc/localtime

# Copy scripts
COPY scripts/* /home/docker_motion/

EXPOSE 8081
 
VOLUME ["/home/docker_motion"]

RUN chmod 775 /home/docker_motion/images && chgrp -R docker_motion /home/docker_motion/images
 
ENTRYPOINT ["/home/docker_motion/start.sh"]
