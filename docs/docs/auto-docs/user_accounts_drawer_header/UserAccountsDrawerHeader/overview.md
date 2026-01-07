# Overview for `UserAccountsDrawerHeader`

## Description

A Material Design [Drawer] header that identifies the app's user.

 Requires one of its ancestors to be a [Material] widget.

 See also:

  * [DrawerHeader], for a drawer header that doesn't show user accounts.
  * <https://material.io/design/components/navigation-drawer.html#anatomy>

## Dependencies

- StatefulWidget

## Members

- **decoration**: `Decoration?`
  The header's background. If decoration is null then a [BoxDecoration]
 with its background color set to the current theme's primaryColor is used.

- **margin**: `EdgeInsetsGeometry?`
  The margin around the drawer header.

- **currentAccountPicture**: `Widget?`
  A widget placed in the upper-left corner that represents the current
 user's account. Normally a [CircleAvatar].

- **otherAccountsPictures**: `List&lt;Widget&gt;?`
  A list of widgets that represent the current user's other accounts.
 Up to three of these widgets will be arranged in a row in the header's
 upper-right corner. Normally a list of [CircleAvatar] widgets.

- **currentAccountPictureSize**: `Size`
  The size of the [currentAccountPicture].

- **otherAccountsPicturesSize**: `Size`
  The size of each widget in [otherAccountsPicturesSize].

- **accountName**: `Widget?`
  A widget that represents the user's current account name. It is
 displayed on the left, below the [currentAccountPicture].

- **accountEmail**: `Widget?`
  A widget that represents the email address of the user's current account.
 It is displayed on the left, below the [accountName].

- **onDetailsPressed**: `VoidCallback?`
  A callback that is called when the horizontal area which contains the
 [accountName] and [accountEmail] is tapped.

- **arrowColor**: `Color`
  The [Color] of the arrow icon.

## Constructors

### Unnamed Constructor
Creates a Material Design drawer header.

 Requires one of its ancestors to be a [Material] widget.

