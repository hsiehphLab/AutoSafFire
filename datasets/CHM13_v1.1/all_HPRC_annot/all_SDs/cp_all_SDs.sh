#!/bin/bash


for FILE in /panfs/jay/groups/7/hsiehph/shared/hsiehph_shared/wgac_benson/genomicSDsFiles/*.tab; do
	sample_name=$(basename $FILE | cut -d . -f1)
	
#	cp $FILE /home/hsiehph/shared/javid017-home/jobs/AutoSafFire/datasets/CHM13_v1.1/all_HPRC_annot/all_SDs/${sample_name}_temp.txt
	cut -f 1-4 $FILE | sort | uniq | awk '{print $1 "\t" $2 "\t" $3 "\t\t\t" $4}' > ${sample_name}_T2T_annot.bed
	sed -i '1i#ct	st	en	name	score	strand	tst	ten	color' /home/hsiehph/shared/javid017-home/jobs/AutoSafFire/datasets/CHM13_v1.1/all_HPRC_annot/all_SDs/${sample_name}_T2T_annot.bed

done


