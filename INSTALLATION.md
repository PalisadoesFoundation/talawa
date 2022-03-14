# Installation for Developers
Welcome to our installation guide for developers. Jump in and contribute!

## Prerequisites

You'll need to set up the IDE and mobile device emulator on your local system and have access to a system running the Talawa API, which the mobile needs to access to operate properly.

1. **Development Environment**: You'll need to have the following installed:
    1. [Flutter SDK](https://flutter.dev/docs/get-started/install)
    1. [Android Studio](https://developer.android.com/studio)
1. **API Environment**: You will need to enter the URL of the API server in the Talawa app when it first starts up. The URL could be active on a system you control or in our test environment.
    1. *Your API Server:* Check the [Talawa API repository](https://github.com/PalisadoesFoundation/talawa-api) for information on how to set up the API on your local machine or a machine under your legitimate control. There is a section in the README.md file that discusses installation.
    2. *Our API Server for Talawa Contributors*: We also have a test environment that our open source contributors use. Try it if you are not inclined to set up or customize your own API server. This is a development environment. The data stored on this server may be modified or deleted without warning. Information about this server can be found on the [Talawa documentation site](https://palisadoesfoundation.github.io/talawa-docs/).

## Command Line Steps

We have tried to make the process simple. Here's what you need to do.

1. Clone and change into the project.
    ```sh
    $ git clone https://github.com/PalisadoesFoundation/talawa.git
    $ cd talawa
    ```
1. Install packages.
    ```sh
    $ flutter pub get
    ```
1. Start developing!

## Developer Environment Setup

There are multiple ways to access the Talawa-API that the Talawa mobile app uses.

### On Your Local Machine

You can also setup your own local instance of [Talawa-API](https://github.com/PalisadoesFoundation/talawa-api). The advantage is that you'll be working with the latest code.

### Hosted API server

We have a test API server for software developers contributing to the talawa projects.

1. This is a good server to use to test your code prior to submitting a pull request
1. The server runs the latest master branch version of the talawa-api code base
    - Use this URL in the Talawa App: https://talawa-graphql-api.herokuapp.com/graphql
1. This is a development environment. The data stored on this server may be modified or deleted without warning.

