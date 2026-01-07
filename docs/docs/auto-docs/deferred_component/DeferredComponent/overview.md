# Overview for `DeferredComponent`

## Description

Manages the installation and loading of deferred components.

 Deferred components allow Flutter applications to download precompiled AOT
 dart code and assets at runtime, reducing the install size of apps and
 avoiding installing unnecessary code/assets on end user devices. Common
 use cases include deferring installation of advanced or infrequently
 used features and limiting locale specific features to users of matching
 locales. Deferred components can only deliver split off parts of the same
 app that was built and installed on the device. It cannot load new code
 written after the app is distributed.

 Deferred components are currently an Android-only feature. The methods in
 this class are a no-op and all assets and dart code are already available
 without installation if called on other platforms.

