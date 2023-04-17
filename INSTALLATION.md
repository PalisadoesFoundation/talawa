# Installation for Developers
Welcome to our installation guide for developers. Jump in and contribute!

# Table of Contents

1. [Pre-Requisites For Developers](#prerequisites-for-developers)
    - [Talawa-API and Talawa-Admin](#talawa-api-and-talawa-admin) 
    - [Talawa Mobile App](#talawa-mobile-app) 
1. [Installation](#installation)
1. [Operation](#operation)

# Prerequisites for Developers
We recommend that you follow these steps before beginning development work on the Talawa mobile app.
## Talawa-API and Talawa-Admin

For best results you should setup your own **_local instances_** of:
1. [Talawa-API](https://github.com/PalisadoesFoundation/talawa-api): The API system that the mobile app uses for accessing data.
1. [Talawa-admin](https://github.com/PalisadoesFoundation/talawa-admin): The system used by Administrators to manage user information. This is important as you will occasionally need to do administrative functions that cannot be done in the mobile app.

The INSTALLATION.md files in both repositories show you how. The Talawa-API INSTALLATION.md will also show you the Organization URL to use when you first login to Talawa mobile.

### Talawa Mobile App
**Note:** If you are an Android user, you may choose to directly use the `apk` file provided in this repo, and skip the manual setup part. For more information about this, see the [Installation section](#Installation). But if you want to setup the development environment for yourself, read along.

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

# Installation

You can start using Talawa by any of the two methods:

1. Install the `apk` provided in the release section of this repo. It is built against the latest codebase. Please note that the release is provided only for Android. For iOS, you will still need to build the app yourself.	
   - Head over to the [release section](https://github.com/PalisadoesFoundation/talawa/releases) of Talawa repository.
   - You will find a release with the name of `Automated Android Release`. Scroll a bit and you will find a file named `app-release.apk`. Click on it and have it downloaded.
   - Head over to the downloads of your browser and then click on `app-release.apk` there. That will ask you to install the app. Click on `Install`.
   - Once done, you can find `Talawa` in your apps list. Start using it from right there :)
2. Manually build the app by below described steps.

## Manual Build and Installation

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

# Operation

The Talawa Mobile app communicates with a Talawa-API server to get all its data. This access is provided via a URL.
When you first run the Talawa Mobile App you'll be prompted for the organization URL of a Talawa-API server. The URL to use will vary depending on the way you are using the Talawa Mobile app. 

For a list of organization URLs for each scenario, please refer to the Talawa-API [INSTALLATION.md](https://github.com/PalisadoesFoundation/talawa-api/blob/-/INSTALLATION.md) file
