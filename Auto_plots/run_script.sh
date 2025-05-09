#!/bin/bash -l

#SBATCH --time=24:00:00

#SBATCH --ntasks=1
#SBATCH --mem=5g
#SBATCH --tmp=1g

source /projects/standard/hsiehph/shared/bin/initialize_conda.sh
conda activate snakemake



snakemake  -j 1
