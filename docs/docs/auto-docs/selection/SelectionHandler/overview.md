# Overview for `SelectionHandler`

## Description

The abstract interface to handle [SelectionEvent]s.

 This interface is extended by [Selectable] and [SelectionContainerDelegate]
 and is typically not used directly.

 
 This class returns a [SelectionGeometry] as its [value], and is responsible
 to notify its listener when its selection geometry has changed as the result
 of receiving selection events.
 

## Dependencies

- ValueListenable

