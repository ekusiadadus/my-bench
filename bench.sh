#!/bin/bash
# This script is used to run the benchmarking tests

# Set the number of threads to use
export OMP_NUM_THREADS=1

# Set the number of iterations to run
export ITERATIONS=1

###
### utility functions
###
function run_test {
    echo "Running test $1"
    echo "----------------"
    echo "Running $1 with $OMP_NUM_THREADS threads"
    echo "Running $1 with $OMP_NUM_THREADS threads" >> $1.log
    for i in `seq 1 $ITERATIONS`; do
        ./$1 >> $1.log
    done
    echo "----------------"
}

###
### init functions
###
function init_ab {
    echo "Initializing Apache Bench"
    echo "----------------"
    echo "Truncate Apache Bench log"
    echo "$(date)" > ab-$(date '+%Y-%m-%d-%H-%M-%S').log
    echo "----------------"
}

function init_bombardier {
    echo "Initializing Bombardier"
    echo "----------------"
    echo "Truncate Bombardier log"
    echo "$(date)" > bombardier.log
    echo "----------------"
}

###
### Apache Bench functions
###
function run_ab {
    echo "Running Apache Bench"
    echo "----------------"
    echo "Running Apache Bench with $OMP_NUM_THREADS threads"
    echo "Running Apache Bench with $OMP_NUM_THREADS threads" >> ab.log
    for i in `seq 1 $ITERATIONS`; do
        ab -k -c 10 -n 10000 $TARGET_URL >> ab.log
    done
    echo "----------------"
}

###
### Bombardier functions
###
function run_bombardier {
    echo "Running Bombardier"
    echo "----------------"
    echo "Running Bombardier with $OMP_NUM_THREADS threads"
    echo "Running Bombardier with $OMP_NUM_THREADS threads" >> bombardier.log
    for i in `seq 1 $ITERATIONS`; do
        bombardier -c 10 -n 10000 $TARGET_URL >> bombardier.log
    done
    echo "----------------"
}

###
### main
###
SUBCMD=$1
TARGET_URL=$2
case $SUBCMD in
  ab)
    init_ab
    run_ab
    ;;
  bombardier)
    init_bombardier
    run_bombardier
    ;;
  *)
    echo "Usage: $0 [ab|bombardier] [target_url]"
    exit 1
    ;;
esac