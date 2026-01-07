# Overview for `AutomaticKeepAlive`

## Description

Allows subtrees to request to be kept alive in lazy lists.

 This widget is like [KeepAlive] but instead of being explicitly configured,
 it listens to [KeepAliveNotification] messages from the [child] and other
 descendants.

 The subtree is kept alive whenever there is one or more descendant that has
 sent a [KeepAliveNotification] and not yet triggered its
 [KeepAliveNotification.handle].

 To send these notifications, consider using [AutomaticKeepAliveClientMixin].

## Dependencies

- StatefulWidget

## Members

- **child**: `Widget`
  The widget below this widget in the tree.

 

## Constructors

### Unnamed Constructor
Creates a widget that listens to [KeepAliveNotification]s and maintains a
 [KeepAlive] widget appropriately.

