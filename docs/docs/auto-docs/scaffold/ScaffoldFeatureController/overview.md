# Overview for `ScaffoldFeatureController`

## Description

An interface for controlling a feature of a [Scaffold].

 Commonly obtained from [ScaffoldMessengerState.showSnackBar] or
 [ScaffoldState.showBottomSheet].

## Members

- **_widget**: `T`
- **_completer**: `Completer&lt;U&gt;`
- **close**: `VoidCallback`
  Remove the feature (e.g., bottom sheet, snack bar, or material banner) from the scaffold.

- **setState**: `StateSetter?`
  Mark the feature (e.g., bottom sheet or snack bar) as needing to rebuild.

## Constructors

### _


#### Parameters

- `_widget`: `dynamic`
- `_completer`: `dynamic`
- `close`: `dynamic`
- `setState`: `dynamic`
