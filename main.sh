#!/bin/bash
export ProjectDIR=$(cd $(dirname $0); pwd)
export SHELLDIR=${ProjectDIR}/shell
export CODEDIR=${ProjectDIR}/code

eval $(python ${ProjectDIR}/env.py)

source $(conda init| grep profile.d/conda.sh | awk '{print $3}')
conda activate ${conda_env}

files=()
for file in ${SHELLDIR}/*
do
  chmod 700 $file
  files+=($(basename $file))
done



echo "Please select a number for the script you want to run:"
select shell in ${files[@]}
do
  if [ -f ${SHELLDIR}/${shell} ]; then
    bash ${SHELLDIR}/${shell}
    break
  else
    echo "Invalid selection"
  fi
done
# bash ${SHELLDIR}/run.sh
