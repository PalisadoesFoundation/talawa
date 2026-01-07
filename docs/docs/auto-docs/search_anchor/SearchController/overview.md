# Overview for `SearchController`

## Description

A controller to manage a search view created by [SearchAnchor].

 A [SearchController] is used to control a menu after it has been created,
 with methods such as [openView] and [closeView]. It can also control the text in the
 input field.

 To observe open/close state changes of search view, provide
 [SearchAnchor.viewOnOpen] and/or [SearchAnchor.viewOnClose] callbacks.

 See also:

 * [SearchAnchor], a widget that defines a region that opens a search view.
 * [TextEditingController], A controller for an editable text field.

## Dependencies

- TextEditingController

## Members

- **_anchor**: `_SearchAnchorState?`
