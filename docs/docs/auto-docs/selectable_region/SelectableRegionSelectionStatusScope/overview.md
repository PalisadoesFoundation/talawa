# Overview for `SelectableRegionSelectionStatusScope`

## Description

Notifies its listeners when the selection under a [SelectableRegion] or
 [SelectionArea] is being changed or finalized.

 Use [SelectableRegionSelectionStatusScope.maybeOf], to access the [ValueListenable] of type
 [SelectableRegionSelectionStatus] under a [SelectableRegion]. Its listeners
 will be called even when the value of the [SelectableRegionSelectionStatus]
 does not change.

## Dependencies

- InheritedWidget

## Members

- **selectionStatusNotifier**: `ValueListenable&lt;SelectableRegionSelectionStatus&gt;`
  Tracks updates to the [SelectableRegionSelectionStatus] of the owning
 [SelectableRegion].

 Listeners will be called even when the value of the [SelectableRegionSelectionStatus]
 does not change. The selection under the [SelectableRegion] still may have changed.

## Constructors

### _


#### Parameters

- ``: `dynamic`
- ``: `dynamic`
