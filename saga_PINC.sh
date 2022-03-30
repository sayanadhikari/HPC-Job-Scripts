#!/bin/bash

# Job name:
#SBATCH --job-name=Daedalus2-case2-booms
# Project:
#SBATCH --account=nn9299k
# Wall clock limit:
#SBATCH --time=6-00:00:00
# Max memory usage:
#SBATCH --mem-per-cpu=4G
#SBATCH --ntasks=256
# Outfile
#SBATCH --output=pinc-%j.out

## Set up job environment:
set -o errexit  # Exit the script on any error
set -o nounset  # Treat any unset variables as an error

module --quiet purge  # Reset the modules to the system default


module load FFTW/3.3.8-gompi-2019a
module load GSL/2.5-GCC-8.2.0-2.31.1
module load HDF5/1.10.5-gompi-2019a
module list

module list

#Compile
echo "compiling"
make clean
make
## Copy input files to the work directory:
mkdir $USERWORK/$SLURM_JOB_ID
cp $SUBMITDIR/pinc $USERWORK/$SLURM_JOB_ID
cp $SUBMITDIR/input/daedalus/case2.ini $USERWORK/$SLURM_JOB_ID
mkdir $USERWORK/$SLURM_JOB_ID/data
cp $SUBMITDIR/object.grid.h5 $USERWORK/$SLURM_JOB_ID/data
##cp $SUBMITDIR/mpinc.sh  $USERWORK/$SLURM_JOB_ID

## Make sure the results are copied back to the submit directory (see Work Directory below):
savefile $USERWORK/$SLURM_JOB_ID/data
##chkfile $USERWORK/$SLURM_JOB_ID/CollisionDump.txt

## Do some work:
cd $USERWORK/$SLURM_JOB_ID
echo "local folder contents: "
ls
echo "data folder contents:"
ls data/
echo "Running pinc"

srun ./pinc case2.ini
