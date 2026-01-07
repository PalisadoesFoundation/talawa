# Method: `hasDrawer`

## Description

Whether the Scaffold that most tightly encloses the given context has a
 drawer.

 If this is being used during a build (for example to decide whether to
 show an "open drawer" button), set the `registerForUpdates` argument to
 true. This will then set up an [InheritedWidget] relationship with the
 [Scaffold] so that the client widget gets rebuilt whenever the [hasDrawer]
 value changes.

 This method can be expensive (it walks the element tree).

 See also:

  * [Scaffold.of], which provides access to the [ScaffoldState] object as a
    whole, from which you can show bottom sheets, and so forth.

## Return Type
`bool`

## Parameters

- `context`: `BuildContext`
- ``: `dynamic`
