#!/bin/bash
imagedir="/motion-images"
#imagedir="."
drophome="/home/core/Dropbox-Uploader"
minsize="100000"
for file in $(ls ${imagedir})
do
  if [ -f "$file" ];then
    size=$(ls -bs ${imagedir}/${file}|awk '{print $1}')
    echo "size $size file $file"
    # if the file is greater than the minsize, we want to upload it
    if (( ${size} > ${minsize} ));then
      echo "${drophome}/dropbox_uploader.sh upload ${drophome}/${file} ${file}"
      #${drophome}/dropbox_uploader.sh upload ${imagedir}/${file} ${file}
      echo "${drophome}/dropbox_uploader.sh upload ${imagedir}/${file} ${file}"
      if [ $? -eq 0 ]; then
        echo "sudo rm -rf ${imagedir}/${file}"
        #sudo rm -rf ${imagedir}/${file}
      fi
    else
      # file is too small, we don't want it
      echo "sudo rm -rf ${imagedir}/${file}"
    fi
  fi
done
