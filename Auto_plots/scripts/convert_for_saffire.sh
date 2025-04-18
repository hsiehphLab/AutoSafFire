#!/bin/bash
#SBATCH --time=00:30:00
#SBATCH --mem=50g
#SBATCH --cpus-per-task=5
#SBATCH --ntasks=1
#SBATCH --partition=sioux,msismall,msilarge

module use /projects/standard/hsiehph/shared/modulefiles.local
module load rustybam/0.1.31

INPUT="$1"
OUTPUT="$2"

rustybam trim-paf "$INPUT" | rustybam break-paf --max-size 500 | rustybam orient | rustybam filter --paired-len 100000 | rustybam stats --paf > "$OUTPUT"

