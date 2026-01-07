# Overview for `MergeableMaterial`

## Description

Displays a list of [MergeableMaterialItem] children. The list contains
 [MaterialSlice] items whose boundaries are either "merged" with adjacent
 items or separated by a [MaterialGap]. The [children] are distributed along
 the given [mainAxis] in the same way as the children of a [ListBody]. When
 the list of children changes, gaps are automatically animated open or closed
 as needed.

 To enable this widget to correlate its list of children with the previous
 one, each child must specify a key.

 When a new gap is added to the list of children the adjacent items are
 animated apart. Similarly when a gap is removed the adjacent items are
 brought back together.

 When a new slice is added or removed, the app is responsible for animating
 the transition of the slices, while the gaps will be animated automatically.

 See also:

  * [Card], a piece of material that does not support splitting and merging
    but otherwise looks the same.

## Dependencies

- StatefulWidget

## Members

- **children**: `List&lt;MergeableMaterialItem&gt;`
  The children of the [MergeableMaterial].

- **mainAxis**: `Axis`
  The main layout axis.

- **elevation**: `double`
  The z-coordinate at which to place all the [Material] slices.

 Defaults to 2, the appropriate elevation for cards.

- **hasDividers**: `bool`
  Whether connected pieces of [MaterialSlice] have dividers between them.

- **dividerColor**: `Color?`
  Defines color used for dividers if [hasDividers] is true.

 If [dividerColor] is null, then [DividerThemeData.color] is used. If that
 is null, then [ThemeData.dividerColor] is used.

## Constructors

### Unnamed Constructor
Creates a mergeable Material list of items.

