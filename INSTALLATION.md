# Installation for Developers
Welcome to our installation guide for developers. Jump in and contribute!

# Table of Contents

1. [Pre-requisites](#prerequisites)
2. [Command line steps](#command-line-steps)
3. [Developer Environment Setup](#developer-environment-setup)

## Prerequisites

You'll need to set up the IDE and mobile device emulator on your local system and have access to a system running the Talawa API, which the mobile needs to access to operate properly.

1. **Development Environment**: You'll need to have the following installed:
    1. [Flutter SDK](https://flutter.dev/docs/get-started/install)
    1. [Android Studio](https://developer.android.com/studio)
1. **API Environment**: You will need to enter the URL of the API server in the Talawa app when it first starts up. The URL could be active on a system you control or in our test environment.
    1. *Your API Server:* Check the [Talawa API repository](https://github.com/PalisadoesFoundation/talawa-api) for information on how to set up the API on your local machine or a machine under your legitimate control. There is a section in the README.md file that discusses installation.
    2. *Our API Server for Talawa Contributors*: We also have a test environment that our open source contributors use. Try it if you are not inclined to set up or customize your own API server. This is a development environment. The data stored on this server may be modified or deleted without warning. Information about this server can be found on the [Talawa documentation site](https://docs.talawa.io).
    
(Optional) **Google APIs**: The app uses Google Maps API for venue selection. You will need to sign up for it if you want to test these features. Enter your API key in the
- `android/app/src/main/AndroidManifest.xml` file for android.
- `ios/Runner/AppDelegate.swift` file for iOS.

Replace YOUR_KEY_HERE with your API key.

**Remember** to remove the key before committing changes and replace again with YOUR_KEY_HERE.

- Go to [Google Developers Console](https://console.cloud.google.com).
- Create a new project that you want to enable Google Maps on.
- Search `credentials` in the search bar and select `Credentials` in APIs & Services. Click on `Create credentials` and select `API key`. Copy the key and replace it as said before.
- Search `maps sdk for android` and select the `Google Maps SDK for Android` in Marketplace. You can also search `maps sdk for ios` and select the `Google Maps SDK for iOS` in Marketplace for iOS devices.
- Click `Enable`.

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
For setting up the developer environment please refer to [`INSTALLATION.md`](https://github.com/SiddheshKukade/talawa-admin/blob/develop/INSTALLATION.md#setting-up-talawa-admin-and-api-for-talawa-app) from talawa-admin.
