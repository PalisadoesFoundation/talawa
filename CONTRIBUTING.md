# Contributing to Talawa
Thank you for your interest in contributing to Talawa. Regardless of the size of the contribution you make, all contributions are welcome and are appreciated. 

If you are new to contributing to open source, please read the Open Source Guides on [How to Contribute to Open Source](https://opensource.guide/how-to-contribute/).

## Code of Conduct
A safe environment is required for everyone to contribute. Read our [Code of Conduct Guide](https://github.com/PalisadoesFoundation/talawa/blob/master/CODE_OF_CONDUCT.md) to understand what this means. Let us know immediately if you have unacceptable experiences in this area.

No one should fear voicing their opinion. Respones must be respectful.

## Ways to Contribute
If you are ready to start contributing code right away, we have a list of [good first issues](https://github.com/PalisadoesFoundation/talawa/labels/good%20first%20issue) that contain issues with a limited scope. 

### Our Development Process
We utilize GitHub issues and pull requests to keep track of issues and contributions from the community. 

#### Issues 
Make sure you are following [issue report guidelines](https://github.com/PalisadoesFoundation/talawa/blob/master/issue-guidelines.md) available here before creating any new issues on Talawa project.

#### Pull Requests
[Pull Request guidelines](https://github.com/PalisadoesFoundation/talawa/blob/master/PR-guidelines.md) is best resource to follow to start working on open issues.

#### Git Flow
For Talawa, we utilize the GitFlow branching model. GitFlow is geared towards efficiently tracking development and managing releases. The model makes parallel development efforts easy and safe by isolating new development efforts from completed work. 

The different types of branches we may use are:
* Feature branches (feature/branch-name)
* Release branches (release/1.XX)
* Bug branches  (bugfix/branch-name)
* Hotfix branches (hotfix/branch-name)

Detailed document containing how GitFlow works: https://nvie.com/posts/a-successful-git-branching-model/

### Contributing Code
Code contributions to Talawa come in the form of pull requests. These are done by forking the repo and making changes locally. 

The process of proposing a change to Talawa can be summarized as:
1. Fork the Talawa repository and branch off `master`.
1. The repository can be cloned locally using `git clone <forked repo url>`.
1. Make the desired changes to the Talawa source.
1. Run the app and test your changes.
1. If you've added code that should be tested, write tests.
1. Ensure that your code is appropriately formatted before making your submission. Submissions which are not properly formatted will be rejected if they are not fixed by the contributor.
    1. **In your IDE:**
        1. *Visual Studio Code:* There is a setting which allows your code to be formatted [automatically when you save](https://stackoverflow.com/a/66538607/15290492), or you may manually trigger it using `Ctrl + Shift + P` or `Cmd + Shift + P` and typing `Format Document`.
        1. *IntelliJ*, *Android Studio*, and other *Jetbrains*-based IDEs. Use the `Ctrl + Alt + L` or `Cmd + Opt + L` to trigger code formatting.
    1. **On the command line before committing**: Run this command from the root of your repository directory tree.
        ```
        flutter format --set-exit-if-changed .
        ```
1. After making changes you can add them to git locally using `git add <file_name>`(to add changes only in a particular file) or `git add .` (to add all changes).
1. After adding the changes you need to commit them using `git commit -m '<commit message>'`(look at the commit guidelines below for commit messages).
    1. You can link and automatically close the issue tied to your pull request by [using a supported keyword in either the pull request's description or in a commit message.](https://docs.github.com/en/github/managing-your-work-on-github/linking-a-pull-request-to-an-issue) This is a very useful feature that helps to prevent zombie issues that never die.
1. Once you have successfully commited your changes, you need to push the changes to the forked repo on github using: `git push origin <branch_name>`.(Here branch name must be name of the branch you want to push the changes to.)
1. Now create a pull request to the Talawa repository from your forked repo. Open an issue regarding the same and link your PR to it.
1. Ensure the test suite passes, either locally or on CI once a PR has been created. 
1. Review and address comments on your pull request if requested.

### General Guidelines

#### Project structure

```
app
- presentation: interactions and data presented to the user
  - screens: app and feature screens
    - <feature_name>
      - <feature>.screen.dart
      - widget: internal widgets related to a screen/feature
  - viewmodels: shared business logic, so we can extract it easily soon as we modularize our app
- resources: local and remote data sources, other services

components
- example: runnable app to view all components added in the app
- <component_name>
   - src
      - component.configs.dart
   - component.name.dart

core
- enums: common enums shared
- models: business data models, entities
- theme: application theme, colors, dimens
- utils: utility classes
```

#### Structure code this way

```
// Inside widget class
-- constructor
-- explicitly defined variables using its type (private if possible)
-- build method (Inside build(), use sub methods like _buildAppBar()
-- sub-build methods
-- other methods
-- utility methods
```

#### Other Information

```
-- file should be named using lowercase and underscore
-- const and final keywords should be specified along with the widget
```

#### Commit guidelines

```
feat: (addition of a new feature)
rfac: (refactoring the code: optimization/ different logic of existing code - output doesn't change, just the way of execution changes)
docs: (documenting the code, be it readme, or extra comments)
bfix: (bug fixing)
chor: (chore - beautifying code, indents, spaces, camelcasing, changing variable names to have an appropriate meaning)
ptch: (patches - small changes in code, mainly UI, for example color of a button, increasing size of text, etc)
conf: (configurational settings - changing directory structure, updating gitignore, add libraries, changing manifest etc)
```

### Internships

We have internship partnerships with a number of organizations. See below for more details.

#### GSoC
If you are participating in the 2021 Summer of Code, please read more about us and our processes [here](https://palisadoesfoundation.github.io/talawa-docs/docs/internships/gsoc/gsoc-introduction)

#### GitHub Externship
If you are participating in the 2021 GitHub Externship, please read more about us and our processes [here](https://palisadoesfoundation.github.io/talawa-docs/docs/internships/github/github-introduction)


### Community
The Palisadoes Foundation has a Slack channel where members can assist with support and clarification. Click [here](https://join.slack.com/t/thepalisadoes-dyb6419/shared_invite/zt-nk79xxlg-OxTdlrD7RLaswu8EO_Q5rg) to join our slack channel.
