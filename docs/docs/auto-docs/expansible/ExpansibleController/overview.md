# Overview for `ExpansibleController`

## Description

A controller for managing the expansion state of an [Expansible].

 This class is a [ChangeNotifier] that notifies its listeners if the value of
 [isExpanded] changes.

 This controller provides methods to programmatically expand or collapse the
 widget, and it allows external components to query the current expansion
 state.

 The controller's [expand] and [collapse] methods cause the
 the [Expansible] to rebuild, so they may not be called from
 a build method.

 Remember to [dispose] of the [ExpansibleController] when it is no longer
 needed. This will ensure we discard any resources used by the object.

## Dependencies

- ChangeNotifier

## Members

- **_isExpanded**: `bool`
## Constructors

### Unnamed Constructor
Creates a controller to be used with [Expansible.controller].

