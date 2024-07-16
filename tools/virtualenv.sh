#!/bin/bash
set -e

rm -rf .venv
python -m venv .venv
source tools/activate.sh
source tools/install.sh
