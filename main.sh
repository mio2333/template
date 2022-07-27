#!/bin/bash
THERE=$(cd $(dirname $0); pwd)
export SHELLDIR=${THERE}/shell
export CODEDIR=${THERE}/code

eval $(python ${THERE}/env.py)

source $(conda init| grep profile.d/conda.sh | awk '{print $3}')
conda activate ${conda_env}


for file in ${SHELLDIR}/*
do
  chmod 700 $file
done

bash ${SHELLDIR}/train.sh
