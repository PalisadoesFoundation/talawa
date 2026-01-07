# Overview for `SelectionListener`

## Description

A [SelectionContainer] that allows the user to access the [SelectionDetails] and
 listen to selection changes for the child subtree it wraps under a [SelectionArea]
 or [SelectableRegion].

 The selection updates are provided through the [selectionNotifier], to listen
 to these updates attach a listener through [SelectionListenerNotifier.addListener].

 This widget does not listen to selection changes of nested [SelectionArea]s
 or [SelectableRegion]s in its subtree because those widgets are self-contained
 and do not bubble up their selection. To listen to selection changes of a
 [SelectionArea] or [SelectableRegion] under this [SelectionListener], add
 an additional [SelectionListener] under each one.

 
 This example shows how to use [SelectionListener] to access the [SelectionDetails]
 under a [SelectionArea] or [SelectableRegion].

 ** See code in examples/api/lib/material/selection_area/selection_area.1.dart **
 

 
 This example shows how to color the active selection red under a
 [SelectionArea] or [SelectableRegion].

 ** See code in examples/api/lib/material/selection_area/selection_area.2.dart **
 

 See also:

   * [SelectableRegion], which provides an overview of the selection system.

## Dependencies

- StatefulWidget

## Members

- **selectionNotifier**: `SelectionListenerNotifier`
  Notifies listeners when the selection has changed.

- **child**: `Widget`
  The child widget this selection listener applies to.

 

## Constructors

### Unnamed Constructor
Create a new [SelectionListener] widget.

