# Overview for `DefaultSelectionStyle`

## Description

The selection style to apply to descendant [EditableText] widgets which
 don't have an explicit style.

 

 

 See also:
  * [TextSelectionTheme]: which also creates a [DefaultSelectionStyle] for
    the subtree.

## Dependencies

- InheritedTheme

## Members

- **defaultColor**: `Color`
  The default cursor and selection color (semi-transparent grey).

 This is the color that the [Text] widget uses when the specified selection
 color is null.

- **cursorColor**: `Color?`
  The color of the text field's cursor.

 The cursor indicates the current location of the text insertion point in
 the field.

- **selectionColor**: `Color?`
  The background color of selected text.

- **mouseCursor**: `MouseCursor?`
  The [MouseCursor] for mouse pointers hovering over selectable Text widgets.

 If this property is null, [SystemMouseCursors.text] will be used.

## Constructors

### Unnamed Constructor
Creates a default selection style widget that specifies the selection
 properties for all widgets below it in the widget tree.

### fallback
A const-constructable default selection style that provides fallback
 values (null).

 Returned from [of] when the given [BuildContext] doesn't have an enclosing
 default selection style.

 This constructor creates a [DefaultTextStyle] with an invalid [child],
 which means the constructed value cannot be incorporated into the tree.

#### Parameters

- ``: `dynamic`
