# HPC-Job-Scripts
HPC Job Scripts for Particle-in-Cell codes


## General Naming Convention
<HPC name>_<CODE name>.sh
e.g.: ```saga_ptetra.sh```, a job script for PTetra code on SAGA HPC

## Special Example
1. ```pbs_script.sh```, a job script for generic code on PBS system

```shell
# User specific aliases and functions
alias projects="cd /cluster/projects/nn9299k"
alias cost="cost --project=nn9299k -d"
```
