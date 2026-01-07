# Overview for `CircleAvatar`

## Description

A circle that represents a user.

 Typically used with a user's profile image, or, in the absence of
 such an image, the user's initials. A given user's initials should
 always be paired with the same background color, for consistency.

 If [foregroundImage] fails then [backgroundImage] is used. If
 [backgroundImage] fails too, [backgroundColor] is used.

 The [onBackgroundImageError] parameter must be null if the [backgroundImage]
 is null.
 The [onForegroundImageError] parameter must be null if the [foregroundImage]
 is null.

 

 If the avatar is to have an image, the image should be specified in the
 [backgroundImage] property:

 ```dart
 CircleAvatar(
   backgroundImage: NetworkImage(userAvatarUrl),
 )
 ```
 

 The image will be cropped to have a circle shape.

 

 If the avatar is to just have the user's initials, they are typically
 provided using a [Text] widget as the [child] and a [backgroundColor]:

 ```dart
 CircleAvatar(
   backgroundColor: Colors.brown.shade800,
   child: const Text('AH'),
 )
 ```
 

 See also:

  * [Chip], for representing users or concepts in long form.
  * [ListTile], which can combine an icon (such as a [CircleAvatar]) with
    some text for a fixed height list entry.
  * <https://material.io/design/components/chips.html#input-chips>

## Dependencies

- StatelessWidget

## Members

- **child**: `Widget?`
  The widget below this widget in the tree.

 Typically a [Text] widget. If the [CircleAvatar] is to have an image, use
 [backgroundImage] instead.

- **backgroundColor**: `Color?`
  The color with which to fill the circle. Changing the background
 color will cause the avatar to animate to the new color.

 If a [backgroundColor] is not specified and [ThemeData.useMaterial3] is true,
 [ColorScheme.primaryContainer] will be used, otherwise the theme's
 [ThemeData.primaryColorLight] is used with dark foreground colors, and
 [ThemeData.primaryColorDark] with light foreground colors.

- **foregroundColor**: `Color?`
  The default text color for text in the circle.

 Defaults to the primary text theme color if no [backgroundColor] is
 specified.

 If a [foregroundColor] is not specified and [ThemeData.useMaterial3] is true,
 [ColorScheme.onPrimaryContainer] will be used, otherwise the theme's
 [ThemeData.primaryColorLight] for dark background colors, and
 [ThemeData.primaryColorDark] for light background colors.

- **backgroundImage**: `ImageProvider?`
  The background image of the circle. Changing the background
 image will cause the avatar to animate to the new image.

 Typically used as a fallback image for [foregroundImage].

 If the [CircleAvatar] is to have the user's initials, use [child] instead.

- **foregroundImage**: `ImageProvider?`
  The foreground image of the circle.

 Typically used as profile image. For fallback use [backgroundImage].

- **onBackgroundImageError**: `ImageErrorListener?`
  An optional error callback for errors emitted when loading
 [backgroundImage].

- **onForegroundImageError**: `ImageErrorListener?`
  An optional error callback for errors emitted when loading
 [foregroundImage].

- **radius**: `double?`
  The size of the avatar, expressed as the radius (half the diameter).

 If [radius] is specified, then neither [minRadius] nor [maxRadius] may be
 specified. Specifying [radius] is equivalent to specifying a [minRadius]
 and [maxRadius], both with the value of [radius].

 If neither [minRadius] nor [maxRadius] are specified, defaults to 20
 logical pixels. This is the appropriate size for use with
 [ListTile.leading].

 Changes to the [radius] are animated (including changing from an explicit
 [radius] to a [minRadius]/[maxRadius] pair or vice versa).

- **minRadius**: `double?`
  The minimum size of the avatar, expressed as the radius (half the
 diameter).

 If [minRadius] is specified, then [radius] must not also be specified.

 Defaults to zero.

 Constraint changes are animated, but size changes due to the environment
 itself changing are not. For example, changing the [minRadius] from 10 to
 20 when the [CircleAvatar] is in an unconstrained environment will cause
 the avatar to animate from a 20 pixel diameter to a 40 pixel diameter.
 However, if the [minRadius] is 40 and the [CircleAvatar] has a parent
 [SizedBox] whose size changes instantaneously from 20 pixels to 40 pixels,
 the size will snap to 40 pixels instantly.

- **maxRadius**: `double?`
  The maximum size of the avatar, expressed as the radius (half the
 diameter).

 If [maxRadius] is specified, then [radius] must not also be specified.

 Defaults to [double.infinity].

 Constraint changes are animated, but size changes due to the environment
 itself changing are not. For example, changing the [maxRadius] from 10 to
 20 when the [CircleAvatar] is in an unconstrained environment will cause
 the avatar to animate from a 20 pixel diameter to a 40 pixel diameter.
 However, if the [maxRadius] is 40 and the [CircleAvatar] has a parent
 [SizedBox] whose size changes instantaneously from 20 pixels to 40 pixels,
 the size will snap to 40 pixels instantly.

- **_defaultRadius**: `double`
- **_defaultMinRadius**: `double`
- **_defaultMaxRadius**: `double`
## Constructors

### Unnamed Constructor
Creates a circle that represents a user.

