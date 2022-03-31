#!/bin/bash

#This scripts fixes a bash issue and allows the scripts to run.

sed -i -e 's/\r$//' docker-install.sh

sed -i -e 's/\r$//' docker-troubleshoot-fix.sh