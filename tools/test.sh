#!/bin/bash
set -e

echo "[INFO] Running linting tools"
sh tools/lint.sh

echo "[INFO] Running tests"
pytest -v --cov-config .coveragerc --cov=src -l --tb=short --maxfail=1 test/

echo "[INFO] Exporting coverage"
coverage xml
coverage html

echo "[INFO] Done testing"
