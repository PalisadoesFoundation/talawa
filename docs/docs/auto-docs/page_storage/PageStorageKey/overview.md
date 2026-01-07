# Overview for `PageStorageKey`

## Description

A [Key] that can be used to persist the widget state in storage after the
 destruction and will be restored when recreated.

 Each key with its value plus the ancestor chain of other [PageStorageKey]s
 need to be unique within the widget's closest ancestor [PageStorage]. To
 make it possible for a saved value to be found when a widget is recreated,
 the key's value must not be objects whose identity will change each time the
 widget is created.

 See also:

  * [PageStorage], which manages the data storage for widgets using
    [PageStorageKey]s.

## Dependencies

- ValueKey

## Constructors

### Unnamed Constructor
Creates a [ValueKey] that defines where [PageStorage] values will be saved.

