# Overview for `OverlayPortalController`

## Description

A class to show, hide and bring to top an [OverlayPortal]'s overlay child
 in the target [Overlay].

 A [OverlayPortalController] can only be given to at most one [OverlayPortal]
 at a time. When an [OverlayPortalController] is moved from one
 [OverlayPortal] to another, its [isShowing] state does not carry over.

 [OverlayPortalController.show] and [OverlayPortalController.hide] can be
 called even before the controller is assigned to any [OverlayPortal], but
 they typically should not be called while the widget tree is being rebuilt.

## Members

- **_attachTarget**: `_OverlayPortalState?`
- **_zOrderIndex**: `int?`
- **_debugLabel**: `String?`
- **_wallTime**: `int`
## Constructors

### Unnamed Constructor
Creates an [OverlayPortalController], optionally with a String identifier
 `debugLabel`.

