# Method: `installDeferredComponent`

## Description

Requests that an assets-only deferred component identified by the [componentName]
 be downloaded and installed.

 This method returns a Future&lt;void&gt; that will complete when the feature is
 installed and any assets are ready to be used. When an error occurs, the
 future will complete with an error.

 This method should be used for asset-only deferred components or loading just
 the assets from a component with both dart code and assets. Deferred components
 containing dart code should call `` on a deferred imported
 library's prefix to ensure that the dart code is properly loaded as
 `` will provide the loading unit ID needed for the Dart
 library loading process. For example:

 ```dart
 import 'split_component.dart' deferred as split_component;
 // ...
 void  
 ```

 This method will not load associated dart libraries contained in the component,
 though it will download the files necessary and subsequent calls to ``
 to load will complete faster.

 Assets installed by this method may be accessed in the same way as any other
 local asset by providing a string path to the asset.

 See also:

  * [uninstallDeferredComponent], a method to request the uninstall of a component.
  * [loadLibrary](https://dart.dev/guides/language/language-tour#lazily-loading-a-library),
    the Dart method to trigger the installation of the corresponding deferred component that
    contains the Dart library.

## Return Type
`Future&lt;void&gt;`

## Parameters

- ``: `dynamic`
