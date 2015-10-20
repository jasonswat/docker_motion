I was hoping to add a cron job to delete the files after a number of days

```
COPY config/crontab /var/spool/crontab/root
```

Where the contents of config/crontab is:

```
01 04 * * * /usr/bin/find /home/docker_motion/images -type f -mtime +3 -exec rm -rf {} +
```

apparently crond doesn't really run like that in a container
so I added the cron entry to the docker server hosting the 
container until I can figure out how to add it to the container
