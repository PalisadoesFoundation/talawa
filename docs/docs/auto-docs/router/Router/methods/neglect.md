# Method: `neglect`

## Description

Forces the [Router] to run the [callback] without creating a new history
 entry in the browser.

 The web application relies on the [Router] to report new route information
 in order to create browser history entry. The [Router] will report them
 automatically if it detects the [RouteInformation.uri] changes.

 Creating a new route history entry makes users feel they have visited a
 new page, and the browser back button brings them back to previous history
 entry. Use this method if you don't want the [Router] to create a new
 route information even if it detects changes as a result of running the
 [callback].

 Using this method will still update the URL and state in current history
 entry.

 See also:

  * [Router]: see the "URL updates for web applications" section for more
    information about route information reporting.
  * [navigate]: which forces the [Router] to create a new history entry
    even if location does not change.

## Return Type
`void`

## Parameters

- `context`: `BuildContext`
- `callback`: `VoidCallback`
