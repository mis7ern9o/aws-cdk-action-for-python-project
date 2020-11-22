#!/bin/sh

set -e

pip3 install -r requirements.txt
cd deploy
sh -c "cdk $*"
