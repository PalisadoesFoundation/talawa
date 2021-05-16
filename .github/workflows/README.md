# Talawa GitHub Workflows Guidelines

Here are some contributing guidelines for this directory.

## YAML Files

Follow these guidelines when creating new YAML defined GitHub actions.

1. Place all actions related to issues in the `issues.yml` file.
1. Place all actions related to pull requests in the `pull-requests.yml` file.

## Scripts

Follow these guidelines when creating or modifying scripts in this directory.

1. All scripts in this directory must be written in python3 for consistency.
1. The python3 scripts must follow the following coding standards. Run these commands against your scripts before submitting PRs that modify or create python3 scripts in this directory.
    1. Pycodestyle
    1. Pydocstyle
    1. Pylint
    1. Flake8
1. All scripts must run a main() function.
