#!/bin/bash
set -e

# Add a user and grant sudo priviledge 
if [ ! -z "$USER_ID" ] && [ ! -z "$GROUP_ID" ]; then
    groupadd -g $GROUP_ID appgroup
    useradd -l -u $USER_ID -g appgroup -m -s /bin/bash appuser 
    echo 'appuser ALL=(ALL) NOPASSWD: ALL' > /etc/sudoers.d/appuser
    chmod 0440 /etc/sudoers.d/appuser
    echo "source activate humann" >> /home/appuser/.bashrc
    echo "export METAPHLAN_DB=$METAPHLAN_DB" >> /home/appuser/.bashrc
    source activate humann
    exec gosu appuser "$@"
else
    echo "source activate humann" >> /root/.bashrc
    echo "export METAPHLAN_DB=$METAPHLAN_DB" >> /root/.bashrc
    source activate humann
    exec "$@"    
fi
