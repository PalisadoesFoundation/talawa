# Method: `uninstallDeferredComponent`

## Description

Requests that a deferred component identified by the [componentName] be
 uninstalled.

 Since uninstallation typically requires significant disk i/o, this method only
 signals the intent to uninstall. Completion of the returned future indicates
 that the request to uninstall has been registered. Actual uninstallation (e.g.,
 removal of assets and files) may occur at a later time. However, once uninstallation
 is requested, the deferred component should not be used anymore until
 [installDeferredComponent] or `` is called again.

 It is safe to request an uninstall when dart code from the component is in use,
 but assets from the component should not be used once the component uninstall is
 requested. The dart code will remain usable in the app's current session but
 is not guaranteed to work in future sessions.

 See also:

  * [installDeferredComponent], a method to install asset-only components.
  * [loadLibrary](https://api.dart.dev/dart-mirrors/LibraryDependencyMirror/loadLibrary.html),
    the dart method to trigger the installation of the corresponding deferred component that
    contains the dart library.

## Return Type
`Future&lt;void&gt;`

## Parameters

- ``: `dynamic`
