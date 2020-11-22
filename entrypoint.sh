#!/bin/sh

set -e

pip3 install -r requirements.txt
cd deploy
sh -c "npm ci"
sh -c "cdk $*"
