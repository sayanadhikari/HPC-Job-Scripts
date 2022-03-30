#!/bin/bash

#SBATCH --job-name=nms_wo_Emit
#SBATCH --account=nn9299k
#SBATCH --time=7-00:00:00
#SBATCH --nodes=1
#SBATCH --ntasks-per-node=1
#SBATCH --mem-per-cpu=10000M

set -o errexit # Exit the script on any error
set -o nounset # Treat any unset variables as an error

module load foss/2020a
module load HDF5/1.10.6-gompi-2020a

export FFTW_INCDIR=/cluster/projects/nn9299k/software/fftw-2.1.5/include
export FFTW_LIBDIR=/cluster/projects/nn9299k/software/fftw-2.1.5/lib
export HDF5_INCDIR=/cluster/software/HDF5/1.10.6-gompi-2020a/include

alias xoopic=/cluster/projects/nn9299k/software/xoopic_serial/xoopic

module list

srun xoopic -nox -i input.inp -s 1000001 -dp 100001 -id
