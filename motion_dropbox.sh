#!/bin/bash
imagedir="/motion-images"
drophome="/home/core/Dropbox-Uploader"
minsize="830"
for file in $(ls ${imagedir})
do
  if [ -f "${imagedir}/${file}" ];then
    size=$(ls -bs ${imagedir}/${file}|awk '{print $1}')
    echo "size $size file $file"
    # if the file is greater than the minsize, we want to upload it
    if (( ${size} > ${minsize} ));then
      echo "${drophome}/dropbox_uploader.sh upload ${imagedir}/${file} ${file}"
      ${drophome}/dropbox_uploader.sh upload ${imagedir}/${file} ${file}
      if [ $? -eq 0 ]; then
        #echo "sudo rm -rf ${imagedir}/${file}"
        sudo rm -rf ${imagedir}/${file}
      fi
    else
      # file is too small, we don't want it
      echo "sudo rm -rf ${imagedir}/${file}"
      sudo rm -rf ${imagedir}/${file}
    fi
  fi
done
