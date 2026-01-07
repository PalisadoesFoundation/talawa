# Overview for `SelectionArea`

## Description

A widget that introduces an area for user selections with adaptive selection
 controls.

 This widget creates a [SelectableRegion] with platform-adaptive selection
 controls.

 Flutter widgets are not selectable by default. To enable selection for
 a specific screen, consider wrapping the body of the [Route] with a
 [SelectionArea].

 The [SelectionArea] widget must have a [Localizations] ancestor that
 contains a [MaterialLocalizations] delegate; using the [MaterialApp] widget
 ensures that such an ancestor is present.

 
 This example shows how to make a screen selectable.

 ** See code in examples/api/lib/material/selection_area/selection_area.0.dart **
 

 See also:

  * [SelectableRegion], which provides an overview of the selection system.
  * [SelectableText], which enables selection on a single run of text.
  * [SelectionListener], which enables accessing the [SelectionDetails] of
    the selectable subtree it wraps.

## Dependencies

- StatefulWidget

## Members

- **magnifierConfiguration**: `TextMagnifierConfiguration?`
  The configuration for the magnifier in the selection region.

 By default, builds a [CupertinoTextMagnifier] on iOS and [TextMagnifier]
 on Android, and builds nothing on all other platforms. To suppress the
 magnifier, consider passing [TextMagnifierConfiguration.disabled].

 

- **focusNode**: `FocusNode?`
  

- **selectionControls**: `TextSelectionControls?`
  The delegate to build the selection handles and toolbar.

 If it is null, the platform specific selection control is used.

- **contextMenuBuilder**: `SelectableRegionContextMenuBuilder?`
  

 If not provided, will build a default menu based on the ambient
 [ThemeData.platform].

 
 This example shows how to build a custom context menu for any selected
 content in a SelectionArea.

 ** See code in examples/api/lib/material/context_menu/selectable_region_toolbar_builder.0.dart **
 

 See also:

  * [AdaptiveTextSelectionToolbar], which is built by default.

- **onSelectionChanged**: `ValueChanged<SelectedContent?>?`
  Called when the selected content changes.

- **child**: `Widget`
  The child widget this selection area applies to.

 

## Constructors

### Unnamed Constructor
Creates a [SelectionArea].

 If [selectionControls] is null, a platform specific one is used.

