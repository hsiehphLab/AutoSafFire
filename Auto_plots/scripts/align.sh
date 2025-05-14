#!/bin/bash
#SBATCH --time=00:30:00
#SBATCH --mem=100g
#SBATCH --cpus-per-task=15
#SBATCH --ntasks=1
#SBATCH --partition=sioux,msismall,msilarge

module load minimap2/2.26

minimap2 -K 32G -t 15 -c -x asm20 --secondary=no --eqx -s 25000 "$1" "$2" > "$3"

