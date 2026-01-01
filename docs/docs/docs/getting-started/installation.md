---
id: talawa-installation
title: Installation
slug: /installation
sidebar_position: 1
---

We recommend that you follow these steps before beginning development work on the Talawa mobile app.

## Prerequisites

**Important:**
Talawa now requires Dart SDK version `>=3.0.0 <4.0.0`. Please ensure your Flutter/Dart environment matches this requirement.
Some dependencies are overridden in `pubspec.yaml` to ensure compatibility. See that file for details.

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

1. In Android Studio
   1. Make sure you have installed the `Android SDK Command Line Tools"
   2. Navigate to Project Structure
      1. On Windows/Linux: Click File > Project Structure...
      2. On macOS: Click Android Studio > Settings... (or Preferences...) > Project Structure
   3. Select the SDK Location
   4. Apply and save the settings
2. From the CLI
   1. Clone and change into the project.
       ```bash
       $ git clone https://github.com/PalisadoesFoundation/talawa.git
       $ cd talawa
       ```
   1. Next you'll need to ensure that you are running the correct version of Flutter. We recommend using FVM to ensure you are running the correct version of Flutter.
      1. Install FVM using the instructions on the FVM website
        - https://fvm.app
      2. Ensure you are using Flutter version `3.22.0` or higher (required for Dart SDK >=3.0.0)
        - `fvm use 3.22.0`
   2. Install packages.
      ```bash
      $ cd talawa_lint
      $ fvm flutter pub get
      $ cd ..
      $ fvm flutter pub get
      ```
   3. Run the `flutter doctor` command to determine whether everything is OK. 
      1. Here is the specific command.
         ```bash
         $ fvm flutter doctor
         ```      
      2. Fix any issues the command output suggests need rectification. 
         1. **Note**: Though you may have setup an SDK in Android Studio, the configuration may have to be setup separately on the CLI.
            1. Here is an example SDK error:
               ```
               [✗] Android toolchain - develop for Android devices
                  ✗ Unable to locate Android SDK.
                     Install Android Studio from: https://developer.android.com/studio/index.html
                     On first launch it will assist you in installing the Android SDK components.
                     (or visit https://flutter.dev/to/linux-android-setup for detailed instructions).
                     If the Android SDK has been installed to a custom location, please use
                     `flutter config --android-sdk` to update to that location.

               ```
            2. You will need to run the `flutter config --android-sdk` command to correct the CLI configuration. On a Linux based system this will typically be `~/Android/Sdk/`. Here is an example.
               ```
               $ fvm flutter config --android-sdk /PATH/TO/Android/Sdk/  
               ```
   4. For a first time installation, you will need to accept the Flutter licences agreements.
      ```
      $ fvm flutter doctor --android-licenses
      ```
   5. Run the application
      1. Using a virtual device
         1. Create and launch an Android Virtual Device
         2. Run the application
         3. **Note:** In some cases the run icon in your IDE may be disabled, and you'll need to use the CLI
            ```
            $ fvm flutter run
            ```
      2. Using your phone
         1. Enable USB debugging
         2. Connect your phone
   6. **Set the API URL**: When you first launch the app, you will be prompted to enter the Talawa API URL. 
      1. If you are running the API locally on your development machine and testing on an emulator, use `http://10.0.2.2:4000/graphql` (Android emulator special address that maps to localhost).
      2. If you are running the API on your local network and testing on a physical device, use `http://<YOUR_LOCAL_IP>:4000/graphql` where `<YOUR_LOCAL_IP>` is the IP address of your development machine on your local network.
      3. Alternatively, you can scan a QR code if your organization provides one with the API URL pre-configured.
   7. Start developing!
