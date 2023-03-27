# .bashrc
# Source global definitions
if [ -f /etc/bashrc ]; then
        . /etc/bashrc
fi

# Uncomment the following line if you don't like systemctl's auto-paging feature:
# export SYSTEMD_PAGER=

# User specific aliases and functions
module load gcc

#remember to convert special characters in username or password to HEX format e.g. @ -> %23
export http_proxy='http://user.name:Pass123%23@hostname:3128'
export https_proxy='http://user.name:Pass123%23@hostname:3128'
export ftp_proxy='http://user.name:Pass123%23@hostname:3128'
