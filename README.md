# docker_motion

### To Build

```
git clone git@github.com:jasonswat/docker_motion.git 
cd docker_motion
docker build -t docker_motion .

```

### To start the container

```
./startup,sh
```
### Use the motion_dropbox.sh script to upload to dropbox

The Dropbox-Uploader script from Andrea Fabrizi is also needed. 
The Dropbox-Uploader is what actually uploads to dropbox.

see https://github.com/andreafabrizi/Dropbox-Uploader

I use a systemd time to call motion_dropbox.sh every 10 minutes to upload files

Here is the service config for the timer:

```
cat /etc/systemd/system/motion_upload.service
[Unit]
Description=Uploads motion files to dropbox

[Service]
Type=oneshot
ExecStart=/usr/bin/sh -c '/usr/bin/su - core -c /home/core/docker_motion/motion_dropbox.sh' 
```
Here is the timer config:

```
cat /etc/systemd/system/motion_upload.timer
[Unit]
Description=Run motion_upload.service every 10 minutes

[Timer]
OnCalendar=*:0/10
```

To start the timers

```
systemctl start motion_upload.timer 
```

To enable at boot
```
systemctl enable motion_upload.timer 
```
