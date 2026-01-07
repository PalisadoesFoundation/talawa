# Overview for `RestorableCupertinoTabController`

## Description

A [RestorableProperty] that knows how to store and restore a
 [CupertinoTabController].

 The [CupertinoTabController] is accessible via the [value] getter. During
 state restoration, the property will restore [CupertinoTabController.index]
 to the value it had when the restoration data it is getting restored from
 was collected.

## Dependencies

- RestorableChangeNotifier

## Members

- **_initialIndex**: `int`
## Constructors

### Unnamed Constructor
Creates a [RestorableCupertinoTabController] to control the tab index of
 [CupertinoTabScaffold] and [CupertinoTabBar].

 The `initialIndex` defaults to zero. The value must be greater than or
 equal to zero, and less than the total number of tabs.

