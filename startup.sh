#!/bin/sh
sudo chgrp 1984 /motion-images
sudo chmod 775 /motion-images
# run for debugging
#docker run -a stdout -a stderr -p 8081:8081 -v /home/core/docker_motion/config:/home/docker_motion/.motion -v /motion-images:/home/docker_motion/images docker_motion
# for running as daemond
docker run -d -p 8081:8081 -v /home/core/docker_motion/config:/home/docker_motion/.motion -v /motion-images:/home/docker_motion/images docker_motion
sudo systemctl start motion_upload.timer
