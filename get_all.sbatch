#!/bin/bash
#!/bin/bash
#SBATCH --output=/scratch/Users/zama8258/generic/e_and_o/%x_%j.out
#SBATCH --error=/scratch/Users/zama8258/generic/e_and_o/%x_%j.err
#SBATCH -p short
#SBATCH -N 1
#SBATCH -c 8
#SBATCH --mem=16gb
#SBATCH --mail-user=zama8258@colorado.edu

set -euo pipefail

module load singularity
container=/scratch/Users/zama8258/transcode/transcode.sif

find . -iname files.txt -execdir singularity exec "$container" \
		 aria2c --input-file={} \;
