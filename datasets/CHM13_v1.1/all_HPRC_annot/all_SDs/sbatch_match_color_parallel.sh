#!/bin/bash

#SBATCH --time=00:15:00
#SBATCH --job-name=annot_color
#SBATCH --cpus-per-task=1
#SBATCH --ntasks=1
#SBATCH --mem-per-cpu=5G
#SBATCH --mail-type=ALL
#SBATCH --partition=sioux,msismall,msilarge

cd /home/hsiehph/shared/javid017-home/jobs/AutoSafFire/datasets/CHM13_v1.1/all_HPRC_annot/all_SDs/
sed -e '1 ! s/$/\t\t\t\t\t\t162,162,162/' -i /home/hsiehph/shared/javid017-home/jobs/AutoSafFire/datasets/CHM13_v1.1/all_HPRC_annot/all_SDs/*.bed
for FILE in /home/hsiehph/shared/javid017-home/jobs/AutoSafFire/datasets/CHM13_v1.1/all_HPRC_annot/all_SDs/*.bed; do
	sbatch --partition sioux,msismall,msilarge --ntasks=1 --cpus-per-task=1 --mem=5G --time=04:00:00 match_color.sh "$FILE" &
done

wait
