# Overview for `FlexibleSpaceBarSettings`

## Description

Provides sizing and opacity information to a [FlexibleSpaceBar].

 See also:

  * [FlexibleSpaceBar] which creates a flexible space bar.

## Dependencies

- InheritedWidget

## Members

- **toolbarOpacity**: `double`
  Affects how transparent the text within the toolbar appears.

- **minExtent**: `double`
  Minimum height of the resulting [FlexibleSpaceBar] when fully collapsed.

- **maxExtent**: `double`
  Maximum height of the resulting [FlexibleSpaceBar] when fully expanded.

- **currentExtent**: `double`
  If the [FlexibleSpaceBar.title] or the [FlexibleSpaceBar.background] is
 not null, then this value is used to calculate the relative scale of
 these elements upon initialization.

- **isScrolledUnder**: `bool?`
  True if the FlexibleSpaceBar overlaps the primary scrollable's contents.

 This value is used by the [AppBar] to resolve
 [AppBar.backgroundColor] against [WidgetState.scrolledUnder],
 i.e. to enable apps to specify different colors when content
 has been scrolled up and behind the app bar.

 Null if the caller hasn't determined if the FlexibleSpaceBar
 overlaps the primary scrollable's contents.

- **hasLeading**: `bool?`
  True if the FlexibleSpaceBar has a leading widget.

 This value is used by the [FlexibleSpaceBar] to determine
 if there should be a gap between the leading widget and
 the title.

 Null if the caller hasn't determined if the FlexibleSpaceBar
 has a leading widget.

## Constructors

### Unnamed Constructor
Creates a Flexible Space Bar Settings widget.

 Used by [Scaffold] and [SliverAppBar]. [child] must have a
 [FlexibleSpaceBar] widget in its tree for the settings to take affect.

