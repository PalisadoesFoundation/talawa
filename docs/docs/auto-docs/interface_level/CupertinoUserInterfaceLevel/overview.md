# Overview for `CupertinoUserInterfaceLevel`

## Description

Establishes a subtree in which [CupertinoUserInterfaceLevel.of] resolves to
 the given visual elevation from the [CupertinoUserInterfaceLevelData]. This
 can be used to apply style differences based on a widget's elevation.

 Querying the current elevation status using [CupertinoUserInterfaceLevel.of]
 will cause your widget to rebuild automatically whenever the
 [CupertinoUserInterfaceLevelData] changes.

 If no [CupertinoUserInterfaceLevel] is in scope then the
 [CupertinoUserInterfaceLevel.of] method will throw an exception.
 Alternatively, [CupertinoUserInterfaceLevel.maybeOf] can be used, which
 returns null instead of throwing if no [CupertinoUserInterfaceLevel] is in
 scope.

 See also:

  * [CupertinoUserInterfaceLevelData], specifies the visual level for the content
    in the subtree [CupertinoUserInterfaceLevel] established.

## Dependencies

- InheritedWidget

## Members

- **_data**: `CupertinoUserInterfaceLevelData`
## Constructors

### Unnamed Constructor
Creates a [CupertinoUserInterfaceLevel] to change descendant Cupertino widget's
 visual level.

