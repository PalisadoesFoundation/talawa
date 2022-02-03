# Talawa GitHub Workflows Guidelines

Follow these guidelines when contributing to this directory.

## General

Any changes to files in this directory are flagged when pull requests are run. Make changes only on the advice of a contributor.

## YAML Workflow Files

The YAML files in this directory have very specific roles depending on the type of workflow.

Whenever possible you must ensure that:
1. The file roles below are maintained
1. The sequence of the jobs in the workflows are maintained using [GitHub Action dependencies](https://docs.github.com/en/actions/learn-github-actions/managing-complex-workflows). 

### File Roles
Follow these guidelines when creating new YAML defined GitHub actions. This is done to make troubleshooting easier.

1. `Issue` Workflows:
   1. Place all actions related to issues in the `issues.yml` file.
1. `Pull Request` workflows to be run by:
   1. Workflows to run **First Time** repo contributors:
      1. Place all actions related to to this in the `pull-request-target.yml` file.
   1. Workflows to be run by **ALL** repo contributors:
      1. Place all actions related to pull requests in the `pull-request.yml` file.
1. `Push` workflows:
   1. Place all actions related to pushes in the `push.yml` file.

#### File Role Exceptions

There are some exceptions to these rules in which jobs can be placed in dedicated separate files:
1. Jobs that require unique `cron:` schedules 
1. Jobs that require unique `paths:` statements that operate only when files in a specific path are updated.
1. Jobs only work correctly if they have a dedicated file (eg. `CodeQL`)

## Scripts

Follow these guidelines when creating or modifying scripts in this directory.

1. All scripts in this directory must be written in python3 for consistency.
1. The python3 scripts must follow the following coding standards. Run these commands against your scripts before submitting PRs that modify or create python3 scripts in this directory.
    1. Pycodestyle
    1. Pydocstyle
    1. Pylint
    1. Flake8
1. All scripts must run a main() function.
