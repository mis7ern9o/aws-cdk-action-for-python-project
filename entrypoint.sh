#!/bin/sh

set -e

cd "${GITHUB_WORKSPACE}"/"${INPUT_WORKING_DIR}"
sh -c "npm ci"
sh -c "${INPUT_CDK_COMMAND}"
