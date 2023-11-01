#!/bin/bash

mypy --install-types < yes
isort src
flake8 src/
black -l 79 src/
black -l 79 tests/
mypy src/
