#!/bin/bash


for FILE in /panfs/jay/groups/7/hsiehph/shared/javid017-home/jobs/seg_dups/athef_files/all_samples/pt2/filtered_genomicSD_liftedover_correctFMT/*.tab; do
	sample_name=$(basename $FILE | cut -d . -f1)
	cut -f 1-3,6 $FILE | grep -v "^chr" | sort -k1,1V -k2,2n -k3,3n | uniq | awk '{print $1 "\t" $2 "\t" $3 "\t\t\t" $4}' > ${sample_name}_T2T_annot.bed
	sed -i '1i#ct	st	en	name	score	strand	tst	ten	color' /home/hsiehph/shared/javid017-home/jobs/AutoSafFire/datasets/CHM13_v1.1/all_HPRC_annot/${sample_name}_T2T_annot.bed
done

