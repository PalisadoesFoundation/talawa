# Overview for `CupertinoListSection`

## Description

An iOS-style list section.

 The [CupertinoListSection] is a container for children widgets. These are
 most often [CupertinoListTile]s.

 The base constructor for [CupertinoListSection] constructs an
 edge-to-edge style section which includes an iOS-style header, the dividers
 between rows, and borders on top and bottom of the rows. An example of such
 list section are sections in iOS Settings app.

 The [CupertinoListSection.insetGrouped] constructor creates a round-edged
 and padded section that is seen in iOS Notes and Reminders apps. It creates
 an iOS-style header, and the dividers between rows. Does not create borders
 on top and bottom of the rows.

 The section [header] lies above the [children] rows, with margins and style
 that match the iOS style.

 The section [footer] lies below the [children] rows and is used to provide
 additional information for current list section.

 The [children] is the list of widgets to be displayed in this list section.
 Typically, the children are of type [CupertinoListTile], however these is
 not enforced.

 The [margin] is used to provide spacing around the content area of the
 section encapsulating [children].

 The [decoration] of [children] specifies how they should be decorated. If it
 is not provided in constructor, the background color of [children] defaults
 to [CupertinoColors.secondarySystemGroupedBackground] and border radius of
 children group defaults to 10.0 circular radius when constructing with
 [CupertinoListSection.insetGrouped]. Defaults to zero radius for the
 standard [CupertinoListSection] constructor.

 The [dividerMargin] and [additionalDividerMargin] specify the starting
 margin of the divider between list tiles. The [dividerMargin] is always
 present, but [additionalDividerMargin] is only added to the [dividerMargin]
 if `hasLeading` is set to true in the constructor, which is the default
 value.

 The [backgroundColor] of the section defaults to
 [CupertinoColors.systemGroupedBackground].

 

 
 Creates a base [CupertinoListSection] containing [CupertinoListTile]s with
 `leading`, `title`, `additionalInfo` and `trailing` widgets.

 ** See code in examples/api/lib/cupertino/list_section/list_section_base.0.dart **
 

 
 Creates an "Inset Grouped" [CupertinoListSection] containing
 notched [CupertinoListTile]s with `leading`, `title`, `additionalInfo` and
 `trailing` widgets.

 ** See code in examples/api/lib/cupertino/list_section/list_section_inset.0.dart **
 

 See also:

  * [CupertinoListTile], an iOS-style list tile, a typical child of
    [CupertinoListSection].
  * [CupertinoFormSection], an iOS-style form section.

## Dependencies

- StatelessWidget

## Members

- **type**: `CupertinoListSectionType`
  The type of list section, either base or inset grouped.

 This member is public for testing purposes only and cannot be set
 manually. Instead, use a corresponding constructors.

- **header**: `Widget?`
  Sets the form section header. The section header lies above the [children]
 rows. Usually a [Text] widget.

- **footer**: `Widget?`
  Sets the form section footer. The section footer lies below the [children]
 rows. Usually a [Text] widget.

- **margin**: `EdgeInsetsGeometry`
  Margin around the content area of the section encapsulating [children].

 Defaults to zero padding if constructed with standard
 [CupertinoListSection] constructor. Defaults to the standard notched-style
 iOS margin when constructing with [CupertinoListSection.insetGrouped].

- **children**: `List&lt;Widget&gt;?`
  The list of rows in the section. Usually a list of [CupertinoListTile]s.

 This takes a list, as opposed to a more efficient builder function that
 lazy builds, because such lists are intended to be short in row count.
 It is recommended that only [CupertinoListTile] widget be included in the
 [children] list in order to retain the iOS look.

- **decoration**: `BoxDecoration?`
  Sets the decoration around [children].

 If null, background color defaults to
 [CupertinoColors.secondarySystemGroupedBackground].

 If null, border radius defaults to 10.0 circular radius when constructing
 with [CupertinoListSection.insetGrouped]. Defaults to zero radius for the
 standard [CupertinoListSection] constructor.

- **backgroundColor**: `Color`
  Sets the background color behind the section.

 Defaults to [CupertinoColors.systemGroupedBackground].

- **clipBehavior**: `Clip`
  

 Defaults to [Clip.hardEdge].

- **dividerMargin**: `double`
  The starting offset of a margin between two list tiles.

- **additionalDividerMargin**: `double`
  Additional starting inset of the divider used between rows. This is used
 when adding a leading icon to children and a divider should start at the
 text inset instead of the icon.

- **topMargin**: `double?`
  Margin above the list section. Only used in edge-to-edge variant and it
 matches iOS style by default.

- **separatorColor**: `Color?`
  Sets the color for the dividers between rows, and borders on top and
 bottom of the rows.

 If null, defaults to [CupertinoColors.separator].

## Constructors

### Unnamed Constructor
Creates a section that mimics standard iOS forms.

 The base constructor for [CupertinoListSection] constructs an
 edge-to-edge style section which includes an iOS-style header, the dividers
 between rows, and borders on top and bottom of the rows. An example of such
 list section are sections in iOS Settings app.

 The [header] parameter sets the form section header. The section header
 lies above the [children] rows, with margins that match the iOS style.

 The [footer] parameter sets the form section footer. The section footer
 lies below the [children] rows.

 The [children] parameter is required and sets the list of rows shown in
 the section. The [children] parameter takes a list, as opposed to a more
 efficient builder function that lazy builds, because forms are intended to
 be short in row count. It is recommended that only [CupertinoFormRow] and
 [CupertinoTextFormFieldRow] widgets be included in the [children] list in
 order to retain the iOS look.

 The [margin] parameter sets the spacing around the content area of the
 section encapsulating [children], and defaults to zero padding.

 The [decoration] parameter sets the decoration around [children].
 If null, defaults to [CupertinoColors.secondarySystemGroupedBackground].
 If null, defaults to 10.0 circular radius when constructing with
 [CupertinoListSection.insetGrouped]. Defaults to zero radius for the
 standard [CupertinoListSection] constructor.

 The [backgroundColor] parameter sets the background color behind the
 section. If null, defaults to [CupertinoColors.systemGroupedBackground].

 The [dividerMargin] parameter sets the starting offset of the divider
 between rows.

 The [additionalDividerMargin] parameter adds additional margin to existing
 [dividerMargin] when [hasLeading] is set to true. By default, it offsets
 for the width of leading and space between leading and title of
 [CupertinoListTile], but it can be overwritten for custom look.

 The [hasLeading] parameter specifies whether children [CupertinoListTile]
 widgets contain leading or not. Used for calculating correct starting
 margin for the divider between rows.

 The [topMargin] is used to specify the margin above the list section. It
 matches the iOS look by default.

 

### insetGrouped
Creates a section that mimics standard "Inset Grouped" iOS list section.

 The [CupertinoListSection.insetGrouped] constructor creates a round-edged
 and padded section that is seen in iOS Notes and Reminders apps. It creates
 an iOS-style header, and the dividers between rows. Does not create borders
 on top and bottom of the rows.

 The [header] parameter sets the form section header. The section header
 lies above the [children] rows, with margins that match the iOS style.

 The [footer] parameter sets the form section footer. The section footer
 lies below the [children] rows.

 The [children] parameter is required and sets the list of rows shown in
 the section. The [children] parameter takes a list, as opposed to a more
 efficient builder function that lazy builds, because forms are intended to
 be short in row count. It is recommended that only [CupertinoListTile]
 widget be included in the [children] list in order to retain the iOS look.

 The [margin] parameter sets the spacing around the content area of the
 section encapsulating [children], and defaults to the standard
 notched-style iOS form padding.

 The [decoration] parameter sets the decoration around [children].
 If null, defaults to [CupertinoColors.secondarySystemGroupedBackground].
 If null, defaults to 10.0 circular radius when constructing with
 [CupertinoListSection.insetGrouped]. Defaults to zero radius for the
 standard [CupertinoListSection] constructor.

 The [backgroundColor] parameter sets the background color behind the
 section. If null, defaults to [CupertinoColors.systemGroupedBackground].

 The [dividerMargin] parameter sets the starting offset of the divider
 between rows.

 The [additionalDividerMargin] parameter adds additional margin to existing
 [dividerMargin] when [hasLeading] is set to true. By default, it offsets
 for the width of leading and space between leading and title of
 [CupertinoListTile], but it can be overwritten for custom look.

 The [hasLeading] parameter specifies whether children [CupertinoListTile]
 widgets contain leading or not. Used for calculating correct starting
 margin for the divider between rows.

 

#### Parameters

- ``: `dynamic`
- ``: `dynamic`
- ``: `dynamic`
- ``: `dynamic`
- ``: `dynamic`
- ``: `dynamic`
- ``: `dynamic`
- ``: `dynamic`
- ``: `dynamic`
- ``: `dynamic`
- ``: `dynamic`
- ``: `dynamic`
- ``: `dynamic`
