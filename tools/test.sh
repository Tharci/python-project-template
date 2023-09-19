#!/bin/bash

source tools/lint.sh
pytest -v --cov-config .coveragerc --cov=src -l --tb=short --maxfail=1 tests/
coverage xml
coverage html
