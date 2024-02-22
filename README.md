# Python Project Template

## How to use

**Note** that Git Bash should be used on Windows to execute the bash scripts.

1. Rename `scr/project_name` folder
1. Replace project_name in relevant files
1. Edit project information in setup.py
1. Edit VERSION
1. Setup virtual env
    - Either use some IDE 
    - Or run `tools/virtualenv.sh`, which will use python3 on path
1. Remember to activate virtual environment using `tools/activate.sh`

## Tools

### Dependencies

Run `tools/install.sh` to install both production and test dependencies.

### Linter

Run `tools/lint.sh` to execute linter and code formatter tools.
Some of the tools can be configured in `pyproject.toml`.

### Test

Run `tools/test.sh` to execute linter and unit tests.

### Docs

Run `tools/docs.sh` to build the documentation.
mkdocs can be configured in `mkdocs.yml`.
