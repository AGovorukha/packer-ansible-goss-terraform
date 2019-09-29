#!/bin/bash

# Andrii Govorukha <AndriiGovorukha@gmail.com>
#
# The script checks the service status and post result
# to the CloudWatch custom metrics.
#
# Parameters: service name
# 
# Service up - post 1
# Service down - post 0

set -xeu

if [[ $# -ne 1 ]]; then
    echo "Usage: $0 <service to check>"
    exit 1
fi

SRVC=${1}

instance_id=$(curl http://169.254.169.254/latest/meta-data/instance-id)

if systemctl is-active --quiet ${SRVC}; then
    VALUE=1
else
    VALUE=0
fi

aws cloudwatch put-metric-data \
    --metric-name "${SRVC}-status" \
    --dimensions Instance=${instance_id}  \
    --namespace "Custom" \
    --value "${VALUE}"