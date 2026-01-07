# Overview for `TextSelectionThemeData`

## Description

Defines the visual properties needed for text selection in [TextField] and
 [SelectableText] widgets.

 Used by [TextSelectionTheme] to control the visual properties of text
 selection in a widget subtree.

 Use [TextSelectionTheme.of] to access the closest ancestor
 [TextSelectionTheme] of the current [BuildContext].

 See also:

  * [TextSelectionTheme], an [InheritedWidget] that propagates the theme down its
    subtree.
  * [InputDecorationTheme], which defines most other visual properties of
    text fields.

## Dependencies

- Diagnosticable

## Members

- **cursorColor**: `Color?`
  The color of the cursor in the text field.

 The cursor indicates the current location of text insertion point in
 the field.

- **selectionColor**: `Color?`
  The background color of selected text.

- **selectionHandleColor**: `Color?`
  The color of the selection handles on the text field.

 Selection handles are used to indicate the bounds of the selected text,
 or as a handle to drag the cursor to a new location in the text.

 On iOS [TextField] and [SelectableText] cannot access [selectionHandleColor].
 To set the [selectionHandleColor] on iOS, you can change the
 [CupertinoThemeData.primaryColor] by wrapping the subtree containing
 your [TextField] or [SelectableText] with a [CupertinoTheme].

## Constructors

### Unnamed Constructor
Creates the set of properties used to configure [TextField]s.

