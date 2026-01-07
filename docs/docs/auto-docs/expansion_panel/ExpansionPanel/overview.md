# Overview for `ExpansionPanel`

## Description

A material expansion panel. It has a header and a body and can be either
 expanded or collapsed. The body of the panel is only visible when it is
 expanded.

 

 Expansion panels are only intended to be used as children for
 [ExpansionPanelList].

 See [ExpansionPanelList] for a sample implementation.

 See also:

  * [ExpansionPanelList]
  * <https://material.io/design/components/lists.html#types>

## Members

- **headerBuilder**: `ExpansionPanelHeaderBuilder`
  The widget builder that builds the expansion panels' header.

- **body**: `Widget`
  The body of the expansion panel that's displayed below the header.

 This widget is visible only when the panel is expanded.

- **isExpanded**: `bool`
  Whether the panel is expanded.

 Defaults to false.

- **splashColor**: `Color?`
  Defines the splash color of the panel if [canTapOnHeader] is true,
 or the splash color of the expand/collapse IconButton if [canTapOnHeader]
 is false.

 If [canTapOnHeader] is false, and [ThemeData.useMaterial3] is
 true, this field will be ignored, as [IconButton.splashColor]
 will be ignored, and you should use [highlightColor] instead.

 If this is null, then the icon button will use its default splash color
 [ThemeData.splashColor], and the panel will use its default splash color
 [ThemeData.splashColor] (if [canTapOnHeader] is true).

- **highlightColor**: `Color?`
  Defines the highlight color of the panel if [canTapOnHeader] is true, or
 the highlight color of the expand/collapse IconButton if [canTapOnHeader]
 is false.

 If this is null, then the icon button will use its default highlight color
 [ThemeData.highlightColor], and the panel will use its default highlight
 color [ThemeData.highlightColor] (if [canTapOnHeader] is true).

- **canTapOnHeader**: `bool`
  Whether tapping on the panel's header will expand/collapse it.

 Defaults to false.

- **backgroundColor**: `Color?`
  Defines the background color of the panel.

 Defaults to [ThemeData.cardColor].

## Constructors

### Unnamed Constructor
Creates an expansion panel to be used as a child for [ExpansionPanelList].
 See [ExpansionPanelList] for an example on how to use this widget.

