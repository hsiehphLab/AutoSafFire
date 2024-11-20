#!/bin/bash

#SBATCH --output=output.%j.out
#SBATCH --error=output.%j.err

FILE=$1
file_name=$(basename $FILE)
cd /home/hsiehph/shared/javid017-home/jobs/AutoSafFire/datasets/CHM13_v1.1/all_HPRC_annot/all_SDs/
unliftedover_line_nums=$(grep -Fnf ../$file_name $file_name | cut -d : -f1 | tail -n +2)
for LINE in $unliftedover_line_nums; do	
	sed -i "${LINE}s/162,162,162/0,255,17/" $FILE
done


