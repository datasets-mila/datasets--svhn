#!/bin/bash
set -o errexit -o pipefail

# this script is meant to be used with 'datalad run'

_SNAME=$(basename "$0")

source scripts/utils.sh echo -n

mkdir -p logs/

python3 -m pip install -r scripts/requirements_torchvision.txt

python3 scripts/preprocess_torchvision.py \
	1>>logs/${_SNAME}.out_$$ 2>>logs/${_SNAME}.err_$$
