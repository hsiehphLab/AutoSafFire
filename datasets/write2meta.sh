#!/bin/bash


for FILE in /home/hsiehph/shared/javid017-home/jobs/AutoSafFire/datasets/Hsieh_HPRCv2/*; do
	file_name=$(basename $FILE)
	sample_name=$(echo $file_name | cut -d '_' -f1-2)
	echo "Hsieh_HPRCv2,datasets/Hsieh_HPRCv2/${file_name},${sample_name}_GRCh38,GRCh38" >> /home/hsiehph/shared/javid017-home/jobs/AutoSafFire/datasets/metadata.csv
done


