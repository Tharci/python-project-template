#!/bin/bash
rm -rf .venv
python3 -m venv .venv
source .venv/bin/activate
source tools/install.sh
echo "!!! Please run 'source .venv/bin/activate' to enable the environment !!!"

