# Overview for `DefaultProcessTextService`

## Description

The service used by default for the text processing feature.

 Any widget may use this service to get a list of text processing actions
 and send requests to activate these text actions.

 This is currently only supported on Android and it requires adding the
 following '<queries>' element to the Android manifest file:

 <manifest ...>
     <application ...>
       ...
     </application>
     <!-- Required to query activities that can process text, see:
          https://developer.android.com/training/package-visibility and
          https://developer.android.com/reference/android/content/Intent#ACTION_PROCESS_TEXT.

          In particular, this is used by the Flutter engine in io.flutter.plugin.text.ProcessTextPlugin. -->
     <queries>
         <intent>
             <action android:name="android.intent.action.PROCESS_TEXT"/>
             <data android:mimeType="text/plain"/>
         </intent>
     </queries>
 </manifest>

 The '<queries>' element is part of the Android manifest file generated when
 running the 'flutter create' command.

 If the '<queries>' element is not found, `` will return an
 empty list of `ProcessTextAction`.

 See also:

  * [ProcessTextService], the service that this implements.

## Dependencies

- ProcessTextService

## Members

- **_processTextChannel**: `MethodChannel`
  The channel used to communicate with the engine side.

## Constructors

### Unnamed Constructor
Creates the default service to interact with the platform text processing
 feature via communication over the text processing [MethodChannel].

