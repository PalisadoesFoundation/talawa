# Overview for `FocusSemanticEvent`

## Description

An event to move the accessibility focus.

 Using this API is generally not recommended, as it may break a users' expectation of
 how a11y focus works and therefore should be used very carefully.

 One possible use case:
 For example, the currently focused rendering object is replaced by another rendering
 object. In general, such design should be avoided if possible. If not, one may want
 to refocus the newly added rendering object.

 One example that is not recommended:
 When a new popup or dropdown opens, moving the focus in these cases may confuse users
 and make it less accessible.

 

 The following code snippet shows how one can request focus on a
 certain widget.

 ```dart
 class MyWidget extends StatefulWidget 

 class _MyWidgetState extends State&lt;MyWidget&gt; 
 ```
 

 This currently only supports Android and iOS.

## Dependencies

- SemanticsEvent

## Constructors

### Unnamed Constructor
Constructs an event that triggers a focus change by the platform.

