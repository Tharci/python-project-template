#!/bin/bash
set -e

echo "[INFO] Running linting tools"

echo "[INFO] Running ruff"
ruff check --fix src
ruff check --fix test

echo "[INFO] Running mypy"
yes | mypy --install-types src
mypy src

echo "[INFO] Done linting"
