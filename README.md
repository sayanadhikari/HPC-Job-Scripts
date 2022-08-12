# HPC-Job-Scripts
HPC Job Scripts for Particle-in-Cell codes


## General Naming Convention
```<HPC name>_<CODE name>.sh``` 

e.g. ```saga_ptetra.sh```, a job script for PTetra code on SAGA HPC

## Special Example
1. ```pbs_script.sh```, a job script for generic code on PBS system
2. ```bashrc```, a Bash shell script with configuration specially designed for HPC systems with proxy configuration

## Steps to prepare you machine seamlessly work with HPC systems
### STEP:1 Configure you ```SSH```
Edit ```.ssh/config``` and the following lines for HPC SAGA
```shell
Host saga
    HostName saga.sigma2.no
    Port 22
    User username
    ForwardAgent yes
    ForwardX11Trusted yes
    ForwardX11 yes
    ServerAliveInterval 240
    ServerAliveCountMax 100
```
NOTE: Replace username with your own and add many configuration as you need just copying it. Remember to change the HostName.

WARNING: If you are doing this for the first time, you may need to manually create this .ssh/config file.

### STEP:2 Passwordless ```SSH```
```ssh-copy-id``` installs an SSH key on a server as an authorized key.
```shell
ssh-copy-id saga
```
NOTE: It will ask you to enter the login password for the first time.

WARNING: If you are doing this for the first time, you may need to generate an SSH key. Use the ssh-keygen tool that comes as a part of OpenSSH. This tool generates public and private key files stored in the ~/.ssh directory. Check more details [here](https://linuxhint.com/use-ssh-copy-id-command/).

## HPC commands (SAGA/FRAM)
### General
```dusage```:
File quota for current user and the project

```cost --project=<projectnumber> -d```:
File quota for current user and the project. Make sure to replace the <projectnumber> with your own.

### JOB Management
```sbatch <jobscript>.sh```:
Submit a job. Make sure to replace the <jobscript> with your own.

```squeue -u <username>```:
View the job queue of a specific user. Make sure to replace the <username> with your own.

```scancel <jobID>```:
Cancel a job with its JOBID. Make sure to replace the <jobID> with your own.

### All about Modules
```Module``` represents the avialable softwares/libraries pre-installed in the system. Instead of installing them locally, it is advised to load them while running or compiling a code.

```module avail```: List of all possible softwares/libraries in the system.

```module spider <keyword of specific software/lib>```: List all possible version of that module. e.g. ```module spider anaconda```

```module load <software/library name>```: Load a specific software/library. e.g. ```module load Anaconda3/2019.07```

```module list <software/library name>```: List of loaded modules.
