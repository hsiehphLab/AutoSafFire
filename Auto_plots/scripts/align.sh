#!/bin/bash
#SBATCH --time=1:00:00
#SBATCH --mem=100g
#SBATCH --cpus-per-task=10
#SBATCH --ntasks=1
#SBATCH --partition=sioux,msismall,msilarge

module load minimap2/2.26

minimap2 -K 48G -t 10 -c -x asm20 --secondary=no --eqx -s 25000 "$1" "$2" > "$3"

