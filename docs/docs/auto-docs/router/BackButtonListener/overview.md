# Overview for `BackButtonListener`

## Description

A convenience widget that registers a callback for when the back button is pressed.

 In order to use this widget, there must be an ancestor [Router] widget in the tree
 that has a [RootBackButtonDispatcher]. e.g. The [Router] widget created by the
 [MaterialApp.router] has a built-in [RootBackButtonDispatcher] by default.

 It only applies to platforms that accept back button clicks, such as Android.

 It can be useful for scenarios, in which you create a different state in your
 screen but don't want to use a new page for that.

## Dependencies

- StatefulWidget

## Members

- **child**: `Widget`
  The widget below this widget in the tree.

- **onBackButtonPressed**: `ValueGetter&lt;Future&lt;bool&gt;&gt;`
  The callback function that will be called when the back button is pressed.

 It must return a boolean future with true if this child will handle the request;
 otherwise, return a boolean future with false.

## Constructors

### Unnamed Constructor
Creates a BackButtonListener widget .

