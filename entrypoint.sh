#!/bin/sh

set -e
echo "Building your layer"
sh -c "${INPUT_PYTHON_BUILD_COMMAND}"
sh -c "${INPUT_ZIP_COMMAND}"
echo "Running your CDK command"
cd "${GITHUB_WORKSPACE}"/"${INPUT_CDK_WORK_DIR}"
sh -c "npm ci"
sh -c "${INPUT_CDK_COMMAND}"
