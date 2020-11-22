#!/bin/sh

set -e

pip3 install -r requirements.txt
cd ${GITHUB_WORKSPACE}/${INPUT_WORKING_DIR}
sh -c "npm ci"
sh -c "cdk $*"
