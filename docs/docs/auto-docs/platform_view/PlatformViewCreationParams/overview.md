# Overview for `PlatformViewCreationParams`

## Description

The parameters used to create a [PlatformViewController].

 See also:

  * [CreatePlatformViewCallback] which uses this object to create a [PlatformViewController].

## Members

- **id**: `int`
  The unique identifier for the new platform view.

 [PlatformViewController.viewId] should match this id.

- **viewType**: `String`
  The unique identifier for the type of platform view to be embedded.

 This viewType is used to tell the platform which type of view to
 associate with the [id].

- **onPlatformViewCreated**: `PlatformViewCreatedCallback`
  Callback invoked after the platform view has been created.

- **onFocusChanged**: `ValueChanged&lt;bool&gt;`
  Callback invoked when the platform view's focus is changed on the platform side.

 The value is true when the platform view gains focus and false when it loses focus.

## Constructors

### _


#### Parameters

- ``: `dynamic`
- ``: `dynamic`
- ``: `dynamic`
- ``: `dynamic`
