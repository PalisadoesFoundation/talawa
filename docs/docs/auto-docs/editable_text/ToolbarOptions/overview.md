# Overview for `ToolbarOptions`

## Description

Toolbar configuration for [EditableText].

 Toolbar is a context menu that will show up when user right click or long
 press the [EditableText]. It includes several options: cut, copy, paste,
 and select all.

 [EditableText] and its derived widgets have their own default [ToolbarOptions].
 Create a custom [ToolbarOptions] if you want explicit control over the toolbar
 option.

## Members

- **empty**: `ToolbarOptions`
  An instance of [ToolbarOptions] with no options enabled.

- **copy**: `bool`
  Whether to show copy option in toolbar.

 Defaults to false.

- **cut**: `bool`
  Whether to show cut option in toolbar.

 If [EditableText.readOnly] is set to true, cut will be disabled regardless.

 Defaults to false.

- **paste**: `bool`
  Whether to show paste option in toolbar.

 If [EditableText.readOnly] is set to true, paste will be disabled regardless.

 Defaults to false.

- **selectAll**: `bool`
  Whether to show select all option in toolbar.

 Defaults to false.

## Constructors

### Unnamed Constructor
Create a toolbar configuration with given options.

 All options default to false if they are not explicitly set.

