#!/bin/bash


for FILE in /home/hsiehph/shared/javid017-home/jobs/AutoSafFire/datasets/Hsieh_HGSV_PNG/*; do
	file_name=$(basename $FILE)
	sample_name=$(echo $file_name | cut -d '_' -f1-2)
	echo "Hsieh_HGSV_PNG,datasets/Hsieh_HGSV_PNG/${file_name},${sample_name}_T2T,CHM13_v1.1" >> /home/hsiehph/shared/javid017-home/jobs/AutoSafFire/datasets/metadata.csv
done


