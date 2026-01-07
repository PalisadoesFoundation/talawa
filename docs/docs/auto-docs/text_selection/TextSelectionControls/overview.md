# Overview for `TextSelectionControls`

## Description

An interface for building the selection UI, to be provided by the
 implementer of the toolbar widget.

 Parts of this class, including [buildToolbar], have been deprecated in favor
 of [EditableText.contextMenuBuilder], which is now the preferred way to
 customize the context menus.

 ## Use with [EditableText.contextMenuBuilder]

 For backwards compatibility during the deprecation period, when
 [EditableText.selectionControls] is set to an object that does not mix in
 [TextSelectionHandleControls], [EditableText.contextMenuBuilder] is ignored
 in favor of the deprecated [buildToolbar].

 To migrate code from [buildToolbar] to the preferred
 [EditableText.contextMenuBuilder], while still using [buildHandle], mix in
 [TextSelectionHandleControls] into the [TextSelectionControls] subclass when
 moving any toolbar code to a callback passed to
 [EditableText.contextMenuBuilder].

 In due course, [buildToolbar] will be removed, and the mixin will no longer
 be necessary as a way to flag to the framework that the code has been
 migrated and does not expect [buildToolbar] to be called.

 For more information, see <https://docs.flutter.dev/release/breaking-changes/context-menus>.

 See also:

  * [SelectionArea], which selects appropriate text selection controls
    based on the current platform.

