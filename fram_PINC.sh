#!/bin/bash

# Job name:
#SBATCH --job-name=some_param
# Project:
#SBATCH --account=nn9299k
# Wall clock limit:
#SBATCH --time=6-23:00:00
# Max memory usage:
##SBATCH --mem-per-cpu=4G
#SBATCH --nodes=8 --ntasks-per-node=32
# Outfile
#SBATCH --output=pinc-%j.out


OMPI_MCA_io=ompio
export OMPI_MCA_io

## Set up job environment:
set -o errexit  # Exit the script on any error
set -o nounset  # Treat any unset variables as an error

module --quiet purge  # Reset the modules to the system default

module load hpcx/2.9
module load HDF5/1.10.6-gompi-2020a
module load GSL/2.6-GCC-9.3.0
module load FFTW/3.3.8-gompi-2020a

module list

#Compile
#echo "compiling"
#make clean
#make
## Copy input files to the work directory:
mkdir $USERWORK/$SLURM_JOB_ID
cp $SUBMITDIR/pinc $USERWORK/$SLURM_JOB_ID
cp $SUBMITDIR/case1_mod.ini $USERWORK/$SLURM_JOB_ID/input.ini
mkdir $USERWORK/$SLURM_JOB_ID/data
cp $SUBMITDIR/object.grid.h5 $USERWORK/$SLURM_JOB_ID/data


## Make sure the results are copied back to the submit directory (see Work Directory below):
savefile $USERWORK/$SLURM_JOB_ID/data


## Do some work:
cd $USERWORK/$SLURM_JOB_ID
echo "local folder contents: "
ls
echo "data folder contents:"
ls data/
echo "Running pinc"

srun ./pinc input.ini
