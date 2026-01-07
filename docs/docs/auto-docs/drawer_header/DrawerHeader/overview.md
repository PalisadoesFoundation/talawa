# Overview for `DrawerHeader`

## Description

The top-most region of a Material Design drawer. The header's [child]
 widget, if any, is placed inside a [Container] whose [decoration] can be
 passed as an argument, inset by the given [padding].

 Part of the Material Design [Drawer].

 Requires one of its ancestors to be a [Material] widget. This condition is
 satisfied by putting the [DrawerHeader] in a [Drawer].

 See also:

  * [UserAccountsDrawerHeader], a variant of [DrawerHeader] that is
    specialized for showing user accounts.
  * <https://material.io/design/components/navigation-drawer.html>

## Dependencies

- StatelessWidget

## Members

- **decoration**: `Decoration?`
  Decoration for the main drawer header [Container]; useful for applying
 backgrounds.

 This decoration will extend under the system status bar.

 If this is changed, it will be animated according to [duration] and [curve].

- **padding**: `EdgeInsetsGeometry`
  The padding by which to inset [child].

 The [DrawerHeader] additionally offsets the child by the height of the
 system status bar.

 If the child is null, the padding has no effect.

- **margin**: `EdgeInsetsGeometry?`
  The margin around the drawer header.

- **duration**: `Duration`
  The duration for animations of the [decoration].

- **curve**: `Curve`
  The curve for animations of the [decoration].

- **child**: `Widget?`
  A widget to be placed inside the drawer header, inset by the [padding].

 This widget will be sized to the size of the header. To position the child
 precisely, consider using an [Align] or [Center] widget.

 

## Constructors

### Unnamed Constructor
Creates a Material Design drawer header.

 Requires one of its ancestors to be a [Material] widget.

