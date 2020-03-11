#!/bin/bash

#
# untaint all gpu nodes
#

for arg in "$@"
do
    kubectl taint node $arg nvidia.com/gpu-
done

