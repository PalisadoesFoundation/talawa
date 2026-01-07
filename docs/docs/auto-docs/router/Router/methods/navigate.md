# Method: `navigate`

## Description

Forces the [Router] to run the [callback] and create a new history
 entry in the browser.

 The web application relies on the [Router] to report new route information
 in order to create browser history entry. The [Router] will only report
 them if it detects the [RouteInformation.uri] changes. Use this
 method if you want the [Router] to report the route information even if
 the location does not change. This can be useful when you want to
 support the browser backward and forward button without changing the URL.

 For example, you can store certain state such as the scroll position into
 the [RouteInformation.state]. If you use this method to update the
 scroll position multiple times with the same URL, the browser will create
 a stack of new history entries with the same URL but different
 [RouteInformation.state]s that store the new scroll positions. If the user
 click the backward button in the browser, the browser will restore the
 scroll positions saved in history entries without changing the URL.

 See also:

  * [Router]: see the "URL updates for web applications" section for more
    information about route information reporting.
  * [neglect]: which forces the [Router] to not create a new history entry
    even if location does change.

## Return Type
`void`

## Parameters

- `context`: `BuildContext`
- `callback`: `VoidCallback`
