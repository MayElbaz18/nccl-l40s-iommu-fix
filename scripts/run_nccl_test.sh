#!/bin/bash

export NCCL_P2P_LEVEL=5
export NCCL_P2P_DISABLE=0
export NCCL_ALGO=Ring

mpirun -np 8 all_reduce_perf -b 1M -e 4G -f 2 -g 1 -n 50