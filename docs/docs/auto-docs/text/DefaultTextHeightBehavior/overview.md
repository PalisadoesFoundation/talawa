# Overview for `DefaultTextHeightBehavior`

## Description

The [TextHeightBehavior] that will apply to descendant [Text] and [EditableText]
 widgets which have not explicitly set [Text.textHeightBehavior].

 If there is a [DefaultTextStyle] with a non-null [DefaultTextStyle.textHeightBehavior]
 below this widget, the [DefaultTextStyle.textHeightBehavior] will be used
 over this widget's [TextHeightBehavior].

 See also:

  * [DefaultTextStyle], which defines a [TextStyle] to apply to descendant
    [Text] widgets.

## Dependencies

- InheritedTheme

## Members

- **textHeightBehavior**: `TextHeightBehavior`
  

## Constructors

### Unnamed Constructor
Creates a default text height behavior for the given subtree.

