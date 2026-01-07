# Overview for `SelectionDetails`

## Description

A read-only interface for accessing the details of a selection under a [SelectionListener].

 This includes information such as the status of the selection indicating
 if it is collapsed or uncollapsed, the [SelectedContentRange] that includes
 the start and end offsets of the selection local to the [SelectionListener]
 that reports this object.

 This object is typically accessed by providing a [SelectionListenerNotifier]
 to a [SelectionListener] and retrieving the value from [SelectionListenerNotifier.selection].

