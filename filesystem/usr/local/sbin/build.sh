#!/bin/bash

ln -sf /usr/local/sbin/sed-run.sh /etc/my_init.d/10-sed-run.sh
sed-build.sh
