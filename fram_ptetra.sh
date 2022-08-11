#!/bin/bash

#SBATCH --job-name=Ptjob10
#SBATCH --account=nn9299k
#SBATCH --time=48:00:00
#SBATCH --nodes=1 --ntasks-per-node=4 --cpus-per-task=1 #FRAM
#SBATCH --mail-type=END,FAIL
#SBATCH --mail-user=sadhi@uio.no

set -o errexit # Exit the script on any error
set -o nounset # Treat any unset variables as an error

module purge
module load foss/2021b


rm -f .quit .output .restartfile
mpirun ./mptetra > mptetra.log
