#!/bin/bash
set -e

echo "[INFO] Running linting tools"

echo "[INFO] Running ruff"
ruff check --fix src
ruff check --fix test

echo "[INFO] Running ty"
ty check

echo "[INFO] Done linting"
