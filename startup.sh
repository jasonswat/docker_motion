docker run -a stdout -a stderr -a stdin -l debug -p 8081:8081 -v /home/core/docker_motion/config:/home/docker_motion/.motion -v /motion-images:/home/docker_motion/images docker_motion
