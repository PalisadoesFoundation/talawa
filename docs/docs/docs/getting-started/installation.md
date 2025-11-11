---
id: talawa-installation
title: Installation
slug: /installation
sidebar_position: 1
---

We recommend that you follow these steps before beginning development work on the Talawa mobile app.

## Prerequisites

You must install the following applications beforehand on your system for best results. 

1. [Talawa-API](https://github.com/PalisadoesFoundation/talawa-api): The API system that the mobile app uses for accessing data.
2. [Talawa-admin](https://github.com/PalisadoesFoundation/talawa-admin): The system used by Administrators to manage user information. This is important as you will occasionally need to do administrative functions that cannot be done in the mobile app.

Each of these software application repositories have an INSTALLATION.md file that explains how install them. The Talawa-API INSTALLATION.md file will also show you the `Organization URL` to use when you first login to Talawa mobile.

**Note:** If you are a developer then you should setup your own **_local instances_** of these applications.


## Installation for End Users

End users can install the `apk` file on their phones. 

**Note:** 
1. Make sure you follow these steps on your phone.
2. Please note that the release is provided only for Android. For iOS, you will still need to build the app yourself.

Please follow these steps:

1. The `apk` file is automatically generated when we make updates to the code. It has the latest features of the application.
4. Head over to the [release section](https://github.com/PalisadoesFoundation/talawa/releases) of Talawa repository. 
5. You will find a release with the name of `Automated Android Release`. 
6. Scroll a bit and you will find a file named `app-release.apk`. 
7. Click on the link to download the file.
8. Head over to the downloads of your browser and then click on `app-release.apk` there. 
   1. You will be prompted to install the app. 
   2. Click on `Install`.
9. Once done, you can find `Talawa` in your apps list. 
10. Start using it from right there.

## Installation for Developers

Developers should follow these steps to install the application in their development environment.

### Talawa Mobile App Setup
You'll need to set up the IDE and mobile device emulator on your local system and have access to a system running the Talawa API, which the mobile needs to access to operate properly.

1. **Development Environment**: You'll need to have the following installed:
    1. [Flutter SDK](https://flutter.dev/docs/get-started/install)
    1. [Android Studio](https://developer.android.com/studio)
1. **API Environment**: This part is very important.
    1. Make sure Talawa-API is up and running.
    1. You will need to enter the URL of the API server in the Talawa app when it first starts up. The URL could be active on a system you control or in our test environment. The Talawa-API INSTALLATION.md will provide that information.
1. **Google APIs** (Optional): The app uses Google Maps API for venue selection. You will need to sign up for it if you want to test these features.
    1. **Maps API Setup**: Follow these steps:
        1. Go to [Google Developers Console](https://console.cloud.google.com).
        1. Create a new project that you want to enable Google Maps on.
        1. Search `credentials` in the search bar and select `Credentials` in APIs & Services. Click on `Create credentials` and select `API key`. Copy the key and replace it as said before.
        1. Search `maps sdk for android` and select the `Google Maps SDK for Android` in Marketplace. You can also search `maps sdk for ios` and select the `Google Maps SDK for iOS` in Marketplace for iOS devices.
        1. Click `Enable`.
    1. **Mobile App Setup**: Enter your API key in the:
        1. `android/app/src/main/AndroidManifest.xml` file for Android.
        1. `ios/Runner/AppDelegate.swift` file for iOS.
            1. Replace YOUR_KEY_HERE with your API key.
        1. **Remember** to remove the key before committing changes and replace again with YOUR_KEY_HERE.

### Mobile App Installation

We have tried to make the process simple. Here's what you need to do.

1. Clone and change into the project.
    ```sh
    $ git clone https://github.com/PalisadoesFoundation/talawa.git
    $ cd talawa
    ```
1. Install packages.
   ```sh
   $ cd talawa_lint
   $ flutter pub get
   $ cd ..
   $ flutter pub get
   ```
1. Start developing!
