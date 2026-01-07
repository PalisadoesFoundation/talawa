# Overview for `BoxScrollView`

## Description

A [ScrollView] that uses a single child layout model.

 
 [ScrollView]s are often decorated with [Scrollbar]s and overscroll indicators,
 which are managed by the inherited [ScrollBehavior]. Placing a
 [ScrollConfiguration] above a ScrollView can modify these behaviors for that
 ScrollView, or can be managed app-wide by providing a ScrollBehavior to
 [MaterialApp.scrollBehavior] or [CupertinoApp.scrollBehavior].
 

 See also:

  * [ListView], which is a [BoxScrollView] that uses a linear layout model.
  * [GridView], which is a [BoxScrollView] that uses a 2D layout model.
  * [CustomScrollView], which can combine multiple child layout models into a
    single scroll view.

## Dependencies

- ScrollView

## Members

- **padding**: `EdgeInsetsGeometry?`
  The amount of space by which to inset the children.

## Constructors

### Unnamed Constructor
Creates a [ScrollView] uses a single child layout model.

 If the [primary] argument is true, the [controller] must be null.

