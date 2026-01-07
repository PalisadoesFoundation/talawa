# Overview for `CupertinoFormSection`

## Description

An iOS-style form section.

 The base constructor for [CupertinoFormSection] constructs an
 edge-to-edge style section which includes an iOS-style header, rows,
 the dividers between rows, and borders on top and bottom of the rows.

 The [CupertinoFormSection.insetGrouped] constructor creates a round-edged and
 padded section that is commonly seen in notched-displays like iPhone X and
 beyond. Creates an iOS-style header, rows, and the dividers
 between rows. Does not create borders on top and bottom of the rows.

 The [header] parameter sets the form section header. The section header lies
 above the [children] rows, with margins that match the iOS style.

 The [footer] parameter sets the form section footer. The section footer
 lies below the [children] rows.

 The [children] parameter is required and sets the list of rows shown in
 the section. The [children] parameter takes a list, as opposed to a more
 efficient builder function that lazy builds, because forms are intended to
 be short in row count. It is recommended that only [CupertinoFormRow] and
 [CupertinoTextFormFieldRow] widgets be included in the [children] list in
 order to retain the iOS look.

 The [margin] parameter sets the spacing around the content area of the
 section encapsulating [children].

 The [decoration] parameter sets the decoration around [children].
 If null, defaults to [CupertinoColors.secondarySystemGroupedBackground].
 If null, defaults to 10.0 circular radius when constructing with
 [CupertinoFormSection.insetGrouped]. Defaults to zero radius for the
 standard [CupertinoFormSection] constructor.

 The [backgroundColor] parameter sets the background color behind the section.
 If null, defaults to [CupertinoColors.systemGroupedBackground].

 

 See also:

  * [CupertinoFormRow], an iOS-style list tile, a typical child of
    [CupertinoFormSection].
  * [CupertinoListSection], an iOS-style list section.

## Dependencies

- StatelessWidget

## Members

- **_type**: `CupertinoListSectionType`
- **header**: `Widget?`
  Sets the form section header. The section header lies above the
 [children] rows.

- **footer**: `Widget?`
  Sets the form section footer. The section footer lies below the
 [children] rows.

- **margin**: `EdgeInsetsGeometry`
  Margin around the content area of the section encapsulating [children].

 Defaults to zero padding if constructed with standard
 [CupertinoFormSection] constructor. Defaults to the standard notched-style
 iOS margin when constructing with [CupertinoFormSection.insetGrouped].

- **children**: `List&lt;Widget&gt;`
  The list of rows in the section.

 This takes a list, as opposed to a more efficient builder function that
 lazy builds, because forms are intended to be short in row count. It is
 recommended that only [CupertinoFormRow] and [CupertinoTextFormFieldRow]
 widgets be included in the [children] list in order to retain the iOS look.

- **decoration**: `BoxDecoration?`
  Sets the decoration around [children].

 If null, background color defaults to
 [CupertinoColors.secondarySystemGroupedBackground].

 If null, border radius defaults to 10.0 circular radius when constructing
 with [CupertinoFormSection.insetGrouped]. Defaults to zero radius for the
 standard [CupertinoFormSection] constructor.

- **backgroundColor**: `Color`
  Sets the background color behind the section.

 Defaults to [CupertinoColors.systemGroupedBackground].

- **clipBehavior**: `Clip`
  

 Defaults to [Clip.none].

## Constructors

### Unnamed Constructor
Creates a section that mimics standard iOS forms.

 The base constructor for [CupertinoFormSection] constructs an
 edge-to-edge style section which includes an iOS-style header,
 rows, the dividers between rows, and borders on top and bottom of the rows.

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
 [CupertinoFormSection.insetGrouped]. Defaults to zero radius for the
 standard [CupertinoFormSection] constructor.

 The [backgroundColor] parameter sets the background color behind the
 section. If null, defaults to [CupertinoColors.systemGroupedBackground].

 

### insetGrouped
Creates a section that mimics standard "Inset Grouped" iOS forms.

 The [CupertinoFormSection.insetGrouped] constructor creates a round-edged and
 padded section that is commonly seen in notched-displays like iPhone X and
 beyond. Creates an iOS-style header, rows, and the dividers
 between rows. Does not create borders on top and bottom of the rows.

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
 section encapsulating [children], and defaults to the standard
 notched-style iOS form padding.

 The [decoration] parameter sets the decoration around [children].
 If null, defaults to [CupertinoColors.secondarySystemGroupedBackground].
 If null, defaults to 10.0 circular radius when constructing with
 [CupertinoFormSection.insetGrouped]. Defaults to zero radius for the
 standard [CupertinoFormSection] constructor.

 The [backgroundColor] parameter sets the background color behind the
 section. If null, defaults to [CupertinoColors.systemGroupedBackground].

 

#### Parameters

- ``: `dynamic`
- ``: `dynamic`
- ``: `dynamic`
- ``: `dynamic`
- ``: `dynamic`
- ``: `dynamic`
- ``: `dynamic`
- ``: `dynamic`
