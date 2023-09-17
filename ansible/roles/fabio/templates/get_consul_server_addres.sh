#!/bin/bash
aws ec2 describe-instances --region eu-central-1 \
            --filters 'Name=tag:Name,Values=consul-{{ env }}' \
            --query 'Reservations[].Instances[].PrivateIpAddress' \
            --output text | awk '{print $1}'
