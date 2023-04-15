# Contributing to Talawa

Thank you for your interest in contributing to Talawa. Regardless of the size of the contribution you make, all contributions are welcome and are appreciated.

If you are new to contributing to open source, please read the Open Source Guides on [How to Contribute to Open Source](https://opensource.guide/how-to-contribute/).

## Table of Contents

* [Code of Conduct](#code-of-conduct)
* [Ways to Contribute](#ways-to-contribute)
* [Our Development Process](#our-development-process)
    * [Issues](#issues)
    * [Pull Requests](#pull-requests)
    * [Branching Strategy](#branching-strategy)
    * [Conflict Resolution](#conflict-resolution)
* [Contributing Code](#contributing-code)
* [General Guidelines](#general-guidelines)
   * [Folder Definition](#folder-definition)
   * [File Definition](#file-definition)
   * [PR Preparation](#pr-preparation)
   * [Project Structure](#project-structure)
   * [Commit Guidelines](#commit-guidelines)
* [Internships](#internships)
* [Community](#community)

## Code of Conduct

A safe environment is required for everyone to contribute. Read our [Code of Conduct Guide](CODE_OF_CONDUCT.md) to understand what this means. Let us know immediately if you have unacceptable experiences in this area.

No one should fear voicing their opinion. Respones must be respectful.

## Ways to Contribute

If you are ready to start contributing code right away, get ready!

1. Join our Slack and introduce yourself. See details on how to join below in the Community section.
   1. This repository has its own dedicated channel.
   1. There are many persons on the various channels, willing to assist you in getting started.
1. Take a look at our issues (**_after reading our guidelines below_**):
   1. We have a list of [good first issues](https://github.com/PalisadoesFoundation/talawa/labels/good%20first%20issue) that contain challenges with limited scope for beginners.
   1. There are issues for creating tests for our codebase. We need to increase reliability. Try those issues, or create your own files that don't already have tests. This is another good strategy for beginners.
   1. There are [dormant issues on which nobody has worked for some time](https://github.com/PalisadoesFoundation/talawa/issues?q=is%3Aopen+is%3Aissue+label%3Ano-issue-activity). These are another place to start.
   1. There may also be [dormant PRs on which nobody has worked for some time](https://github.com/PalisadoesFoundation/talawa/issues?q=is%3Aopen+is%3Aissue+label%3Ano-issue-activity+label%3Ano-pr-activity)!
1. Create an issue based on a bug you have found or a feature you would like to add. We value meaningful suggestions and will prioritize them.

**Welcome aboard!**

### Our Development Process

We utilize GitHub issues and pull requests to keep track of issues and contributions from the community.

#### Issues

Make sure you are following [issue report guidelines](ISSUE_GUIDELINES.md) available here before creating any new issues on Talawa project.

#### Pull Requests

[Pull Request guidelines](PR_GUIDELINES.md) is best resource to follow to start working on open issues.

#### Branching Strategy

For Talawa, we had employed the following branching strategy to simplify the development process and to ensure that only stable code is pushed to the `master` branch:

- `develop`: For unstable code and bug fixing
- `alpha-x.x.x`: For stability testing
- `master`: Where the stable production ready code lies

#### Conflict Resolution

When multiple developers are working on issues there is bound to be a conflict of interest (not to be confused with git conflicts) among issues, PRs or even ideas. Usually these conflicts are resolved in a **First Come First Serve** basis however there are certain exceptions to it.

- In the cases where you feel your potential issues could be an extension or in conflict with other PRs it is important to ask the author of the PR in the slack channel or in their PRs or issues themselves why he/she did not write code for something that would require minimal effort on their part.
- Based on basic courtesy, it is good practice to let the person who created a function apply and test that function when needed.
- Last but not the least, communication is important make sure to talk to other contributors, in these cases, in slack channel or in a issue/PR thread.
- As a last resort the Admins would be responsible for deciding how to resolve this conflict. 

### Contributing Code

Code contributions to Talawa come in the form of pull requests. These are done by forking the repo and making changes locally.

The process of proposing a change to Talawa can be summarized as:

1. Fork the Talawa repository and branch off `develop`.

1. The repository can be cloned locally using `git clone <forked repo url>`.

1. Make the desired changes to the Talawa source.

1. Setup a local instance of Talawa-API on your local machine using the steps outlined in our [INSTALLATION.md](INSTALLATION.md) file.

1. Run the app:
   1. Enter Talawa-API URL for your local instance oulined in the [INSTALLATION.md](INSTALLATION.md) file. This is also the URL you should use for your Talawa-Admin configuration.

1. While selecting organization, select organization named A as it contains some testable data.

1. Test your changes.

1. If you've added code, then test suites must be added. 
   1. **_General_:** 
      1. We need to get to 100% test coverage for the app. We periodically increase the desired test coverage for our pull requests to meet this goal.
      1. Pull requests that don't meet the minimum test coverage levels will not be accepted. This may mean that you will have to create tests for code you did not write. You can decide which part of the code base needs additional tests if this happens to you.
   1. **_Testing_:**
      1. Test using the `flutter test` command.
      1. Here are some useful flutter test videos
          1. [State Management With Provider](https://www.raywenderlich.com/6373413-state-management-with-provider)
          1. [Unit Testing With Flutter: Getting Started](https://www.raywenderlich.com/6926998-unit-testing-with-flutter-getting-started)
          1. [How to Unit Test in Flutter - Guide](https://www.youtube.com/watch?v=5BFlo9k3KNU) 
   1. **_Test Code Coverage_:**
      1. _General Information_
         1. The current code coverage of the repo is: [![codecov](https://codecov.io/gh/PalisadoesFoundation/talawa/branch/develop/graph/badge.svg?token=3PJXIKRS1S)](https://codecov.io/gh/PalisadoesFoundation/talawa)
         1. You can determine the percentage test coverage of your code by running these two commands in sequence:
            ```
            flutter test --coverage
            genhtml coverage/lcov.info -o coverage
            ```
         1. The coverage rate will be visible on the penultimate line of the `genhtml` command's output.
         1. The `genhtml` command is part of the linux `lcov` package. Similar packages can be found for Windows and MacOS.
         1. The currently acceptable coverage rate can be found in the [GitHub Pull Request file](.github/workflows/pull-request.yml). Search for the value below the line containing `min_coverage`.
      1. _Creating your code coverage account_
          1. You can also see your code coverage online for your fork of the repo. This is provided by `codecov.io`
              1. Go to this link: `https://app.codecov.io/gh/XXXX/YYYY` where XXXX is your GitHub account username and YYYY is the name of the repository
              1. Login to `codecov.io` using your GitHub account, and add your **repo** and **branches** to the `codecov.io` dashboard. 
              1. Remember to add the `Repository Upload Token` for your forked repo. This can be found under `Settings` of your `codecov.io` account. 
              1. Use the value of this token to create a secret named CODE_COV for your forked repo. 
              1. You will see your code coverage reports with every push to your repo after following these steps

1. Author is required to write complete documentation for any file(s) changed in the respective PR

   1. **General:**

      1. Every field, i.e., `class`, `method`, `attribute`, `variable` should be documentation with some logical exceptions being `A class that extends State<T>`, `class methods that override the respective base method`, etc as they don't necessarily need their own documentation.
      1. The documentation written should follow [Dart's official documentation guidelines](https://dart.dev/guides/language/effective-dart/documentation).
      1. For now, the non-documented files are marked with `// ignore_for_file: talawa_api_doc` and`
         // ignore_for_file: talawa_good_doc_comments` directives to suppress these lint warning. It is expected from the author to remove these two lines from the files they have modified and add corresponding documentation in the expected format.

   1. **In your IDE:**

      1. If you followed [INSTALLATION.md](INSTALLATION.md) carefully, you should see lint errors/warnings in your IDE itself, after removing the ignore directives on the top of the file.
      1. Use the lint warnings your IDE states and write documentation accordingly. It will make the process easier.

   1. **On the command line:**

      1. Run `.github/workflows/check_ignore.py` and it will report if you have removed the ignore directives from changed files or not.
         ```bash
         python .github/workflows/check_ignore.py
         ```

      1. If it states any error, remove ignore directives from the files it states, and write proper documentation.

      1. When done writing documentation, run
         ```
         flutter pub run custom_lint
         ```

         to check whether you documentation follows the format we expect, though you will get warnings in your IDE itself if it doesn't.

1. Ensure that your code is appropriately formatted before making your submission. Submissions that are not properly formatted will be rejected if they are not fixed by the contributor.
   1. **_In your IDE_:**
      
      1. _Visual Studio Code:_ There is a setting that allows your code to be formatted [automatically when you save](https://stackoverflow.com/a/66538607/15290492), or you may manually trigger it using `Ctrl + Shift + P` or `Cmd + Shift + P` and typing `Format Document`.
      1. _IntelliJ_, _Android Studio_, and other _Jetbrains_-based IDEs. Use the `Ctrl + Alt + L` or `Cmd + Opt + L` to trigger code formatting.
   1. **_On the command line before committing_**: Run this command from the root of your repository directory tree.
      ```
      dart format --set-exit-if-changed .
      ```

1. Ensure that your code should not be more than **_300 lines_**. It is there to make the code more modular and readable. Submissions that are not properly maintained will be rejected if the contributor does not fix them. Otherwise, the contributor will have to explain the need for it.

1. After making changes, you can add them to git locally using `git add <file_name>`(to add changes only in a particular file) or `git add .` (to add all changes).

1. After adding the changes, you need to commit them using `git commit -m '<commit message>'`(look at the commit guidelines below for commit messages).
    1. You can link and automatically close the issue tied to your pull request by [using a supported keyword in either the pull request's description or in a commit message.](https://docs.github.com/en/github/managing-your-work-on-github/linking-a-pull-request-to-an-issue) This is a very useful feature that helps to prevent zombie issues that never die.

1. Once you have successfully committed your changes, you need to push the changes to the forked repo on GitHub using: `git push origin <branch_name>`.(Here, the branch name must be the name of the branch you want to push the changes to.)

1. Now create a pull request to the Talawa repository from your forked repo. Open an issue regarding the same and link your PR to it.

1. Ensure the test suite passes, either locally or on CI, once a PR has been created.

1. Review and address comments on your pull request if requested.

## General Guidelines

Please also follow these general rules.

### Folder Definition

- `controllers`: The folder contains all the files responsible for managing the state.
  ```
  1. Files contain codes for all the business logic related to any screen.
  2. Files also contain the client-side query & mutation calls and server-side side response.
  3. Before adding any controller, make sure whether it already exists or not.
  ```
- `enum`: The folder contains all the enumerators used in the entire project.
  ```
  1. File contains an enum that is either used with controllers or widgets.
  2. Before creating new enum files, check if the existing enum can be modified to fulfill your requirements.
  ```
- `model`: The folder contains all the data models files.
  ```
  1. Files contain a data model that is used in the controller file that contains the server-side response in an organised form.
  2. These data models are used to effectively organise projects and render the data on widgets.
  3. In the controller file, convert every response to a particular data model type.
  ```
- `utils`: The folder contains all the external utility files.
  ```
  1. Codes related to an external utility like validator, UI-scaling, constant strings, etc.
  2. Any utility-related files should be created here if not already present.
  ```
- `views`: The folder contains all the files related to the UI display.
  ```
  1. Pages: Folder that contains all the pages related to sub-folder and code.
  2. Widgets: Folder that contains widget file for pages to avoid code duplication
  ```

### File Definition

- Filename should be created with lowercase and underscore letters
- The business logic & UI-based files should be separated from each other.
  - `controllers`: Folder that contains all business logic files
  - `views`: Folder that contains UI specific files
- If it is UI based file, try to use as much `stateless widget` as possible.
- Don't use the `print` statement in your code; instead use `debugPrint`.
- Constructor should be present just after the class declaration.
- Make sure to add proper `keyword` (final or const) and data types for any variable.
- In your files, structure code this way inside your widget class:
  ```
  -- constructor
  -- explicitly defined variables using its type (private if possible)
  -- build method (Inside build(), use sub methods like _buildAppBar()
  -- sub-build methods
  -- other methods
  -- utility methods
  ```

**_Note: Don't use constant numerical value anywhere in your UI-related code. Use SizeConfig class to assign the constant value. SizeConfig class does the job of scaling the UI based on the device size._**

Example:

```
Incorrect Way:
SizedBox(height: 8, width: 4)

Correct Way:
SizedBox(height: SizeConfig.safeBlockVertical, width: SizeConfig.safeBlockHorizontal)
```

The value of `safeBlockVertical` and `safeBlockHorizontal` will be displayed in your `console` and varies based on the device being used.

### PR Preparation:

    - All your file should contain at max `300` lines of code.
    - Follow proper code formatting and run `flutter format .` before your PR.
    - Run `flutter analyze` before your PR and make sure to resolve all the found issues.

### Project Structure

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

### Commit Guidelines

```
feat: (addition of a new feature)
rfac: (refactoring the code: optimization/ different logic of existing code - output doesn't change, just the way of execution changes)
docs: (documenting the code, be it readme, or extra comments)
bfix: (bug fixing)
chor: (chore - beautifying code, indents, spaces, camelCasing, changing variable names to have an appropriate meaning)
ptch: (patches - small changes in code, mainly UI, for example color of a button, increasing size of text, etc)
conf: (configurational settings - changing directory structure, updating gitignore, add libraries, changing manifest etc)
```

## Internships

If you are participating in any of the various internship programs we ar members of then please read the [introduction guides on our documentation website](https://docs.talawa.io/docs/).

## Community
There are many ways to communicate with the community.

1. The Palisadoes Foundation has a Slack channel where members can assist with support and clarification. Visit the [Talawa GitHub repository home page](https://github.com/PalisadoesFoundation/talawa) for the link to join our slack channel.
1. We also have a technical email list run by [freelists.org](https://www.freelists.org/). Search for "palisadoes" and join. Members on this list are also periodically added to our marketing email list that focuses on less technical aspects of our work.
