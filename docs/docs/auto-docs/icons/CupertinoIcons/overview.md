# Overview for `CupertinoIcons`

## Description

Identifiers for the supported Cupertino icons.

 Use with the [Icon] class to show specific icons.

 Icons are identified by their name as listed below.

 To use this class, make sure you add a dependency on `cupertino_icons` in your
 project's `pubspec.yaml` file. This ensures that the CupertinoIcons font is
 included in your application. This font is used to display the icons. For example:

 ```yaml
 name: my_awesome_application

 dependencies:
   cupertino_icons: ^1.0.0
 ```

 

 This example shows how to create a [Row] of Cupertino [Icon]s in different colors and
 sizes. The first [Icon] uses a [Icon.semanticLabel] to announce in accessibility
 modes like VoiceOver.

 ![The following code snippet would generate a row of icons consisting of a pink heart, a green bell, and a blue umbrella, each progressively bigger than the last.](https://flutter.github.io/assets-for-api-docs/assets/cupertino/cupertino_icon.png)

 ```dart
 const Row(
   mainAxisAlignment: MainAxisAlignment.spaceAround,
   children: <Widget>[
     Icon(
       CupertinoIcons.heart_fill,
       color: Colors.pink,
       size: 24.0,
       semanticLabel: 'Text to announce in accessibility modes',
     ),
     Icon(
       CupertinoIcons.bell_fill,
       color: Colors.green,
       size: 30.0,
     ),
     Icon(
       CupertinoIcons.umbrella_fill,
       color: Colors.blue,
       size: 36.0,
     ),
   ],
 )
 ```
 

 For versions 0.1.3 and below, see this [glyph map](https://raw.githubusercontent.com/flutter/packages/main/third_party/packages/cupertino_icons/map.png).

 See also:

  * [Icon], used to show these icons.

## Members

- **iconFont**: `String`
  The icon font used for Cupertino icons.

- **iconFontPackage**: `String`
  The dependent package providing the Cupertino icons font.

- **left_chevron**: `IconData`
  <i class='cupertino-icons md-36'>chevron_left</i> &#x2014; Cupertino icon for a thin left chevron.
 This is the same icon as [chevron_left] in cupertino_icons 1.0.0+.

- **right_chevron**: `IconData`
  <i class='cupertino-icons md-36'>chevron_right</i> &#x2014; Cupertino icon for a thin right chevron.
 This is the same icon as [chevron_right] in cupertino_icons 1.0.0+.

- **share**: `IconData`
  <i class='cupertino-icons md-36'>square_arrow_up</i> &#x2014; Cupertino icon for an iOS style share icon with an arrow pointing up from a box. This icon is not filled in.
 This is the same icon as [square_arrow_up] and [share_up] in cupertino_icons 1.0.0+.

 See also:

  * [share_solid], which is similar, but filled in.
  * [share_up], for another (pre-iOS 7) version of this icon.

- **share_solid**: `IconData`
  <i class='cupertino-icons md-36'>square_arrow_up_fill</i> &#x2014; Cupertino icon for an iOS style share icon with an arrow pointing up from a box. This icon is filled in.
 This is the same icon as [square_arrow_up_fill] in cupertino_icons 1.0.0+.

 See also:

  * [share], which is similar, but not filled in.
  * [share_up], for another (pre-iOS 7) version of this icon.

- **book**: `IconData`
  <i class='cupertino-icons md-36'>book</i> &#x2014; Cupertino icon for a book silhouette spread open. This icon is not filled in.
 See also:

  * [book_solid], which is similar, but filled in.

- **book_solid**: `IconData`
  <i class='cupertino-icons md-36'>book_fill</i> &#x2014; Cupertino icon for a book silhouette spread open. This icon is filled in.
 This is the same icon as [book_fill] in cupertino_icons 1.0.0+.

 See also:

  * [book], which is similar, but not filled in.

- **bookmark**: `IconData`
  <i class='cupertino-icons md-36'>bookmark</i> &#x2014; Cupertino icon for a book silhouette spread open containing a bookmark in the upper right. This icon is not filled in.

 See also:

  * [bookmark_solid], which is similar, but filled in.

- **bookmark_solid**: `IconData`
  <i class='cupertino-icons md-36'>bookmark_fill</i> &#x2014; Cupertino icon for a book silhouette spread open containing a bookmark in the upper right. This icon is filled in.
 This is the same icon as [bookmark_fill] in cupertino_icons 1.0.0+.

 See also:

  * [bookmark], which is similar, but not filled in.

- **info**: `IconData`
  <i class='cupertino-icons md-36'>info_circle</i> &#x2014; Cupertino icon for a letter 'i' in a circle.
 This is the same icon as [info_circle] in cupertino_icons 1.0.0+.

- **reply**: `IconData`
  <i class='cupertino-icons md-36'>arrowshape_turn_up_left</i> &#x2014; Cupertino icon for a curved up and left pointing arrow.
 This is the same icon as [arrowshape_turn_up_left] in cupertino_icons 1.0.0+.

 For another version of this icon, see [reply_thick_solid].

- **conversation_bubble**: `IconData`
  <i class='cupertino-icons md-36'>chat_bubble</i> &#x2014; Cupertino icon for a chat bubble.
 This is the same icon as [chat_bubble] in cupertino_icons 1.0.0+.

- **profile_circled**: `IconData`
  <i class='cupertino-icons md-36'>person_crop_circle</i> &#x2014; Cupertino icon for a person's silhouette in a circle.
 This is the same icon as [person_crop_circle] in cupertino_icons 1.0.0+.

- **plus_circled**: `IconData`
  <i class='cupertino-icons md-36'>plus_circle</i> &#x2014; Cupertino icon for a '+' sign in a circle.
 This is the same icon as [plus_circle] in cupertino_icons 1.0.0+.

- **minus_circled**: `IconData`
  <i class='cupertino-icons md-36'>minus_circle</i> &#x2014; Cupertino icon for a '-' sign in a circle.
 This is the same icon as [minus_circle] in cupertino_icons 1.0.0+.

- **flag**: `IconData`
  <i class='cupertino-icons md-36'>flag</i> &#x2014; Cupertino icon for a right facing flag and pole outline.

- **search**: `IconData`
  <i class='cupertino-icons md-36'>search</i> &#x2014; Cupertino icon for a magnifier loop outline.

- **check_mark**: `IconData`
  <i class='cupertino-icons md-36'>checkmark</i> &#x2014; Cupertino icon for a checkmark.
 This is the same icon as [checkmark] in cupertino_icons 1.0.0+.

 See also:

  * [check_mark_circled], which consists of this check mark and a circle surrounding it.

- **check_mark_circled**: `IconData`
  <i class='cupertino-icons md-36'>checkmark_circle</i> &#x2014; Cupertino icon for a checkmark in a circle. The circle is not filled in.
 This is the same icon as [checkmark_circle] in cupertino_icons 1.0.0+.

 See also:

  * [check_mark_circled_solid], which is similar, but filled in.
  * [check_mark], which is the check mark without a circle.

- **check_mark_circled_solid**: `IconData`
  <i class='cupertino-icons md-36'>checkmark_circle_fill</i> &#x2014; Cupertino icon for a checkmark in a circle. The circle is filled in.
 This is the same icon as [checkmark_circle_fill] in cupertino_icons 1.0.0+.

 See also:

  * [check_mark_circled], which is similar, but not filled in.

- **circle**: `IconData`
  <i class='cupertino-icons md-36'>circle</i> &#x2014; Cupertino icon for an empty circle (a ring). An un-selected radio button.

 See also:

  * [circle_filled], which is similar but filled in.

- **circle_filled**: `IconData`
  <i class='cupertino-icons md-36'>circle_fill</i> &#x2014; Cupertino icon for a filled circle. The circle is surrounded by a ring. A selected radio button.
 This is the same icon as [circle_fill] in cupertino_icons 1.0.0+.

 See also:

  * [circle], which is similar but not filled in.

- **back**: `IconData`
  <i class='cupertino-icons md-36'>chevron_back</i> &#x2014; Cupertino icon for a thicker left chevron used in iOS for the navigation bar back button.
 This is the same icon as [chevron_back] in cupertino_icons 1.0.0+.

- **forward**: `IconData`
  <i class='cupertino-icons md-36'>chevron_forward</i> &#x2014; Cupertino icon for a thicker right chevron that's the reverse of [back].
 This is the same icon as [chevron_forward] in cupertino_icons 1.0.0+.

- **home**: `IconData`
  <i class='cupertino-icons md-36'>house</i> &#x2014; Cupertino icon for an outline of a simple front-facing house.
 This is the same icon as [house] in cupertino_icons 1.0.0+.

- **shopping_cart**: `IconData`
  <i class='cupertino-icons md-36'>cart</i> &#x2014; Cupertino icon for a right-facing shopping cart outline.
 This is the same icon as [cart] in cupertino_icons 1.0.0+.

- **ellipsis**: `IconData`
  <i class='cupertino-icons md-36'>ellipsis</i> &#x2014; Cupertino icon for three solid dots.

- **phone**: `IconData`
  <i class='cupertino-icons md-36'>phone</i> &#x2014; Cupertino icon for a phone handset outline.

- **phone_solid**: `IconData`
  <i class='cupertino-icons md-36'>phone_fill</i> &#x2014; Cupertino icon for a phone handset.
 This is the same icon as [phone_fill] in cupertino_icons 1.0.0+.

- **down_arrow**: `IconData`
  <i class='cupertino-icons md-36'>arrow_down</i> &#x2014; Cupertino icon for a solid down arrow.
 This is the same icon as [arrow_down] in cupertino_icons 1.0.0+.

- **up_arrow**: `IconData`
  <i class='cupertino-icons md-36'>arrow_up</i> &#x2014; Cupertino icon for a solid up arrow.
 This is the same icon as [arrow_up] in cupertino_icons 1.0.0+.

- **battery_charging**: `IconData`
  <i class='cupertino-icons md-36'>battery_100</i> &#x2014; Cupertino icon for a charging battery.
 This is the same icon as [battery_100], [battery_full] and [battery_75_percent] in cupertino_icons 1.0.0+.

- **battery_empty**: `IconData`
  <i class='cupertino-icons md-36'>battery_0</i> &#x2014; Cupertino icon for an empty battery.
 This is the same icon as [battery_0] in cupertino_icons 1.0.0+.

- **battery_full**: `IconData`
  <i class='cupertino-icons md-36'>battery_100</i> &#x2014; Cupertino icon for a full battery.
 This is the same icon as [battery_100], [battery_charging] and [battery_75_percent] in cupertino_icons 1.0.0+.

- **battery_75_percent**: `IconData`
  <i class='cupertino-icons md-36'>battery_100</i> &#x2014; Cupertino icon for a 75% charged battery.
 This is the same icon as [battery_100], [battery_charging] and [battery_full] in cupertino_icons 1.0.0+.

- **battery_25_percent**: `IconData`
  <i class='cupertino-icons md-36'>battery_25</i> &#x2014; Cupertino icon for a 25% charged battery.
 This is the same icon as [battery_25] in cupertino_icons 1.0.0+.

- **bluetooth**: `IconData`
  <i class='cupertino-icons md-36'>bluetooth</i> &#x2014; Cupertino icon for the Bluetooth logo.
 This icon is available in cupertino_icons 1.0.0+ for backward
 compatibility but not part of Apple icons' aesthetics.

- **restart**: `IconData`
  <i class='cupertino-icons md-36'>arrow_counterclockwise</i> &#x2014; Cupertino icon for a restart arrow, pointing downwards.
 This is the same icon as [arrow_counterclockwise] in cupertino_icons 1.0.0+.

- **reply_all**: `IconData`
  <i class='cupertino-icons md-36'>arrowshape_turn_up_left_2</i> &#x2014; Cupertino icon for two curved up and left pointing arrows.
 This is the same icon as [arrowshape_turn_up_left_2] in cupertino_icons 1.0.0+.

- **reply_thick_solid**: `IconData`
  <i class='cupertino-icons md-36'>arrowshape_turn_up_left_2_fill</i> &#x2014; Cupertino icon for a curved up and left pointing arrow.
 This is the same icon as [arrowshape_turn_up_left_2_fill] in cupertino_icons 1.0.0+.

 For another version of this icon, see [reply].

- **share_up**: `IconData`
  <i class='cupertino-icons md-36'>square_arrow_up</i> &#x2014; Cupertino icon for an iOS style share icon with an arrow pointing upwards to the right from a box.
 This is the same icon as [square_arrow_up] and [share_up] in cupertino_icons 1.0.0+.

 For another version of this icon (introduced in iOS 7), see [share].

- **shuffle**: `IconData`
  <i class='cupertino-icons md-36'>shuffle_medium</i> &#x2014; Cupertino icon for two thin right-facing intertwined arrows.
 This is the same icon as [shuffle_medium] and [shuffle_thick] in cupertino_icons 1.0.0+.

 See also:

  * [shuffle_medium], with slightly thicker arrows.
  * [shuffle_thick], with thicker, bold arrows.

- **shuffle_medium**: `IconData`
  <i class='cupertino-icons md-36'>shuffle</i> &#x2014; Cupertino icon for an two medium thickness right-facing intertwined arrows.
 This is the same icon as [shuffle] and [shuffle_thick] in cupertino_icons 1.0.0+.

 See also:

  * [shuffle], with thin arrows.
  * [shuffle_thick], with thicker, bold arrows.

- **shuffle_thick**: `IconData`
  <i class='cupertino-icons md-36'>shuffle_medium</i> &#x2014; Cupertino icon for two thick right-facing intertwined arrows.
 This is the same icon as [shuffle_medium] and [shuffle] in cupertino_icons 1.0.0+.

 See also:

  * [shuffle], with thin arrows.
  * [shuffle_medium], with slightly thinner arrows.

- **photo_camera**: `IconData`
  <i class='cupertino-icons md-36'>camera</i> &#x2014; Cupertino icon for a camera for still photographs. This icon is filled in.
 This is the same icon as [camera] in cupertino_icons 1.0.0+.

 See also:

  * [photo_camera], which is similar, but not filled in.
  * [video_camera_solid], for the moving picture equivalent.

- **photo_camera_solid**: `IconData`
  <i class='cupertino-icons md-36'>camera_fill</i> &#x2014; Cupertino icon for a camera for still photographs. This icon is not filled in.
 This is the same icon as [camera_fill] in cupertino_icons 1.0.0+.

 See also:

  * [photo_camera_solid], which is similar, but filled in.
  * [video_camera], for the moving picture equivalent.

- **video_camera**: `IconData`
  <i class='cupertino-icons md-36'>videocam</i> &#x2014; Cupertino icon for a camera for moving pictures. This icon is not filled in.
 This is the same icon as [videocam] in cupertino_icons 1.0.0+.

 See also:

  * [video_camera_solid], which is similar, but filled in.
  * [photo_camera], for the still photograph equivalent.

- **video_camera_solid**: `IconData`
  <i class='cupertino-icons md-36'>videocam_fill</i> &#x2014; Cupertino icon for a camera for moving pictures. This icon is filled in.
 This is the same icon as [videocam_fill] in cupertino_icons 1.0.0+.

 See also:

  * [video_camera], which is similar, but not filled in.
  * [photo_camera_solid], for the still photograph equivalent.

- **switch_camera**: `IconData`
  <i class='cupertino-icons md-36'>camera_rotate</i> &#x2014; Cupertino icon for a camera containing two circular arrows pointing at each other, which indicate switching. This icon is not filled in.
 This is the same icon as [camera_rotate] in cupertino_icons 1.0.0+.

 See also:

  * [switch_camera_solid], which is similar, but filled in.

- **switch_camera_solid**: `IconData`
  <i class='cupertino-icons md-36'>camera_rotate_fill</i> &#x2014; Cupertino icon for a camera containing two circular arrows pointing at each other, which indicate switching. This icon is filled in.
 This is the same icon as [camera_rotate_fill] in cupertino_icons 1.0.0+.

 See also:

  * [switch_camera], which is similar, but not filled in.

- **collections**: `IconData`
  <i class='cupertino-icons md-36'>rectangle_stack</i> &#x2014; Cupertino icon for a collection of folders, which store collections of files, i.e. an album. This icon is not filled in.
 This is the same icon as [rectangle_stack] in cupertino_icons 1.0.0+.

 See also:

  * [collections_solid], which is similar, but filled in.

- **collections_solid**: `IconData`
  <i class='cupertino-icons md-36'>rectangle_stack_fill</i> &#x2014; Cupertino icon for a collection of folders, which store collections of files, i.e. an album. This icon is filled in.
 This is the same icon as [rectangle_stack_fill] in cupertino_icons 1.0.0+.

 See also:

  * [collections], which is similar, but not filled in.

- **folder**: `IconData`
  <i class='cupertino-icons md-36'>folder_open</i> &#x2014; Cupertino icon for a single folder, which stores multiple files. This icon is not filled in.
 This is the same icon as [folder_open] in cupertino_icons 1.0.0+.

 See also:

  * [folder_solid], which is similar, but filled in.
  * [folder_open], which is the pre-iOS 7 version of this icon.

- **folder_solid**: `IconData`
  <i class='cupertino-icons md-36'>folder_fill</i> &#x2014; Cupertino icon for a single folder, which stores multiple files. This icon is filled in.
 This is the same icon as [folder_fill] in cupertino_icons 1.0.0+.

 See also:

  * [folder], which is similar, but not filled in.
  * [folder_open], which is the pre-iOS 7 version of this icon and not filled in.

- **folder_open**: `IconData`
  <i class='cupertino-icons md-36'>folder</i> &#x2014; Cupertino icon for a single folder that indicates being opened. A folder like this typically stores multiple files.
 This is the same icon as [folder] in cupertino_icons 1.0.0+.

 See also:

  * [folder], which is the equivalent of this icon for iOS versions later than or equal to iOS 7.

- **delete**: `IconData`
  <i class='cupertino-icons md-36'>trash</i> &#x2014; Cupertino icon for a trash bin for removing items. This icon is not filled in.
 This is the same icon as [trash] and [delete_simple] in cupertino_icons 1.0.0+.

 See also:

  * [delete_solid], which is similar, but filled in.

- **delete_solid**: `IconData`
  <i class='cupertino-icons md-36'>trash_fill</i> &#x2014; Cupertino icon for a trash bin for removing items. This icon is filled in.
 This is the same icon as [trash_fill] in cupertino_icons 1.0.0+.

 See also:

  * [delete], which is similar, but not filled in.

- **delete_simple**: `IconData`
  <i class='cupertino-icons md-36'>trash</i> &#x2014; Cupertino icon for a trash bin with minimal detail for removing items.
 This is the same icon as [trash] and [delete] in cupertino_icons 1.0.0+.

 See also:

  * [delete], which is the iOS 7 equivalent of this icon with richer detail.

- **pen**: `IconData`
  <i class='cupertino-icons md-36'>pen</i> &#x2014; Cupertino icon for a simple pen.

 See also:

  * [pencil], which is similar, but has less detail and looks like a pencil.

- **pencil**: `IconData`
  <i class='cupertino-icons md-36'>pencil</i> &#x2014; Cupertino icon for a simple pencil.

 See also:

  * [pen], which is similar, but has more detail and looks like a pen.

- **create**: `IconData`
  <i class='cupertino-icons md-36'>square_pencil</i> &#x2014; Cupertino icon for a box for writing and a pen on top (that indicates the writing). This icon is not filled in.
 This is the same icon as [square_pencil] in cupertino_icons 1.0.0+.

 See also:

  * [create_solid], which is similar, but filled in.
  * [pencil], which is just a pencil.
  * [pen], which is just a pen.

- **create_solid**: `IconData`
  <i class='cupertino-icons md-36'>square_pencil_fill</i> &#x2014; Cupertino icon for a box for writing and a pen on top (that indicates the writing). This icon is filled in.
 This is the same icon as [square_pencil_fill] in cupertino_icons 1.0.0+.

 See also:

  * [create], which is similar, but not filled in.
  * [pencil], which is just a pencil.
  * [pen], which is just a pen.

- **refresh**: `IconData`
  <i class='cupertino-icons md-36'>arrow_clockwise</i> &#x2014; Cupertino icon for an arrow on a circular path with its end pointing at its start.
 This is the same icon as [arrow_clockwise], [refresh_thin] and [refresh_thick] in cupertino_icons 1.0.0+.

 See also:

  * [refresh_circled], which is this icon put in a circle.
  * [refresh_thin], which is an arrow of the same concept, but thinner and with a smaller gap in between its end and start.
  * [refresh_thick], which is similar, but rotated 45 degrees clockwise and thicker.
  * [refresh_bold], which is similar, but rotated 90 degrees clockwise and much thicker.

- **refresh_circled**: `IconData`
  <i class='cupertino-icons md-36'>arrow_clockwise_circle</i> &#x2014; Cupertino icon for an arrow on a circular path with its end pointing at its start surrounded by a circle. This is icon is not filled in.
 This is the same icon as [arrow_clockwise_circle] in cupertino_icons 1.0.0+.

 See also:

  * [refresh_circled_solid], which is similar, but filled in.
  * [refresh], which is the arrow of this icon without a circle.

- **refresh_circled_solid**: `IconData`
  <i class='cupertino-icons md-36'>arrow_clockwise_circle_fill</i> &#x2014; Cupertino icon for an arrow on a circular path with its end pointing at its start surrounded by a circle. This is icon is filled in.
 This is the same icon as [arrow_clockwise_circle_fill] in cupertino_icons 1.0.0+.

 See also:

  * [refresh_circled], which is similar, but not filled in.
  * [refresh], which is the arrow of this icon filled in without a circle.

- **refresh_thin**: `IconData`
  <i class='cupertino-icons md-36'>arrow_clockwise</i> &#x2014; Cupertino icon for an arrow on a circular path with its end pointing at its start.
 This is the same icon as [arrow_clockwise], [refresh] and [refresh_thick] in cupertino_icons 1.0.0+.

 See also:

  * [refresh], which is an arrow of the same concept, but thicker and with a larger gap in between its end and start.

- **refresh_thick**: `IconData`
  <i class='cupertino-icons md-36'>arrow_clockwise</i> &#x2014; Cupertino icon for an arrow on a circular path with its end pointing at its start.
 This is the same icon as [arrow_clockwise], [refresh_thin] and [refresh] in cupertino_icons 1.0.0+.

 See also:

  * [refresh], which is similar, but rotated 45 degrees anti-clockwise and thinner.
  * [refresh_bold], which is similar, but rotated 45 degrees clockwise and thicker.

- **refresh_bold**: `IconData`
  <i class='cupertino-icons md-36'>arrow_counterclockwise</i> &#x2014; Cupertino icon for an arrow on a circular path with its end pointing at its start.
 This is the same icon as [arrow_counterclockwise] in cupertino_icons 1.0.0+.

 See also:

  * [refresh_thick], which is similar, but rotated 45 degrees anti-clockwise and thinner.
  * [refresh], which is similar, but rotated 90 degrees anti-clockwise and much thinner.

- **clear_thick**: `IconData`
  <i class='cupertino-icons md-36'>xmark</i> &#x2014; Cupertino icon for a cross of two diagonal lines from edge to edge crossing in an angle of 90 degrees, which is used for dismissal.
 This is the same icon as [xmark] and [clear] in cupertino_icons 1.0.0+.

 See also:

  * [clear_circled], which uses this cross as a blank space in a filled out circled.
  * [clear], which uses a thinner cross and is the iOS 7 equivalent of this icon.

- **clear_thick_circled**: `IconData`
  <i class='cupertino-icons md-36'>xmark_circle_fill</i> &#x2014; Cupertino icon for a cross of two diagonal lines from edge to edge crossing in an angle of 90 degrees, which is used for dismissal, used as a blank space in a circle.
 This is the same icon as [xmark_circle_fill] and [clear_circled_solid] in cupertino_icons 1.0.0+.

 See also:

  * [clear], which is equivalent to the cross of this icon without a circle.
  * [clear_circled_solid], which is similar, but uses a thinner cross.

- **clear**: `IconData`
  <i class='cupertino-icons md-36'>xmark</i> &#x2014; Cupertino icon for a cross of two diagonal lines from edge to edge crossing in an angle of 90 degrees, which is used for dismissal.
 This is the same icon as [xmark] and [clear_thick] in cupertino_icons 1.0.0+.


 See also:

  * [clear_circled], which consists of this cross and a circle surrounding it.
  * [clear], which uses a thicker cross and is the pre-iOS 7 equivalent of this icon.

- **clear_circled**: `IconData`
  <i class='cupertino-icons md-36'>xmark_circle</i> &#x2014; Cupertino icon for a cross of two diagonal lines from edge to edge crossing in an angle of 90 degrees, which is used for dismissal, surrounded by circle. This icon is not filled in.
 This is the same icon as [xmark_circle] in cupertino_icons 1.0.0+.

 See also:

  * [clear_circled_solid], which is similar, but filled in.
  * [clear], which is the standalone cross of this icon.

- **clear_circled_solid**: `IconData`
  <i class='cupertino-icons md-36'>xmark_circle_fill</i> &#x2014; Cupertino icon for a cross of two diagonal lines from edge to edge crossing in an angle of 90 degrees, which is used for dismissal, used as a blank space in a circle. This icon is filled in.
 This is the same icon as [xmark_circle_fill] and [clear_thick_circled] in cupertino_icons 1.0.0+.

 See also:

  * [clear_circled], which is similar, but not filled in.

- **add**: `IconData`
  <i class='cupertino-icons md-36'>plus</i> &#x2014; Cupertino icon for an two straight lines, one horizontal and one vertical, meeting in the middle, which is the equivalent of a plus sign.
 This is the same icon as [plus] in cupertino_icons 1.0.0+.

 See also:

  * [plus_circled], which is the pre-iOS 7 version of this icon with a thicker cross.
  * [add_circled], which consists of the plus and a circle around it.

- **add_circled**: `IconData`
  <i class='cupertino-icons md-36'>plus_circle</i> &#x2014; Cupertino icon for an two straight lines, one horizontal and one vertical, meeting in the middle, which is the equivalent of a plus sign, surrounded by a circle. This icon is not filled in.
 This is the same icon as [plus_circle] in cupertino_icons 1.0.0+.

 See also:

  * [plus_circled], which is the pre-iOS 7 version of this icon with a thicker cross and a filled in circle.
  * [add_circled_solid], which is similar, but filled in.

- **add_circled_solid**: `IconData`
  <i class='cupertino-icons md-36'>plus_circle_fill</i> &#x2014; Cupertino icon for an two straight lines, one horizontal and one vertical, meeting in the middle, which is the equivalent of a plus sign, surrounded by a circle. This icon is not filled in.
 This is the same icon as [plus_circle_fill] in cupertino_icons 1.0.0+.

 See also:

  * [plus_circled], which is the pre-iOS 7 version of this icon with a thicker cross.
  * [add_circled], which is similar, but not filled in.

- **gear**: `IconData`
  <i class='cupertino-icons md-36'>gear_alt</i> &#x2014; Cupertino icon for a gear with eight cogs. This icon is not filled in.
 This is the same icon as [gear_alt] and [gear_big] in cupertino_icons 1.0.0+.

 See also:

  * [gear_solid], which is similar, but filled in.
  * [gear_big], which is the pre-iOS 7 version of this icon and appears bigger because of fewer and bigger cogs.
  * [settings], which is another cogwheel with a different design.

- **gear_solid**: `IconData`
  <i class='cupertino-icons md-36'>gear_alt_fill</i> &#x2014; Cupertino icon for a gear with eight cogs. This icon is filled in.
 This is the same icon as [gear_alt_fill] in cupertino_icons 1.0.0+.

 See also:

  * [gear], which is similar, but not filled in.
  * [settings_solid], which is another cogwheel with a different design.

- **gear_big**: `IconData`
  <i class='cupertino-icons md-36'>gear_alt</i> &#x2014; Cupertino icon for a gear with six cogs.
 This is the same icon as [gear_alt] and [gear] in cupertino_icons 1.0.0+.

 See also:

  * [gear], which is the iOS 7 version of this icon and appears smaller because of more and larger cogs.
  * [settings_solid], which is another cogwheel with a different design.

- **settings**: `IconData`
  <i class='cupertino-icons md-36'>settings</i> &#x2014; Cupertino icon for a cogwheel with many cogs and decoration in the middle. This icon is not filled in.

 See also:

  * [settings_solid], which is similar, but filled in.
  * [gear], which is another cogwheel with a different design.

- **settings_solid**: `IconData`
  <i class='cupertino-icons md-36'>settings_solid</i> &#x2014; Cupertino icon for a cogwheel with many cogs and decoration in the middle. This icon is filled in.

 See also:

  * [settings], which is similar, but not filled in.
  * [gear_solid], which is another cogwheel with a different design.

- **music_note**: `IconData`
  <i class='cupertino-icons md-36'>music_note</i> &#x2014; Cupertino icon for a symbol representing a solid single musical note.

 See also:

  * [double_music_note], which is similar, but with 2 connected notes.

- **double_music_note**: `IconData`
  <i class='cupertino-icons md-36'>music_note_2</i> &#x2014; Cupertino icon for a symbol representing 2 connected musical notes.
 This is the same icon as [music_note_2] in cupertino_icons 1.0.0+.

 See also:

  * [music_note], which is similar, but with a single note.

- **play_arrow**: `IconData`
  <i class='cupertino-icons md-36'>play</i> &#x2014; Cupertino icon for a triangle facing to the right. This icon is not filled in.
 This is the same icon as [play] in cupertino_icons 1.0.0+.

 See also:

  * [play_arrow_solid], which is similar, but filled in.

- **play_arrow_solid**: `IconData`
  <i class='cupertino-icons md-36'>play_fill</i> &#x2014; Cupertino icon for a triangle facing to the right. This icon is filled in.
 This is the same icon as [play_fill] in cupertino_icons 1.0.0+.

 See also:

  * [play_arrow], which is similar, but not filled in.

- **pause**: `IconData`
  <i class='cupertino-icons md-36'>pause</i> &#x2014; Cupertino icon for an two vertical rectangles. This icon is not filled in.

 See also:

  * [pause_solid], which is similar, but filled in.

- **pause_solid**: `IconData`
  <i class='cupertino-icons md-36'>pause_fill</i> &#x2014; Cupertino icon for an two vertical rectangles. This icon is filled in.
 This is the same icon as [pause_fill] in cupertino_icons 1.0.0+.

 See also:

  * [pause], which is similar, but not filled in.

- **loop**: `IconData`
  <i class='cupertino-icons md-36'>infinite</i> &#x2014; Cupertino icon for the infinity symbol.
 This is the same icon as [infinite] and [loop_thick] in cupertino_icons 1.0.0+.

 See also:

  * [loop_thick], which is similar, but thicker.

- **loop_thick**: `IconData`
  <i class='cupertino-icons md-36'>infinite</i> &#x2014; Cupertino icon for the infinity symbol.
 This is the same icon as [infinite] and [loop] in cupertino_icons 1.0.0+.

 See also:

  * [loop], which is similar, but thinner.

- **volume_down**: `IconData`
  <i class='cupertino-icons md-36'>speaker_1_fill</i> &#x2014; Cupertino icon for a speaker with a single small sound wave.
 This is the same icon as [speaker_1_fill] in cupertino_icons 1.0.0+.

 See also:

  * [volume_mute], which is similar, but has no sound waves.
  * [volume_off], which is similar, but with an additional larger sound wave and a diagonal line crossing the whole icon.
  * [volume_up], which has an additional larger sound wave next to the small one.

- **volume_mute**: `IconData`
  <i class='cupertino-icons md-36'>speaker_fill</i> &#x2014; Cupertino icon for a speaker symbol.
 This is the same icon as [speaker_fill] in cupertino_icons 1.0.0+.

 See also:

  * [volume_down], which is similar, but adds a small sound wave.
  * [volume_off], which is similar, but adds a small and a large sound wave and a diagonal line crossing the whole icon.
  * [volume_up], which is similar, but has a small and a large sound wave.

- **volume_off**: `IconData`
  <i class='cupertino-icons md-36'>speaker_slash_fill</i> &#x2014; Cupertino icon for a speaker with a small and a large sound wave and a diagonal line crossing the whole icon.
 This is the same icon as [speaker_slash_fill] in cupertino_icons 1.0.0+.

 See also:

  * [volume_down], which is similar, but not crossed out and only has the small wave.
  * [volume_mute], which is similar, but not crossed out.
  * [volume_up], which is the version of this icon that is not crossed out.

- **volume_up**: `IconData`
  <i class='cupertino-icons md-36'>speaker_3_fill</i> &#x2014; Cupertino icon for a speaker with a small and a large sound wave.
 This is the same icon as [speaker_3_fill] in cupertino_icons 1.0.0+.

 See also:

  * [volume_down], which is similar, but only has the small sound wave.
  * [volume_mute], which is similar, but has no sound waves.
  * [volume_off], which is the crossed out version of this icon.

- **fullscreen**: `IconData`
  <i class='cupertino-icons md-36'>arrow_up_left_arrow_down_right</i> &#x2014; Cupertino icon for all four corners of a square facing inwards.
 This is the same icon as [arrow_up_left_arrow_down_right] in cupertino_icons 1.0.0+.

 See also:

  * [fullscreen_exit], which is similar, but has the corners facing outwards.

- **fullscreen_exit**: `IconData`
  <i class='cupertino-icons md-36'>arrow_down_right_arrow_up_left</i> &#x2014; Cupertino icon for all four corners of a square facing outwards.
 This is the same icon as [arrow_down_right_arrow_up_left] in cupertino_icons 1.0.0+.

 See also:

  * [fullscreen], which is similar, but has the corners facing inwards.

- **mic_off**: `IconData`
  <i class='cupertino-icons md-36'>mic_slash</i> &#x2014; Cupertino icon for a filled in microphone with a diagonal line crossing it.
 This is the same icon as [mic_slash] in cupertino_icons 1.0.0+.

 See also:

  * [mic], which is similar, but not filled in and without a diagonal line.
  * [mic_solid], which is similar, but without a diagonal line.

- **mic**: `IconData`
  <i class='cupertino-icons md-36'>mic</i> &#x2014; Cupertino icon for a microphone.

 See also:

  * [mic_solid], which is similar, but filled in.
  * [mic_off], which is similar, but filled in and with a diagonal line crossing the icon.

- **mic_solid**: `IconData`
  <i class='cupertino-icons md-36'>mic_fill</i> &#x2014; Cupertino icon for a filled in microphone.
 This is the same icon as [mic_fill] in cupertino_icons 1.0.0+.

 See also:

  * [mic], which is similar, but not filled in.
  * [mic_off], which is similar, but with a diagonal line crossing the icon.

- **clock**: `IconData`
  <i class='cupertino-icons md-36'>time</i> &#x2014; Cupertino icon for a circle with a dotted clock face inside with hands showing 10:30.
 This is the same icon as [time] in cupertino_icons 1.0.0+.

 See also:

  * [clock_solid], which is similar, but filled in.
  * [time], which is similar, but without dots on the clock face.
  * [time_solid], which is similar, but filled in and without dots on the clock face.

- **clock_solid**: `IconData`
  <i class='cupertino-icons md-36'>clock_fill</i> &#x2014; Cupertino icon for a filled in circle with a dotted clock face inside with hands showing 10:30.
 This is the same icon as [clock_fill] and [time_solid] in cupertino_icons 1.0.0+.

 See also:

  * [clock], which is similar, but not filled in.
  * [time], which is similar, but not filled in and without dots on the clock face.
  * [time_solid], which is similar, but without dots on the clock face.

- **time**: `IconData`
  <i class='cupertino-icons md-36'>clock</i> &#x2014; Cupertino icon for a circle with a 90 degree angle shape in the center, resembling a clock with hands showing 09:00.
 This is the same icon as [clock] in cupertino_icons 1.0.0+.

 See also:

  * [time_solid], which is similar, but filled in.
  * [clock], which is similar, but with dots on the clock face.
  * [clock_solid], which is similar, but filled in and with dots on the clock face.

- **time_solid**: `IconData`
  <i class='cupertino-icons md-36'>clock_fill</i> &#x2014; Cupertino icon for a filled in circle with a 90 degree angle shape in the center, resembling a clock with hands showing 09:00.
 This is the same icon as [clock_fill] and [clock_solid] in cupertino_icons 1.0.0+.

 See also:

  * [time], which is similar, but not filled in.
  * [clock], which is similar, but not filled in and with dots on the clock face.
  * [clock_solid], which is similar, but with dots on the clock face.

- **padlock**: `IconData`
  <i class='cupertino-icons md-36'>lock</i> &#x2014; Cupertino icon for an unlocked padlock.
 This is the same icon as [lock] in cupertino_icons 1.0.0+.

 See also:

  * [padlock_solid], which is similar, but filled in.

- **padlock_solid**: `IconData`
  <i class='cupertino-icons md-36'>lock_fill</i> &#x2014; Cupertino icon for an unlocked padlock.
 This is the same icon as [lock_fill] in cupertino_icons 1.0.0+.

 See also:

  * [padlock], which is similar, but not filled in.

- **eye**: `IconData`
  <i class='cupertino-icons md-36'>eye</i> &#x2014; Cupertino icon for an open eye.

 See also:

  * [eye_solid], which is similar, but filled in.

- **eye_solid**: `IconData`
  <i class='cupertino-icons md-36'>eye_fill</i> &#x2014; Cupertino icon for an open eye.
 This is the same icon as [eye_fill] in cupertino_icons 1.0.0+.

 See also:

  * [eye], which is similar, but not filled in.

- **person**: `IconData`
  <i class='cupertino-icons md-36'>person</i> &#x2014; Cupertino icon for a single person. This icon is not filled in.

 See also:

  * [person_solid], which is similar, but filled in.
  * [person_add], which has an additional plus sign next to the person.
  * [group], which consists of three people.

- **person_solid**: `IconData`
  <i class='cupertino-icons md-36'>person_fill</i> &#x2014; Cupertino icon for a single person. This icon is filled in.
 This is the same icon as [person_fill] in cupertino_icons 1.0.0+.

 See also:

  * [person], which is similar, but not filled in.
  * [person_add_solid], which has an additional plus sign next to the person.
  * [group_solid], which consists of three people.

- **person_add**: `IconData`
  <i class='cupertino-icons md-36'>person_badge_plus</i> &#x2014; Cupertino icon for a single person with a plus sign next to it. This icon is not filled in.
 This is the same icon as [person_badge_plus] in cupertino_icons 1.0.0+.x

 See also:

  * [person_add_solid], which is similar, but filled in.
  * [person], which is just the person.
  * [group], which consists of three people.

- **person_add_solid**: `IconData`
  <i class='cupertino-icons md-36'>person_badge_plus_fill</i> &#x2014; Cupertino icon for a single person with a plus sign next to it. This icon is filled in.
 This is the same icon as [person_badge_plus_fill] in cupertino_icons 1.0.0+.

 See also:

  * [person_add], which is similar, but not filled in.
  * [person_solid], which is just the person.
  * [group_solid], which consists of three people.

- **group**: `IconData`
  <i class='cupertino-icons md-36'>person_3</i> &#x2014; Cupertino icon for a group of three people. This icon is not filled in.
 This is the same icon as [person_3] in cupertino_icons 1.0.0+.

 See also:

  * [group_solid], which is similar, but filled in.
  * [person], which is just a single person.

- **group_solid**: `IconData`
  <i class='cupertino-icons md-36'>person_3_fill</i> &#x2014; Cupertino icon for a group of three people. This icon is filled in.
 This is the same icon as [person_3_fill] in cupertino_icons 1.0.0+.

 See also:

  * [group], which is similar, but not filled in.
  * [person_solid], which is just a single person.

- **mail**: `IconData`
  <i class='cupertino-icons md-36'>envelope</i> &#x2014; Cupertino icon for the outline of a closed mail envelope.
 This is the same icon as [envelope] in cupertino_icons 1.0.0+.

- **mail_solid**: `IconData`
  <i class='cupertino-icons md-36'>envelope_fill</i> &#x2014; Cupertino icon for a closed mail envelope. This icon is filled in.
 This is the same icon as [envelope_fill] in cupertino_icons 1.0.0+.

- **location**: `IconData`
  <i class='cupertino-icons md-36'>location</i> &#x2014; Cupertino icon for a location pin.

- **location_solid**: `IconData`
  <i class='cupertino-icons md-36'>placemark_fill</i> &#x2014; Cupertino icon for a location pin. This icon is filled in.
 This is the same icon as [placemark_fill] in cupertino_icons 1.0.0+.

- **tag**: `IconData`
  <i class='cupertino-icons md-36'>tags</i> &#x2014; Cupertino icon for the outline of a sticker tag.
 This is the same icon as [tags] in cupertino_icons 1.0.0+.

 See also:

  * [tags], similar but with 2 overlapping tags.

- **tag_solid**: `IconData`
  <i class='cupertino-icons md-36'>tag_fill</i> &#x2014; Cupertino icon for a sticker tag. This icon is filled in.
 This is the same icon as [tag_fill] and [tags_solid] in cupertino_icons 1.0.0+.

 See also:

  * [tags_solid], similar but with 2 overlapping tags.

- **tags**: `IconData`
  <i class='cupertino-icons md-36'>tag</i> &#x2014; Cupertino icon for outlines of 2 overlapping sticker tags.
 This is the same icon as [tag] in cupertino_icons 1.0.0+.

 See also:

  * [tag], similar but with only one tag.

- **tags_solid**: `IconData`
  <i class='cupertino-icons md-36'>tag_fill</i> &#x2014; Cupertino icon for 2 overlapping sticker tags. This icon is filled in.
 This is the same icon as [tag_fill] and [tag_solid] in cupertino_icons 1.0.0+.

 See also:

  * [tag_solid], similar but with only one tag.

- **bus**: `IconData`
  <i class='cupertino-icons md-36'>bus</i> &#x2014; Cupertino icon for a filled in bus.
 This icon is available in cupertino_icons 1.0.0+ for backward
 compatibility but not part of Apple icons' aesthetics.

- **car**: `IconData`
  <i class='cupertino-icons md-36'>car_fill</i> &#x2014; Cupertino icon for a filled in car.
 This is the same icon as [car_fill] in cupertino_icons 1.0.0+.

 See also:

  * [car_detailed], similar, but a more detailed and realistic representation.

- **car_detailed**: `IconData`
  <i class='cupertino-icons md-36'>car_detailed</i> &#x2014; Cupertino icon for a filled in detailed, realistic car.

 See also:

  * [car], similar, but a more simple representation.
 This icon is available in cupertino_icons 1.0.0+ for backward
 compatibility but not part of Apple icons' aesthetics.

- **train_style_one**: `IconData`
  <i class='cupertino-icons md-36'>train_style_one</i> &#x2014; Cupertino icon for a filled in train with a window divided in half and two headlights.
 This icon is available in cupertino_icons 1.0.0+ for backward
 compatibility but not part of Apple icons' aesthetics.

 See also:

  * [train_style_two], similar, but with a full, undivided window and a single, centered headlight.

- **train_style_two**: `IconData`
  <i class='cupertino-icons md-36'>train_style_two</i> &#x2014; Cupertino icon for a filled in train with a window and a single, centered headlight.
 This icon is available in cupertino_icons 1.0.0+ for backward
 compatibility but not part of Apple icons' aesthetics.

 See also:

  * [train_style_one], similar, but with a with a window divided in half and two headlights.

- **paw**: `IconData`
  <i class='cupertino-icons md-36'>paw</i> &#x2014; Cupertino icon for an outlined paw.

 See also:

  * [paw_solid], similar, but filled in.

- **paw_solid**: `IconData`
  <i class='cupertino-icons md-36'>paw</i> &#x2014; Cupertino icon for a filled in paw.
 This is the same icon as [paw] in cupertino_icons 1.0.0+.

 See also:

  * [paw], similar, but not filled in.

- **game_controller**: `IconData`
  <i class='cupertino-icons md-36'>gamecontroller</i> &#x2014; Cupertino icon for an outlined game controller.
 This is the same icon as [gamecontroller] in cupertino_icons 1.0.0+.

 See also:

  * [game_controller_solid], similar, but filled in.

- **game_controller_solid**: `IconData`
  <i class='cupertino-icons md-36'>gamecontroller_fill</i> &#x2014; Cupertino icon for a filled in game controller.
 This is the same icon as [gamecontroller_fill] in cupertino_icons 1.0.0+.

 See also:

  * [game_controller], similar, but not filled in.

- **lab_flask**: `IconData`
  <i class='cupertino-icons md-36'>lab_flask</i> &#x2014; Cupertino icon for an outlined lab flask.
 This icon is available in cupertino_icons 1.0.0+ for backward
 compatibility but not part of Apple icons' aesthetics.

 See also:

  * [lab_flask_solid], similar, but filled in.

- **lab_flask_solid**: `IconData`
  <i class='cupertino-icons md-36'>lab_flask_solid</i> &#x2014; Cupertino icon for a filled in lab flask.
 This icon is available in cupertino_icons 1.0.0+ for backward
 compatibility but not part of Apple icons' aesthetics.

 See also:

  * [lab_flask], similar, but not filled in.

- **heart**: `IconData`
  <i class='cupertino-icons md-36'>heart</i> &#x2014; Cupertino icon for an outlined heart shape. Can be used to indicate like or favorite states.

 See also:

  * [heart_solid], same shape, but filled in.

- **heart_solid**: `IconData`
  <i class='cupertino-icons md-36'>heart_solid</i> &#x2014; Cupertino icon for a filled heart shape. Can be used to indicate like or favorite states.
 This is the same icon as [heart_fill] in cupertino_icons 1.0.0+.

 See also:

  * [heart], same shape, but not filled in.

- **bell**: `IconData`
  <i class='cupertino-icons md-36'>bell</i> &#x2014; Cupertino icon for an outlined bell. Can be used to represent notifications.

 See also:

  * [bell_solid], same shape, but filled in.

- **bell_solid**: `IconData`
  <i class='cupertino-icons md-36'>bell_fill</i> &#x2014; Cupertino icon for a filled bell. Can be used represent notifications.
 This is the same icon as [bell_fill] in cupertino_icons 1.0.0+.

 See also:

  * [bell], same shape, but not filled in.

- **news**: `IconData`
  <i class='cupertino-icons md-36'>news</i> &#x2014; Cupertino icon for an outlined folded newspaper icon.
 This icon is available in cupertino_icons 1.0.0+ for backward
 compatibility but not part of Apple icons' aesthetics.

 See also:

  * [news_solid], same shape, but filled in.

- **news_solid**: `IconData`
  <i class='cupertino-icons md-36'>news_solid</i> &#x2014; Cupertino icon for a filled folded newspaper icon.
 This icon is available in cupertino_icons 1.0.0+ for backward
 compatibility but not part of Apple icons' aesthetics.

 See also:

  * [news], same shape, but not filled in.

- **brightness**: `IconData`
  <i class='cupertino-icons md-36'>sun_max</i> &#x2014; Cupertino icon for an outlined brightness icon.
 This is the same icon as [sun_max] in cupertino_icons 1.0.0+.

 See also:

  * [brightness_solid], same shape, but filled in.

- **brightness_solid**: `IconData`
  <i class='cupertino-icons md-36'>sun_max_fill</i> &#x2014; Cupertino icon for a filled in brightness icon.
 This is the same icon as [sun_max_fill] in cupertino_icons 1.0.0+.

 See also:

  * [brightness], same shape, but not filled in.

- **airplane**: `IconData`
  <i class='cupertino-icons md-36'>&#xf4d4;</i> &#x2014; Cupertino icon named "airplane". Available on cupertino_icons package 1.0.0+ only.

- **alarm**: `IconData`
  <i class='cupertino-icons md-36'>&#xf4d5;</i> &#x2014; Cupertino icon named "alarm". Available on cupertino_icons package 1.0.0+ only.

- **alarm_fill**: `IconData`
  <i class='cupertino-icons md-36'>&#xf4d6;</i> &#x2014; Cupertino icon named "alarm_fill". Available on cupertino_icons package 1.0.0+ only.

- **alt**: `IconData`
  <i class='cupertino-icons md-36'>&#xf4d7;</i> &#x2014; Cupertino icon named "alt". Available on cupertino_icons package 1.0.0+ only.

- **ant**: `IconData`
  <i class='cupertino-icons md-36'>&#xf4d8;</i> &#x2014; Cupertino icon named "ant". Available on cupertino_icons package 1.0.0+ only.

- **ant_circle**: `IconData`
  <i class='cupertino-icons md-36'>&#xf4d9;</i> &#x2014; Cupertino icon named "ant_circle". Available on cupertino_icons package 1.0.0+ only.

- **ant_circle_fill**: `IconData`
  <i class='cupertino-icons md-36'>&#xf4da;</i> &#x2014; Cupertino icon named "ant_circle_fill". Available on cupertino_icons package 1.0.0+ only.

- **ant_fill**: `IconData`
  <i class='cupertino-icons md-36'>&#xf4db;</i> &#x2014; Cupertino icon named "ant_fill". Available on cupertino_icons package 1.0.0+ only.

- **antenna_radiowaves_left_right**: `IconData`
  <i class='cupertino-icons md-36'>&#xf4dc;</i> &#x2014; Cupertino icon named "antenna_radiowaves_left_right". Available on cupertino_icons package 1.0.0+ only.

- **app**: `IconData`
  <i class='cupertino-icons md-36'>&#xf4dd;</i> &#x2014; Cupertino icon named "app". Available on cupertino_icons package 1.0.0+ only.

- **app_badge**: `IconData`
  <i class='cupertino-icons md-36'>&#xf4de;</i> &#x2014; Cupertino icon named "app_badge". Available on cupertino_icons package 1.0.0+ only.

- **app_badge_fill**: `IconData`
  <i class='cupertino-icons md-36'>&#xf4df;</i> &#x2014; Cupertino icon named "app_badge_fill". Available on cupertino_icons package 1.0.0+ only.

- **app_fill**: `IconData`
  <i class='cupertino-icons md-36'>&#xf4e0;</i> &#x2014; Cupertino icon named "app_fill". Available on cupertino_icons package 1.0.0+ only.

- **archivebox**: `IconData`
  <i class='cupertino-icons md-36'>&#xf4e1;</i> &#x2014; Cupertino icon named "archivebox". Available on cupertino_icons package 1.0.0+ only.

- **archivebox_fill**: `IconData`
  <i class='cupertino-icons md-36'>&#xf4e2;</i> &#x2014; Cupertino icon named "archivebox_fill". Available on cupertino_icons package 1.0.0+ only.

- **arrow_2_circlepath**: `IconData`
  <i class='cupertino-icons md-36'>&#xf4e3;</i> &#x2014; Cupertino icon named "arrow_2_circlepath". Available on cupertino_icons package 1.0.0+ only.

- **arrow_2_circlepath_circle**: `IconData`
  <i class='cupertino-icons md-36'>&#xf4e4;</i> &#x2014; Cupertino icon named "arrow_2_circlepath_circle". Available on cupertino_icons package 1.0.0+ only.

- **arrow_2_circlepath_circle_fill**: `IconData`
  <i class='cupertino-icons md-36'>&#xf4e5;</i> &#x2014; Cupertino icon named "arrow_2_circlepath_circle_fill". Available on cupertino_icons package 1.0.0+ only.

- **arrow_2_squarepath**: `IconData`
  <i class='cupertino-icons md-36'>&#xf4e6;</i> &#x2014; Cupertino icon named "arrow_2_squarepath". Available on cupertino_icons package 1.0.0+ only.

- **arrow_3_trianglepath**: `IconData`
  <i class='cupertino-icons md-36'>&#xf4e7;</i> &#x2014; Cupertino icon named "arrow_3_trianglepath". Available on cupertino_icons package 1.0.0+ only.

- **arrow_branch**: `IconData`
  <i class='cupertino-icons md-36'>&#xf4e8;</i> &#x2014; Cupertino icon named "arrow_branch". Available on cupertino_icons package 1.0.0+ only.

- **arrow_clockwise**: `IconData`
  <i class='cupertino-icons md-36'>&#xf49a;</i> &#x2014; Cupertino icon named "arrow_clockwise". Available on cupertino_icons package 1.0.0+ only.
 This is the same icon as [refresh] which is available in cupertino_icons 0.1.3.
 This is the same icon as [refresh_thin] which is available in cupertino_icons 0.1.3.
 This is the same icon as [refresh_thick] which is available in cupertino_icons 0.1.3.

- **arrow_clockwise_circle**: `IconData`
  <i class='cupertino-icons md-36'>&#xf49b;</i> &#x2014; Cupertino icon named "arrow_clockwise_circle". Available on cupertino_icons package 1.0.0+ only.
 This is the same icon as [refresh_circled] which is available in cupertino_icons 0.1.3.

- **arrow_clockwise_circle_fill**: `IconData`
  <i class='cupertino-icons md-36'>&#xf49c;</i> &#x2014; Cupertino icon named "arrow_clockwise_circle_fill". Available on cupertino_icons package 1.0.0+ only.
 This is the same icon as [refresh_circled_solid] which is available in cupertino_icons 0.1.3.

- **arrow_counterclockwise**: `IconData`
  <i class='cupertino-icons md-36'>&#xf21c;</i> &#x2014; Cupertino icon named "arrow_counterclockwise". Available on cupertino_icons package 1.0.0+ only.
 This is the same icon as [restart] which is available in cupertino_icons 0.1.3.
 This is the same icon as [refresh_bold] which is available in cupertino_icons 0.1.3.

- **arrow_counterclockwise_circle**: `IconData`
  <i class='cupertino-icons md-36'>&#xf4e9;</i> &#x2014; Cupertino icon named "arrow_counterclockwise_circle". Available on cupertino_icons package 1.0.0+ only.

- **arrow_counterclockwise_circle_fill**: `IconData`
  <i class='cupertino-icons md-36'>&#xf4ea;</i> &#x2014; Cupertino icon named "arrow_counterclockwise_circle_fill". Available on cupertino_icons package 1.0.0+ only.

- **arrow_down**: `IconData`
  <i class='cupertino-icons md-36'>&#xf35d;</i> &#x2014; Cupertino icon named "arrow_down". Available on cupertino_icons package 1.0.0+ only.
 This is the same icon as [down_arrow] which is available in cupertino_icons 0.1.3.

- **arrow_down_circle**: `IconData`
  <i class='cupertino-icons md-36'>&#xf4eb;</i> &#x2014; Cupertino icon named "arrow_down_circle". Available on cupertino_icons package 1.0.0+ only.

- **arrow_down_circle_fill**: `IconData`
  <i class='cupertino-icons md-36'>&#xf4ec;</i> &#x2014; Cupertino icon named "arrow_down_circle_fill". Available on cupertino_icons package 1.0.0+ only.

- **arrow_down_doc**: `IconData`
  <i class='cupertino-icons md-36'>&#xf4ed;</i> &#x2014; Cupertino icon named "arrow_down_doc". Available on cupertino_icons package 1.0.0+ only.

- **arrow_down_doc_fill**: `IconData`
  <i class='cupertino-icons md-36'>&#xf4ee;</i> &#x2014; Cupertino icon named "arrow_down_doc_fill". Available on cupertino_icons package 1.0.0+ only.

- **arrow_down_left**: `IconData`
  <i class='cupertino-icons md-36'>&#xf4ef;</i> &#x2014; Cupertino icon named "arrow_down_left". Available on cupertino_icons package 1.0.0+ only.

- **arrow_down_left_circle**: `IconData`
  <i class='cupertino-icons md-36'>&#xf4f0;</i> &#x2014; Cupertino icon named "arrow_down_left_circle". Available on cupertino_icons package 1.0.0+ only.

- **arrow_down_left_circle_fill**: `IconData`
  <i class='cupertino-icons md-36'>&#xf4f1;</i> &#x2014; Cupertino icon named "arrow_down_left_circle_fill". Available on cupertino_icons package 1.0.0+ only.

- **arrow_down_left_square**: `IconData`
  <i class='cupertino-icons md-36'>&#xf4f2;</i> &#x2014; Cupertino icon named "arrow_down_left_square". Available on cupertino_icons package 1.0.0+ only.

- **arrow_down_left_square_fill**: `IconData`
  <i class='cupertino-icons md-36'>&#xf4f3;</i> &#x2014; Cupertino icon named "arrow_down_left_square_fill". Available on cupertino_icons package 1.0.0+ only.

- **arrow_down_right**: `IconData`
  <i class='cupertino-icons md-36'>&#xf4f4;</i> &#x2014; Cupertino icon named "arrow_down_right". Available on cupertino_icons package 1.0.0+ only.

- **arrow_down_right_arrow_up_left**: `IconData`
  <i class='cupertino-icons md-36'>&#xf37d;</i> &#x2014; Cupertino icon named "arrow_down_right_arrow_up_left". Available on cupertino_icons package 1.0.0+ only.
 This is the same icon as [fullscreen_exit] which is available in cupertino_icons 0.1.3.

- **arrow_down_right_circle**: `IconData`
  <i class='cupertino-icons md-36'>&#xf4f5;</i> &#x2014; Cupertino icon named "arrow_down_right_circle". Available on cupertino_icons package 1.0.0+ only.

- **arrow_down_right_circle_fill**: `IconData`
  <i class='cupertino-icons md-36'>&#xf4f6;</i> &#x2014; Cupertino icon named "arrow_down_right_circle_fill". Available on cupertino_icons package 1.0.0+ only.

- **arrow_down_right_square**: `IconData`
  <i class='cupertino-icons md-36'>&#xf4f7;</i> &#x2014; Cupertino icon named "arrow_down_right_square". Available on cupertino_icons package 1.0.0+ only.

- **arrow_down_right_square_fill**: `IconData`
  <i class='cupertino-icons md-36'>&#xf4f8;</i> &#x2014; Cupertino icon named "arrow_down_right_square_fill". Available on cupertino_icons package 1.0.0+ only.

- **arrow_down_square**: `IconData`
  <i class='cupertino-icons md-36'>&#xf4f9;</i> &#x2014; Cupertino icon named "arrow_down_square". Available on cupertino_icons package 1.0.0+ only.

- **arrow_down_square_fill**: `IconData`
  <i class='cupertino-icons md-36'>&#xf4fa;</i> &#x2014; Cupertino icon named "arrow_down_square_fill". Available on cupertino_icons package 1.0.0+ only.

- **arrow_down_to_line**: `IconData`
  <i class='cupertino-icons md-36'>&#xf4fb;</i> &#x2014; Cupertino icon named "arrow_down_to_line". Available on cupertino_icons package 1.0.0+ only.

- **arrow_down_to_line_alt**: `IconData`
  <i class='cupertino-icons md-36'>&#xf4fc;</i> &#x2014; Cupertino icon named "arrow_down_to_line_alt". Available on cupertino_icons package 1.0.0+ only.

- **arrow_left**: `IconData`
  <i class='cupertino-icons md-36'>&#xf4fd;</i> &#x2014; Cupertino icon named "arrow_left". Available on cupertino_icons package 1.0.0+ only.

- **arrow_left_circle**: `IconData`
  <i class='cupertino-icons md-36'>&#xf4fe;</i> &#x2014; Cupertino icon named "arrow_left_circle". Available on cupertino_icons package 1.0.0+ only.

- **arrow_left_circle_fill**: `IconData`
  <i class='cupertino-icons md-36'>&#xf4ff;</i> &#x2014; Cupertino icon named "arrow_left_circle_fill". Available on cupertino_icons package 1.0.0+ only.

- **arrow_left_right**: `IconData`
  <i class='cupertino-icons md-36'>&#xf500;</i> &#x2014; Cupertino icon named "arrow_left_right". Available on cupertino_icons package 1.0.0+ only.

- **arrow_left_right_circle**: `IconData`
  <i class='cupertino-icons md-36'>&#xf501;</i> &#x2014; Cupertino icon named "arrow_left_right_circle". Available on cupertino_icons package 1.0.0+ only.

- **arrow_left_right_circle_fill**: `IconData`
  <i class='cupertino-icons md-36'>&#xf502;</i> &#x2014; Cupertino icon named "arrow_left_right_circle_fill". Available on cupertino_icons package 1.0.0+ only.

- **arrow_left_right_square**: `IconData`
  <i class='cupertino-icons md-36'>&#xf503;</i> &#x2014; Cupertino icon named "arrow_left_right_square". Available on cupertino_icons package 1.0.0+ only.

- **arrow_left_right_square_fill**: `IconData`
  <i class='cupertino-icons md-36'>&#xf504;</i> &#x2014; Cupertino icon named "arrow_left_right_square_fill". Available on cupertino_icons package 1.0.0+ only.

- **arrow_left_square**: `IconData`
  <i class='cupertino-icons md-36'>&#xf505;</i> &#x2014; Cupertino icon named "arrow_left_square". Available on cupertino_icons package 1.0.0+ only.

- **arrow_left_square_fill**: `IconData`
  <i class='cupertino-icons md-36'>&#xf506;</i> &#x2014; Cupertino icon named "arrow_left_square_fill". Available on cupertino_icons package 1.0.0+ only.

- **arrow_left_to_line**: `IconData`
  <i class='cupertino-icons md-36'>&#xf507;</i> &#x2014; Cupertino icon named "arrow_left_to_line". Available on cupertino_icons package 1.0.0+ only.

- **arrow_left_to_line_alt**: `IconData`
  <i class='cupertino-icons md-36'>&#xf508;</i> &#x2014; Cupertino icon named "arrow_left_to_line_alt". Available on cupertino_icons package 1.0.0+ only.

- **arrow_merge**: `IconData`
  <i class='cupertino-icons md-36'>&#xf509;</i> &#x2014; Cupertino icon named "arrow_merge". Available on cupertino_icons package 1.0.0+ only.

- **arrow_right**: `IconData`
  <i class='cupertino-icons md-36'>&#xf50a;</i> &#x2014; Cupertino icon named "arrow_right". Available on cupertino_icons package 1.0.0+ only.

- **arrow_right_arrow_left**: `IconData`
  <i class='cupertino-icons md-36'>&#xf50b;</i> &#x2014; Cupertino icon named "arrow_right_arrow_left". Available on cupertino_icons package 1.0.0+ only.

- **arrow_right_arrow_left_circle**: `IconData`
  <i class='cupertino-icons md-36'>&#xf50c;</i> &#x2014; Cupertino icon named "arrow_right_arrow_left_circle". Available on cupertino_icons package 1.0.0+ only.

- **arrow_right_arrow_left_circle_fill**: `IconData`
  <i class='cupertino-icons md-36'>&#xf50d;</i> &#x2014; Cupertino icon named "arrow_right_arrow_left_circle_fill". Available on cupertino_icons package 1.0.0+ only.

- **arrow_right_arrow_left_square**: `IconData`
  <i class='cupertino-icons md-36'>&#xf50e;</i> &#x2014; Cupertino icon named "arrow_right_arrow_left_square". Available on cupertino_icons package 1.0.0+ only.

- **arrow_right_arrow_left_square_fill**: `IconData`
  <i class='cupertino-icons md-36'>&#xf50f;</i> &#x2014; Cupertino icon named "arrow_right_arrow_left_square_fill". Available on cupertino_icons package 1.0.0+ only.

- **arrow_right_circle**: `IconData`
  <i class='cupertino-icons md-36'>&#xf510;</i> &#x2014; Cupertino icon named "arrow_right_circle". Available on cupertino_icons package 1.0.0+ only.

- **arrow_right_circle_fill**: `IconData`
  <i class='cupertino-icons md-36'>&#xf511;</i> &#x2014; Cupertino icon named "arrow_right_circle_fill". Available on cupertino_icons package 1.0.0+ only.

- **arrow_right_square**: `IconData`
  <i class='cupertino-icons md-36'>&#xf512;</i> &#x2014; Cupertino icon named "arrow_right_square". Available on cupertino_icons package 1.0.0+ only.

- **arrow_right_square_fill**: `IconData`
  <i class='cupertino-icons md-36'>&#xf513;</i> &#x2014; Cupertino icon named "arrow_right_square_fill". Available on cupertino_icons package 1.0.0+ only.

- **arrow_right_to_line**: `IconData`
  <i class='cupertino-icons md-36'>&#xf514;</i> &#x2014; Cupertino icon named "arrow_right_to_line". Available on cupertino_icons package 1.0.0+ only.

- **arrow_right_to_line_alt**: `IconData`
  <i class='cupertino-icons md-36'>&#xf515;</i> &#x2014; Cupertino icon named "arrow_right_to_line_alt". Available on cupertino_icons package 1.0.0+ only.

- **arrow_swap**: `IconData`
  <i class='cupertino-icons md-36'>&#xf516;</i> &#x2014; Cupertino icon named "arrow_swap". Available on cupertino_icons package 1.0.0+ only.

- **arrow_turn_down_left**: `IconData`
  <i class='cupertino-icons md-36'>&#xf517;</i> &#x2014; Cupertino icon named "arrow_turn_down_left". Available on cupertino_icons package 1.0.0+ only.

- **arrow_turn_down_right**: `IconData`
  <i class='cupertino-icons md-36'>&#xf518;</i> &#x2014; Cupertino icon named "arrow_turn_down_right". Available on cupertino_icons package 1.0.0+ only.

- **arrow_turn_left_down**: `IconData`
  <i class='cupertino-icons md-36'>&#xf519;</i> &#x2014; Cupertino icon named "arrow_turn_left_down". Available on cupertino_icons package 1.0.0+ only.

- **arrow_turn_left_up**: `IconData`
  <i class='cupertino-icons md-36'>&#xf51a;</i> &#x2014; Cupertino icon named "arrow_turn_left_up". Available on cupertino_icons package 1.0.0+ only.

- **arrow_turn_right_down**: `IconData`
  <i class='cupertino-icons md-36'>&#xf51b;</i> &#x2014; Cupertino icon named "arrow_turn_right_down". Available on cupertino_icons package 1.0.0+ only.

- **arrow_turn_right_up**: `IconData`
  <i class='cupertino-icons md-36'>&#xf51c;</i> &#x2014; Cupertino icon named "arrow_turn_right_up". Available on cupertino_icons package 1.0.0+ only.

- **arrow_turn_up_left**: `IconData`
  <i class='cupertino-icons md-36'>&#xf51d;</i> &#x2014; Cupertino icon named "arrow_turn_up_left". Available on cupertino_icons package 1.0.0+ only.

- **arrow_turn_up_right**: `IconData`
  <i class='cupertino-icons md-36'>&#xf51e;</i> &#x2014; Cupertino icon named "arrow_turn_up_right". Available on cupertino_icons package 1.0.0+ only.

- **arrow_up**: `IconData`
  <i class='cupertino-icons md-36'>&#xf366;</i> &#x2014; Cupertino icon named "arrow_up". Available on cupertino_icons package 1.0.0+ only.
 This is the same icon as [up_arrow] which is available in cupertino_icons 0.1.3.

- **arrow_up_arrow_down**: `IconData`
  <i class='cupertino-icons md-36'>&#xf51f;</i> &#x2014; Cupertino icon named "arrow_up_arrow_down". Available on cupertino_icons package 1.0.0+ only.

- **arrow_up_arrow_down_circle**: `IconData`
  <i class='cupertino-icons md-36'>&#xf520;</i> &#x2014; Cupertino icon named "arrow_up_arrow_down_circle". Available on cupertino_icons package 1.0.0+ only.

- **arrow_up_arrow_down_circle_fill**: `IconData`
  <i class='cupertino-icons md-36'>&#xf521;</i> &#x2014; Cupertino icon named "arrow_up_arrow_down_circle_fill". Available on cupertino_icons package 1.0.0+ only.

- **arrow_up_arrow_down_square**: `IconData`
  <i class='cupertino-icons md-36'>&#xf522;</i> &#x2014; Cupertino icon named "arrow_up_arrow_down_square". Available on cupertino_icons package 1.0.0+ only.

- **arrow_up_arrow_down_square_fill**: `IconData`
  <i class='cupertino-icons md-36'>&#xf523;</i> &#x2014; Cupertino icon named "arrow_up_arrow_down_square_fill". Available on cupertino_icons package 1.0.0+ only.

- **arrow_up_bin**: `IconData`
  <i class='cupertino-icons md-36'>&#xf524;</i> &#x2014; Cupertino icon named "arrow_up_bin". Available on cupertino_icons package 1.0.0+ only.

- **arrow_up_bin_fill**: `IconData`
  <i class='cupertino-icons md-36'>&#xf525;</i> &#x2014; Cupertino icon named "arrow_up_bin_fill". Available on cupertino_icons package 1.0.0+ only.

- **arrow_up_circle**: `IconData`
  <i class='cupertino-icons md-36'>&#xf526;</i> &#x2014; Cupertino icon named "arrow_up_circle". Available on cupertino_icons package 1.0.0+ only.

- **arrow_up_circle_fill**: `IconData`
  <i class='cupertino-icons md-36'>&#xf527;</i> &#x2014; Cupertino icon named "arrow_up_circle_fill". Available on cupertino_icons package 1.0.0+ only.

- **arrow_up_doc**: `IconData`
  <i class='cupertino-icons md-36'>&#xf528;</i> &#x2014; Cupertino icon named "arrow_up_doc". Available on cupertino_icons package 1.0.0+ only.

- **arrow_up_doc_fill**: `IconData`
  <i class='cupertino-icons md-36'>&#xf529;</i> &#x2014; Cupertino icon named "arrow_up_doc_fill". Available on cupertino_icons package 1.0.0+ only.

- **arrow_up_down**: `IconData`
  <i class='cupertino-icons md-36'>&#xf52a;</i> &#x2014; Cupertino icon named "arrow_up_down". Available on cupertino_icons package 1.0.0+ only.

- **arrow_up_down_circle**: `IconData`
  <i class='cupertino-icons md-36'>&#xf52b;</i> &#x2014; Cupertino icon named "arrow_up_down_circle". Available on cupertino_icons package 1.0.0+ only.

- **arrow_up_down_circle_fill**: `IconData`
  <i class='cupertino-icons md-36'>&#xf52c;</i> &#x2014; Cupertino icon named "arrow_up_down_circle_fill". Available on cupertino_icons package 1.0.0+ only.

- **arrow_up_down_square**: `IconData`
  <i class='cupertino-icons md-36'>&#xf52d;</i> &#x2014; Cupertino icon named "arrow_up_down_square". Available on cupertino_icons package 1.0.0+ only.

- **arrow_up_down_square_fill**: `IconData`
  <i class='cupertino-icons md-36'>&#xf52e;</i> &#x2014; Cupertino icon named "arrow_up_down_square_fill". Available on cupertino_icons package 1.0.0+ only.

- **arrow_up_left**: `IconData`
  <i class='cupertino-icons md-36'>&#xf52f;</i> &#x2014; Cupertino icon named "arrow_up_left". Available on cupertino_icons package 1.0.0+ only.

- **arrow_up_left_arrow_down_right**: `IconData`
  <i class='cupertino-icons md-36'>&#xf386;</i> &#x2014; Cupertino icon named "arrow_up_left_arrow_down_right". Available on cupertino_icons package 1.0.0+ only.
 This is the same icon as [fullscreen] which is available in cupertino_icons 0.1.3.

- **arrow_up_left_circle**: `IconData`
  <i class='cupertino-icons md-36'>&#xf530;</i> &#x2014; Cupertino icon named "arrow_up_left_circle". Available on cupertino_icons package 1.0.0+ only.

- **arrow_up_left_circle_fill**: `IconData`
  <i class='cupertino-icons md-36'>&#xf531;</i> &#x2014; Cupertino icon named "arrow_up_left_circle_fill". Available on cupertino_icons package 1.0.0+ only.

- **arrow_up_left_square**: `IconData`
  <i class='cupertino-icons md-36'>&#xf532;</i> &#x2014; Cupertino icon named "arrow_up_left_square". Available on cupertino_icons package 1.0.0+ only.

- **arrow_up_left_square_fill**: `IconData`
  <i class='cupertino-icons md-36'>&#xf533;</i> &#x2014; Cupertino icon named "arrow_up_left_square_fill". Available on cupertino_icons package 1.0.0+ only.

- **arrow_up_right**: `IconData`
  <i class='cupertino-icons md-36'>&#xf534;</i> &#x2014; Cupertino icon named "arrow_up_right". Available on cupertino_icons package 1.0.0+ only.

- **arrow_up_right_circle**: `IconData`
  <i class='cupertino-icons md-36'>&#xf535;</i> &#x2014; Cupertino icon named "arrow_up_right_circle". Available on cupertino_icons package 1.0.0+ only.

- **arrow_up_right_circle_fill**: `IconData`
  <i class='cupertino-icons md-36'>&#xf536;</i> &#x2014; Cupertino icon named "arrow_up_right_circle_fill". Available on cupertino_icons package 1.0.0+ only.

- **arrow_up_right_diamond**: `IconData`
  <i class='cupertino-icons md-36'>&#xf537;</i> &#x2014; Cupertino icon named "arrow_up_right_diamond". Available on cupertino_icons package 1.0.0+ only.

- **arrow_up_right_diamond_fill**: `IconData`
  <i class='cupertino-icons md-36'>&#xf538;</i> &#x2014; Cupertino icon named "arrow_up_right_diamond_fill". Available on cupertino_icons package 1.0.0+ only.

- **arrow_up_right_square**: `IconData`
  <i class='cupertino-icons md-36'>&#xf539;</i> &#x2014; Cupertino icon named "arrow_up_right_square". Available on cupertino_icons package 1.0.0+ only.

- **arrow_up_right_square_fill**: `IconData`
  <i class='cupertino-icons md-36'>&#xf53a;</i> &#x2014; Cupertino icon named "arrow_up_right_square_fill". Available on cupertino_icons package 1.0.0+ only.

- **arrow_up_square**: `IconData`
  <i class='cupertino-icons md-36'>&#xf53b;</i> &#x2014; Cupertino icon named "arrow_up_square". Available on cupertino_icons package 1.0.0+ only.

- **arrow_up_square_fill**: `IconData`
  <i class='cupertino-icons md-36'>&#xf53c;</i> &#x2014; Cupertino icon named "arrow_up_square_fill". Available on cupertino_icons package 1.0.0+ only.

- **arrow_up_to_line**: `IconData`
  <i class='cupertino-icons md-36'>&#xf53d;</i> &#x2014; Cupertino icon named "arrow_up_to_line". Available on cupertino_icons package 1.0.0+ only.

- **arrow_up_to_line_alt**: `IconData`
  <i class='cupertino-icons md-36'>&#xf53e;</i> &#x2014; Cupertino icon named "arrow_up_to_line_alt". Available on cupertino_icons package 1.0.0+ only.

- **arrow_uturn_down**: `IconData`
  <i class='cupertino-icons md-36'>&#xf53f;</i> &#x2014; Cupertino icon named "arrow_uturn_down". Available on cupertino_icons package 1.0.0+ only.

- **arrow_uturn_down_circle**: `IconData`
  <i class='cupertino-icons md-36'>&#xf540;</i> &#x2014; Cupertino icon named "arrow_uturn_down_circle". Available on cupertino_icons package 1.0.0+ only.

- **arrow_uturn_down_circle_fill**: `IconData`
  <i class='cupertino-icons md-36'>&#xf541;</i> &#x2014; Cupertino icon named "arrow_uturn_down_circle_fill". Available on cupertino_icons package 1.0.0+ only.

- **arrow_uturn_down_square**: `IconData`
  <i class='cupertino-icons md-36'>&#xf542;</i> &#x2014; Cupertino icon named "arrow_uturn_down_square". Available on cupertino_icons package 1.0.0+ only.

- **arrow_uturn_down_square_fill**: `IconData`
  <i class='cupertino-icons md-36'>&#xf543;</i> &#x2014; Cupertino icon named "arrow_uturn_down_square_fill". Available on cupertino_icons package 1.0.0+ only.

- **arrow_uturn_left**: `IconData`
  <i class='cupertino-icons md-36'>&#xf544;</i> &#x2014; Cupertino icon named "arrow_uturn_left". Available on cupertino_icons package 1.0.0+ only.

- **arrow_uturn_left_circle**: `IconData`
  <i class='cupertino-icons md-36'>&#xf545;</i> &#x2014; Cupertino icon named "arrow_uturn_left_circle". Available on cupertino_icons package 1.0.0+ only.

- **arrow_uturn_left_circle_fill**: `IconData`
  <i class='cupertino-icons md-36'>&#xf546;</i> &#x2014; Cupertino icon named "arrow_uturn_left_circle_fill". Available on cupertino_icons package 1.0.0+ only.

- **arrow_uturn_left_square**: `IconData`
  <i class='cupertino-icons md-36'>&#xf547;</i> &#x2014; Cupertino icon named "arrow_uturn_left_square". Available on cupertino_icons package 1.0.0+ only.

- **arrow_uturn_left_square_fill**: `IconData`
  <i class='cupertino-icons md-36'>&#xf548;</i> &#x2014; Cupertino icon named "arrow_uturn_left_square_fill". Available on cupertino_icons package 1.0.0+ only.

- **arrow_uturn_right**: `IconData`
  <i class='cupertino-icons md-36'>&#xf549;</i> &#x2014; Cupertino icon named "arrow_uturn_right". Available on cupertino_icons package 1.0.0+ only.

- **arrow_uturn_right_circle**: `IconData`
  <i class='cupertino-icons md-36'>&#xf54a;</i> &#x2014; Cupertino icon named "arrow_uturn_right_circle". Available on cupertino_icons package 1.0.0+ only.

- **arrow_uturn_right_circle_fill**: `IconData`
  <i class='cupertino-icons md-36'>&#xf54b;</i> &#x2014; Cupertino icon named "arrow_uturn_right_circle_fill". Available on cupertino_icons package 1.0.0+ only.

- **arrow_uturn_right_square**: `IconData`
  <i class='cupertino-icons md-36'>&#xf54c;</i> &#x2014; Cupertino icon named "arrow_uturn_right_square". Available on cupertino_icons package 1.0.0+ only.

- **arrow_uturn_right_square_fill**: `IconData`
  <i class='cupertino-icons md-36'>&#xf54d;</i> &#x2014; Cupertino icon named "arrow_uturn_right_square_fill". Available on cupertino_icons package 1.0.0+ only.

- **arrow_uturn_up**: `IconData`
  <i class='cupertino-icons md-36'>&#xf54e;</i> &#x2014; Cupertino icon named "arrow_uturn_up". Available on cupertino_icons package 1.0.0+ only.

- **arrow_uturn_up_circle**: `IconData`
  <i class='cupertino-icons md-36'>&#xf54f;</i> &#x2014; Cupertino icon named "arrow_uturn_up_circle". Available on cupertino_icons package 1.0.0+ only.

- **arrow_uturn_up_circle_fill**: `IconData`
  <i class='cupertino-icons md-36'>&#xf550;</i> &#x2014; Cupertino icon named "arrow_uturn_up_circle_fill". Available on cupertino_icons package 1.0.0+ only.

- **arrow_uturn_up_square**: `IconData`
  <i class='cupertino-icons md-36'>&#xf551;</i> &#x2014; Cupertino icon named "arrow_uturn_up_square". Available on cupertino_icons package 1.0.0+ only.

- **arrow_uturn_up_square_fill**: `IconData`
  <i class='cupertino-icons md-36'>&#xf552;</i> &#x2014; Cupertino icon named "arrow_uturn_up_square_fill". Available on cupertino_icons package 1.0.0+ only.

- **arrowshape_turn_up_left**: `IconData`
  <i class='cupertino-icons md-36'>&#xf4c6;</i> &#x2014; Cupertino icon named "arrowshape_turn_up_left". Available on cupertino_icons package 1.0.0+ only.
 This is the same icon as [reply] which is available in cupertino_icons 0.1.3.

- **arrowshape_turn_up_left_2**: `IconData`
  <i class='cupertino-icons md-36'>&#xf21d;</i> &#x2014; Cupertino icon named "arrowshape_turn_up_left_2". Available on cupertino_icons package 1.0.0+ only.
 This is the same icon as [reply_all] which is available in cupertino_icons 0.1.3.

- **arrowshape_turn_up_left_2_fill**: `IconData`
  <i class='cupertino-icons md-36'>&#xf21e;</i> &#x2014; Cupertino icon named "arrowshape_turn_up_left_2_fill". Available on cupertino_icons package 1.0.0+ only.
 This is the same icon as [reply_thick_solid] which is available in cupertino_icons 0.1.3.

- **arrowshape_turn_up_left_circle**: `IconData`
  <i class='cupertino-icons md-36'>&#xf553;</i> &#x2014; Cupertino icon named "arrowshape_turn_up_left_circle". Available on cupertino_icons package 1.0.0+ only.

- **arrowshape_turn_up_left_circle_fill**: `IconData`
  <i class='cupertino-icons md-36'>&#xf554;</i> &#x2014; Cupertino icon named "arrowshape_turn_up_left_circle_fill". Available on cupertino_icons package 1.0.0+ only.

- **arrowshape_turn_up_left_fill**: `IconData`
  <i class='cupertino-icons md-36'>&#xf555;</i> &#x2014; Cupertino icon named "arrowshape_turn_up_left_fill". Available on cupertino_icons package 1.0.0+ only.

- **arrowshape_turn_up_right**: `IconData`
  <i class='cupertino-icons md-36'>&#xf556;</i> &#x2014; Cupertino icon named "arrowshape_turn_up_right". Available on cupertino_icons package 1.0.0+ only.

- **arrowshape_turn_up_right_circle**: `IconData`
  <i class='cupertino-icons md-36'>&#xf557;</i> &#x2014; Cupertino icon named "arrowshape_turn_up_right_circle". Available on cupertino_icons package 1.0.0+ only.

- **arrowshape_turn_up_right_circle_fill**: `IconData`
  <i class='cupertino-icons md-36'>&#xf558;</i> &#x2014; Cupertino icon named "arrowshape_turn_up_right_circle_fill". Available on cupertino_icons package 1.0.0+ only.

- **arrowshape_turn_up_right_fill**: `IconData`
  <i class='cupertino-icons md-36'>&#xf559;</i> &#x2014; Cupertino icon named "arrowshape_turn_up_right_fill". Available on cupertino_icons package 1.0.0+ only.

- **arrowtriangle_down**: `IconData`
  <i class='cupertino-icons md-36'>&#xf55a;</i> &#x2014; Cupertino icon named "arrowtriangle_down". Available on cupertino_icons package 1.0.0+ only.

- **arrowtriangle_down_circle**: `IconData`
  <i class='cupertino-icons md-36'>&#xf55b;</i> &#x2014; Cupertino icon named "arrowtriangle_down_circle". Available on cupertino_icons package 1.0.0+ only.

- **arrowtriangle_down_circle_fill**: `IconData`
  <i class='cupertino-icons md-36'>&#xf55c;</i> &#x2014; Cupertino icon named "arrowtriangle_down_circle_fill". Available on cupertino_icons package 1.0.0+ only.

- **arrowtriangle_down_fill**: `IconData`
  <i class='cupertino-icons md-36'>&#xf55d;</i> &#x2014; Cupertino icon named "arrowtriangle_down_fill". Available on cupertino_icons package 1.0.0+ only.

- **arrowtriangle_down_square**: `IconData`
  <i class='cupertino-icons md-36'>&#xf55e;</i> &#x2014; Cupertino icon named "arrowtriangle_down_square". Available on cupertino_icons package 1.0.0+ only.

- **arrowtriangle_down_square_fill**: `IconData`
  <i class='cupertino-icons md-36'>&#xf55f;</i> &#x2014; Cupertino icon named "arrowtriangle_down_square_fill". Available on cupertino_icons package 1.0.0+ only.

- **arrowtriangle_left**: `IconData`
  <i class='cupertino-icons md-36'>&#xf560;</i> &#x2014; Cupertino icon named "arrowtriangle_left". Available on cupertino_icons package 1.0.0+ only.

- **arrowtriangle_left_circle**: `IconData`
  <i class='cupertino-icons md-36'>&#xf561;</i> &#x2014; Cupertino icon named "arrowtriangle_left_circle". Available on cupertino_icons package 1.0.0+ only.

- **arrowtriangle_left_circle_fill**: `IconData`
  <i class='cupertino-icons md-36'>&#xf562;</i> &#x2014; Cupertino icon named "arrowtriangle_left_circle_fill". Available on cupertino_icons package 1.0.0+ only.

- **arrowtriangle_left_fill**: `IconData`
  <i class='cupertino-icons md-36'>&#xf563;</i> &#x2014; Cupertino icon named "arrowtriangle_left_fill". Available on cupertino_icons package 1.0.0+ only.

- **arrowtriangle_left_square**: `IconData`
  <i class='cupertino-icons md-36'>&#xf564;</i> &#x2014; Cupertino icon named "arrowtriangle_left_square". Available on cupertino_icons package 1.0.0+ only.

- **arrowtriangle_left_square_fill**: `IconData`
  <i class='cupertino-icons md-36'>&#xf565;</i> &#x2014; Cupertino icon named "arrowtriangle_left_square_fill". Available on cupertino_icons package 1.0.0+ only.

- **arrowtriangle_right**: `IconData`
  <i class='cupertino-icons md-36'>&#xf566;</i> &#x2014; Cupertino icon named "arrowtriangle_right". Available on cupertino_icons package 1.0.0+ only.

- **arrowtriangle_right_circle**: `IconData`
  <i class='cupertino-icons md-36'>&#xf567;</i> &#x2014; Cupertino icon named "arrowtriangle_right_circle". Available on cupertino_icons package 1.0.0+ only.

- **arrowtriangle_right_circle_fill**: `IconData`
  <i class='cupertino-icons md-36'>&#xf568;</i> &#x2014; Cupertino icon named "arrowtriangle_right_circle_fill". Available on cupertino_icons package 1.0.0+ only.

- **arrowtriangle_right_fill**: `IconData`
  <i class='cupertino-icons md-36'>&#xf569;</i> &#x2014; Cupertino icon named "arrowtriangle_right_fill". Available on cupertino_icons package 1.0.0+ only.

- **arrowtriangle_right_square**: `IconData`
  <i class='cupertino-icons md-36'>&#xf56a;</i> &#x2014; Cupertino icon named "arrowtriangle_right_square". Available on cupertino_icons package 1.0.0+ only.

- **arrowtriangle_right_square_fill**: `IconData`
  <i class='cupertino-icons md-36'>&#xf56b;</i> &#x2014; Cupertino icon named "arrowtriangle_right_square_fill". Available on cupertino_icons package 1.0.0+ only.

- **arrowtriangle_up**: `IconData`
  <i class='cupertino-icons md-36'>&#xf56c;</i> &#x2014; Cupertino icon named "arrowtriangle_up". Available on cupertino_icons package 1.0.0+ only.

- **arrowtriangle_up_circle**: `IconData`
  <i class='cupertino-icons md-36'>&#xf56d;</i> &#x2014; Cupertino icon named "arrowtriangle_up_circle". Available on cupertino_icons package 1.0.0+ only.

- **arrowtriangle_up_circle_fill**: `IconData`
  <i class='cupertino-icons md-36'>&#xf56e;</i> &#x2014; Cupertino icon named "arrowtriangle_up_circle_fill". Available on cupertino_icons package 1.0.0+ only.

- **arrowtriangle_up_fill**: `IconData`
  <i class='cupertino-icons md-36'>&#xf56f;</i> &#x2014; Cupertino icon named "arrowtriangle_up_fill". Available on cupertino_icons package 1.0.0+ only.

- **arrowtriangle_up_square**: `IconData`
  <i class='cupertino-icons md-36'>&#xf570;</i> &#x2014; Cupertino icon named "arrowtriangle_up_square". Available on cupertino_icons package 1.0.0+ only.

- **arrowtriangle_up_square_fill**: `IconData`
  <i class='cupertino-icons md-36'>&#xf571;</i> &#x2014; Cupertino icon named "arrowtriangle_up_square_fill". Available on cupertino_icons package 1.0.0+ only.

- **asterisk_circle**: `IconData`
  <i class='cupertino-icons md-36'>&#xf572;</i> &#x2014; Cupertino icon named "asterisk_circle". Available on cupertino_icons package 1.0.0+ only.

- **asterisk_circle_fill**: `IconData`
  <i class='cupertino-icons md-36'>&#xf573;</i> &#x2014; Cupertino icon named "asterisk_circle_fill". Available on cupertino_icons package 1.0.0+ only.

- **at**: `IconData`
  <i class='cupertino-icons md-36'>&#xf574;</i> &#x2014; Cupertino icon named "at". Available on cupertino_icons package 1.0.0+ only.

- **at_badge_minus**: `IconData`
  <i class='cupertino-icons md-36'>&#xf575;</i> &#x2014; Cupertino icon named "at_badge_minus". Available on cupertino_icons package 1.0.0+ only.

- **at_badge_plus**: `IconData`
  <i class='cupertino-icons md-36'>&#xf576;</i> &#x2014; Cupertino icon named "at_badge_plus". Available on cupertino_icons package 1.0.0+ only.

- **at_circle**: `IconData`
  <i class='cupertino-icons md-36'>&#xf8af;</i> &#x2014; Cupertino icon named "at_circle". Available on cupertino_icons package 1.0.0+ only.

- **at_circle_fill**: `IconData`
  <i class='cupertino-icons md-36'>&#xf8b0;</i> &#x2014; Cupertino icon named "at_circle_fill". Available on cupertino_icons package 1.0.0+ only.

- **backward**: `IconData`
  <i class='cupertino-icons md-36'>&#xf577;</i> &#x2014; Cupertino icon named "backward". Available on cupertino_icons package 1.0.0+ only.

- **backward_end**: `IconData`
  <i class='cupertino-icons md-36'>&#xf578;</i> &#x2014; Cupertino icon named "backward_end". Available on cupertino_icons package 1.0.0+ only.

- **backward_end_alt**: `IconData`
  <i class='cupertino-icons md-36'>&#xf579;</i> &#x2014; Cupertino icon named "backward_end_alt". Available on cupertino_icons package 1.0.0+ only.

- **backward_end_alt_fill**: `IconData`
  <i class='cupertino-icons md-36'>&#xf57a;</i> &#x2014; Cupertino icon named "backward_end_alt_fill". Available on cupertino_icons package 1.0.0+ only.

- **backward_end_fill**: `IconData`
  <i class='cupertino-icons md-36'>&#xf57b;</i> &#x2014; Cupertino icon named "backward_end_fill". Available on cupertino_icons package 1.0.0+ only.

- **backward_fill**: `IconData`
  <i class='cupertino-icons md-36'>&#xf57c;</i> &#x2014; Cupertino icon named "backward_fill". Available on cupertino_icons package 1.0.0+ only.

- **badge_plus_radiowaves_right**: `IconData`
  <i class='cupertino-icons md-36'>&#xf57d;</i> &#x2014; Cupertino icon named "badge_plus_radiowaves_right". Available on cupertino_icons package 1.0.0+ only.

- **bag**: `IconData`
  <i class='cupertino-icons md-36'>&#xf57e;</i> &#x2014; Cupertino icon named "bag". Available on cupertino_icons package 1.0.0+ only.

- **bag_badge_minus**: `IconData`
  <i class='cupertino-icons md-36'>&#xf57f;</i> &#x2014; Cupertino icon named "bag_badge_minus". Available on cupertino_icons package 1.0.0+ only.

- **bag_badge_plus**: `IconData`
  <i class='cupertino-icons md-36'>&#xf580;</i> &#x2014; Cupertino icon named "bag_badge_plus". Available on cupertino_icons package 1.0.0+ only.

- **bag_fill**: `IconData`
  <i class='cupertino-icons md-36'>&#xf581;</i> &#x2014; Cupertino icon named "bag_fill". Available on cupertino_icons package 1.0.0+ only.

- **bag_fill_badge_minus**: `IconData`
  <i class='cupertino-icons md-36'>&#xf582;</i> &#x2014; Cupertino icon named "bag_fill_badge_minus". Available on cupertino_icons package 1.0.0+ only.

- **bag_fill_badge_plus**: `IconData`
  <i class='cupertino-icons md-36'>&#xf583;</i> &#x2014; Cupertino icon named "bag_fill_badge_plus". Available on cupertino_icons package 1.0.0+ only.

- **bandage**: `IconData`
  <i class='cupertino-icons md-36'>&#xf584;</i> &#x2014; Cupertino icon named "bandage". Available on cupertino_icons package 1.0.0+ only.

- **bandage_fill**: `IconData`
  <i class='cupertino-icons md-36'>&#xf585;</i> &#x2014; Cupertino icon named "bandage_fill". Available on cupertino_icons package 1.0.0+ only.

- **barcode**: `IconData`
  <i class='cupertino-icons md-36'>&#xf586;</i> &#x2014; Cupertino icon named "barcode". Available on cupertino_icons package 1.0.0+ only.

- **barcode_viewfinder**: `IconData`
  <i class='cupertino-icons md-36'>&#xf587;</i> &#x2014; Cupertino icon named "barcode_viewfinder". Available on cupertino_icons package 1.0.0+ only.

- **bars**: `IconData`
  <i class='cupertino-icons md-36'>&#xf8b1;</i> &#x2014; Cupertino icon named "bars". Available on cupertino_icons package 1.0.0+ only.

- **battery_0**: `IconData`
  <i class='cupertino-icons md-36'>&#xf112;</i> &#x2014; Cupertino icon named "battery_0". Available on cupertino_icons package 1.0.0+ only.
 This is the same icon as [battery_empty] which is available in cupertino_icons 0.1.3.

- **battery_100**: `IconData`
  <i class='cupertino-icons md-36'>&#xf113;</i> &#x2014; Cupertino icon named "battery_100". Available on cupertino_icons package 1.0.0+ only.
 This is the same icon as [battery_charging] which is available in cupertino_icons 0.1.3.
 This is the same icon as [battery_full] which is available in cupertino_icons 0.1.3.
 This is the same icon as [battery_75_percent] which is available in cupertino_icons 0.1.3.

- **battery_25**: `IconData`
  <i class='cupertino-icons md-36'>&#xf115;</i> &#x2014; Cupertino icon named "battery_25". Available on cupertino_icons package 1.0.0+ only.
 This is the same icon as [battery_25_percent] which is available in cupertino_icons 0.1.3.

- **bed_double**: `IconData`
  <i class='cupertino-icons md-36'>&#xf588;</i> &#x2014; Cupertino icon named "bed_double". Available on cupertino_icons package 1.0.0+ only.

- **bed_double_fill**: `IconData`
  <i class='cupertino-icons md-36'>&#xf589;</i> &#x2014; Cupertino icon named "bed_double_fill". Available on cupertino_icons package 1.0.0+ only.

- **bell_circle**: `IconData`
  <i class='cupertino-icons md-36'>&#xf58a;</i> &#x2014; Cupertino icon named "bell_circle". Available on cupertino_icons package 1.0.0+ only.

- **bell_circle_fill**: `IconData`
  <i class='cupertino-icons md-36'>&#xf58b;</i> &#x2014; Cupertino icon named "bell_circle_fill". Available on cupertino_icons package 1.0.0+ only.

- **bell_fill**: `IconData`
  <i class='cupertino-icons md-36'>&#xf3e2;</i> &#x2014; Cupertino icon named "bell_fill". Available on cupertino_icons package 1.0.0+ only.
 This is the same icon as [bell_solid] which is available in cupertino_icons 0.1.3.

- **bell_slash**: `IconData`
  <i class='cupertino-icons md-36'>&#xf58c;</i> &#x2014; Cupertino icon named "bell_slash". Available on cupertino_icons package 1.0.0+ only.

- **bell_slash_fill**: `IconData`
  <i class='cupertino-icons md-36'>&#xf58d;</i> &#x2014; Cupertino icon named "bell_slash_fill". Available on cupertino_icons package 1.0.0+ only.

- **bin_xmark**: `IconData`
  <i class='cupertino-icons md-36'>&#xf58e;</i> &#x2014; Cupertino icon named "bin_xmark". Available on cupertino_icons package 1.0.0+ only.

- **bin_xmark_fill**: `IconData`
  <i class='cupertino-icons md-36'>&#xf58f;</i> &#x2014; Cupertino icon named "bin_xmark_fill". Available on cupertino_icons package 1.0.0+ only.

- **bitcoin**: `IconData`
  <i class='cupertino-icons md-36'>&#xf8b2;</i> &#x2014; Cupertino icon named "bitcoin". Available on cupertino_icons package 1.0.0+ only.

- **bitcoin_circle**: `IconData`
  <i class='cupertino-icons md-36'>&#xf8b3;</i> &#x2014; Cupertino icon named "bitcoin_circle". Available on cupertino_icons package 1.0.0+ only.

- **bitcoin_circle_fill**: `IconData`
  <i class='cupertino-icons md-36'>&#xf8b4;</i> &#x2014; Cupertino icon named "bitcoin_circle_fill". Available on cupertino_icons package 1.0.0+ only.

- **bold**: `IconData`
  <i class='cupertino-icons md-36'>&#xf590;</i> &#x2014; Cupertino icon named "bold". Available on cupertino_icons package 1.0.0+ only.

- **bold_italic_underline**: `IconData`
  <i class='cupertino-icons md-36'>&#xf591;</i> &#x2014; Cupertino icon named "bold_italic_underline". Available on cupertino_icons package 1.0.0+ only.

- **bold_underline**: `IconData`
  <i class='cupertino-icons md-36'>&#xf592;</i> &#x2014; Cupertino icon named "bold_underline". Available on cupertino_icons package 1.0.0+ only.

- **bolt**: `IconData`
  <i class='cupertino-icons md-36'>&#xf593;</i> &#x2014; Cupertino icon named "bolt". Available on cupertino_icons package 1.0.0+ only.

- **bolt_badge_a**: `IconData`
  <i class='cupertino-icons md-36'>&#xf594;</i> &#x2014; Cupertino icon named "bolt_badge_a". Available on cupertino_icons package 1.0.0+ only.

- **bolt_badge_a_fill**: `IconData`
  <i class='cupertino-icons md-36'>&#xf595;</i> &#x2014; Cupertino icon named "bolt_badge_a_fill". Available on cupertino_icons package 1.0.0+ only.

- **bolt_circle**: `IconData`
  <i class='cupertino-icons md-36'>&#xf596;</i> &#x2014; Cupertino icon named "bolt_circle". Available on cupertino_icons package 1.0.0+ only.

- **bolt_circle_fill**: `IconData`
  <i class='cupertino-icons md-36'>&#xf597;</i> &#x2014; Cupertino icon named "bolt_circle_fill". Available on cupertino_icons package 1.0.0+ only.

- **bolt_fill**: `IconData`
  <i class='cupertino-icons md-36'>&#xf598;</i> &#x2014; Cupertino icon named "bolt_fill". Available on cupertino_icons package 1.0.0+ only.

- **bolt_horizontal**: `IconData`
  <i class='cupertino-icons md-36'>&#xf599;</i> &#x2014; Cupertino icon named "bolt_horizontal". Available on cupertino_icons package 1.0.0+ only.

- **bolt_horizontal_circle**: `IconData`
  <i class='cupertino-icons md-36'>&#xf59a;</i> &#x2014; Cupertino icon named "bolt_horizontal_circle". Available on cupertino_icons package 1.0.0+ only.

- **bolt_horizontal_circle_fill**: `IconData`
  <i class='cupertino-icons md-36'>&#xf59b;</i> &#x2014; Cupertino icon named "bolt_horizontal_circle_fill". Available on cupertino_icons package 1.0.0+ only.

- **bolt_horizontal_fill**: `IconData`
  <i class='cupertino-icons md-36'>&#xf59c;</i> &#x2014; Cupertino icon named "bolt_horizontal_fill". Available on cupertino_icons package 1.0.0+ only.

- **bolt_slash**: `IconData`
  <i class='cupertino-icons md-36'>&#xf59d;</i> &#x2014; Cupertino icon named "bolt_slash". Available on cupertino_icons package 1.0.0+ only.

- **bolt_slash_fill**: `IconData`
  <i class='cupertino-icons md-36'>&#xf59e;</i> &#x2014; Cupertino icon named "bolt_slash_fill". Available on cupertino_icons package 1.0.0+ only.

- **book_circle**: `IconData`
  <i class='cupertino-icons md-36'>&#xf59f;</i> &#x2014; Cupertino icon named "book_circle". Available on cupertino_icons package 1.0.0+ only.

- **book_circle_fill**: `IconData`
  <i class='cupertino-icons md-36'>&#xf5a0;</i> &#x2014; Cupertino icon named "book_circle_fill". Available on cupertino_icons package 1.0.0+ only.

- **book_fill**: `IconData`
  <i class='cupertino-icons md-36'>&#xf3e8;</i> &#x2014; Cupertino icon named "book_fill". Available on cupertino_icons package 1.0.0+ only.
 This is the same icon as [book_solid] which is available in cupertino_icons 0.1.3.

- **bookmark_fill**: `IconData`
  <i class='cupertino-icons md-36'>&#xf3ea;</i> &#x2014; Cupertino icon named "bookmark_fill". Available on cupertino_icons package 1.0.0+ only.
 This is the same icon as [bookmark_solid] which is available in cupertino_icons 0.1.3.

- **briefcase**: `IconData`
  <i class='cupertino-icons md-36'>&#xf5a1;</i> &#x2014; Cupertino icon named "briefcase". Available on cupertino_icons package 1.0.0+ only.

- **briefcase_fill**: `IconData`
  <i class='cupertino-icons md-36'>&#xf5a2;</i> &#x2014; Cupertino icon named "briefcase_fill". Available on cupertino_icons package 1.0.0+ only.

- **bubble_left**: `IconData`
  <i class='cupertino-icons md-36'>&#xf5a3;</i> &#x2014; Cupertino icon named "bubble_left". Available on cupertino_icons package 1.0.0+ only.

- **bubble_left_bubble_right**: `IconData`
  <i class='cupertino-icons md-36'>&#xf5a4;</i> &#x2014; Cupertino icon named "bubble_left_bubble_right". Available on cupertino_icons package 1.0.0+ only.

- **bubble_left_bubble_right_fill**: `IconData`
  <i class='cupertino-icons md-36'>&#xf5a5;</i> &#x2014; Cupertino icon named "bubble_left_bubble_right_fill". Available on cupertino_icons package 1.0.0+ only.

- **bubble_left_fill**: `IconData`
  <i class='cupertino-icons md-36'>&#xf5a6;</i> &#x2014; Cupertino icon named "bubble_left_fill". Available on cupertino_icons package 1.0.0+ only.

- **bubble_middle_bottom**: `IconData`
  <i class='cupertino-icons md-36'>&#xf5a7;</i> &#x2014; Cupertino icon named "bubble_middle_bottom". Available on cupertino_icons package 1.0.0+ only.

- **bubble_middle_bottom_fill**: `IconData`
  <i class='cupertino-icons md-36'>&#xf5a8;</i> &#x2014; Cupertino icon named "bubble_middle_bottom_fill". Available on cupertino_icons package 1.0.0+ only.

- **bubble_middle_top**: `IconData`
  <i class='cupertino-icons md-36'>&#xf5a9;</i> &#x2014; Cupertino icon named "bubble_middle_top". Available on cupertino_icons package 1.0.0+ only.

- **bubble_middle_top_fill**: `IconData`
  <i class='cupertino-icons md-36'>&#xf5aa;</i> &#x2014; Cupertino icon named "bubble_middle_top_fill". Available on cupertino_icons package 1.0.0+ only.

- **bubble_right**: `IconData`
  <i class='cupertino-icons md-36'>&#xf5ab;</i> &#x2014; Cupertino icon named "bubble_right". Available on cupertino_icons package 1.0.0+ only.

- **bubble_right_fill**: `IconData`
  <i class='cupertino-icons md-36'>&#xf5ac;</i> &#x2014; Cupertino icon named "bubble_right_fill". Available on cupertino_icons package 1.0.0+ only.

- **building_2_fill**: `IconData`
  <i class='cupertino-icons md-36'>&#xf8b5;</i> &#x2014; Cupertino icon named "building_2_fill". Available on cupertino_icons package 1.0.0+ only.

- **burn**: `IconData`
  <i class='cupertino-icons md-36'>&#xf5ad;</i> &#x2014; Cupertino icon named "burn". Available on cupertino_icons package 1.0.0+ only.

- **burst**: `IconData`
  <i class='cupertino-icons md-36'>&#xf5ae;</i> &#x2014; Cupertino icon named "burst". Available on cupertino_icons package 1.0.0+ only.

- **burst_fill**: `IconData`
  <i class='cupertino-icons md-36'>&#xf5af;</i> &#x2014; Cupertino icon named "burst_fill". Available on cupertino_icons package 1.0.0+ only.

- **calendar**: `IconData`
  <i class='cupertino-icons md-36'>&#xf5b0;</i> &#x2014; Cupertino icon named "calendar". Available on cupertino_icons package 1.0.0+ only.

- **calendar_badge_minus**: `IconData`
  <i class='cupertino-icons md-36'>&#xf5b1;</i> &#x2014; Cupertino icon named "calendar_badge_minus". Available on cupertino_icons package 1.0.0+ only.

- **calendar_badge_plus**: `IconData`
  <i class='cupertino-icons md-36'>&#xf5b2;</i> &#x2014; Cupertino icon named "calendar_badge_plus". Available on cupertino_icons package 1.0.0+ only.

- **calendar_circle**: `IconData`
  <i class='cupertino-icons md-36'>&#xf5b3;</i> &#x2014; Cupertino icon named "calendar_circle". Available on cupertino_icons package 1.0.0+ only.

- **calendar_circle_fill**: `IconData`
  <i class='cupertino-icons md-36'>&#xf5b4;</i> &#x2014; Cupertino icon named "calendar_circle_fill". Available on cupertino_icons package 1.0.0+ only.

- **calendar_today**: `IconData`
  <i class='cupertino-icons md-36'>&#xf8b6;</i> &#x2014; Cupertino icon named "calendar_today". Available on cupertino_icons package 1.0.0+ only.

- **camera**: `IconData`
  <i class='cupertino-icons md-36'>&#xf3f5;</i> &#x2014; Cupertino icon named "camera". Available on cupertino_icons package 1.0.0+ only.
 This is the same icon as [photo_camera] which is available in cupertino_icons 0.1.3.

- **camera_circle**: `IconData`
  <i class='cupertino-icons md-36'>&#xf5b5;</i> &#x2014; Cupertino icon named "camera_circle". Available on cupertino_icons package 1.0.0+ only.

- **camera_circle_fill**: `IconData`
  <i class='cupertino-icons md-36'>&#xf5b6;</i> &#x2014; Cupertino icon named "camera_circle_fill". Available on cupertino_icons package 1.0.0+ only.

- **camera_fill**: `IconData`
  <i class='cupertino-icons md-36'>&#xf3f6;</i> &#x2014; Cupertino icon named "camera_fill". Available on cupertino_icons package 1.0.0+ only.
 This is the same icon as [photo_camera_solid] which is available in cupertino_icons 0.1.3.

- **camera_on_rectangle**: `IconData`
  <i class='cupertino-icons md-36'>&#xf5b7;</i> &#x2014; Cupertino icon named "camera_on_rectangle". Available on cupertino_icons package 1.0.0+ only.

- **camera_on_rectangle_fill**: `IconData`
  <i class='cupertino-icons md-36'>&#xf5b8;</i> &#x2014; Cupertino icon named "camera_on_rectangle_fill". Available on cupertino_icons package 1.0.0+ only.

- **camera_rotate**: `IconData`
  <i class='cupertino-icons md-36'>&#xf49e;</i> &#x2014; Cupertino icon named "camera_rotate". Available on cupertino_icons package 1.0.0+ only.
 This is the same icon as [switch_camera] which is available in cupertino_icons 0.1.3.

- **camera_rotate_fill**: `IconData`
  <i class='cupertino-icons md-36'>&#xf49f;</i> &#x2014; Cupertino icon named "camera_rotate_fill". Available on cupertino_icons package 1.0.0+ only.
 This is the same icon as [switch_camera_solid] which is available in cupertino_icons 0.1.3.

- **camera_viewfinder**: `IconData`
  <i class='cupertino-icons md-36'>&#xf5b9;</i> &#x2014; Cupertino icon named "camera_viewfinder". Available on cupertino_icons package 1.0.0+ only.

- **capslock**: `IconData`
  <i class='cupertino-icons md-36'>&#xf5ba;</i> &#x2014; Cupertino icon named "capslock". Available on cupertino_icons package 1.0.0+ only.

- **capslock_fill**: `IconData`
  <i class='cupertino-icons md-36'>&#xf5bb;</i> &#x2014; Cupertino icon named "capslock_fill". Available on cupertino_icons package 1.0.0+ only.

- **capsule**: `IconData`
  <i class='cupertino-icons md-36'>&#xf5bc;</i> &#x2014; Cupertino icon named "capsule". Available on cupertino_icons package 1.0.0+ only.

- **capsule_fill**: `IconData`
  <i class='cupertino-icons md-36'>&#xf5bd;</i> &#x2014; Cupertino icon named "capsule_fill". Available on cupertino_icons package 1.0.0+ only.

- **captions_bubble**: `IconData`
  <i class='cupertino-icons md-36'>&#xf5be;</i> &#x2014; Cupertino icon named "captions_bubble". Available on cupertino_icons package 1.0.0+ only.

- **captions_bubble_fill**: `IconData`
  <i class='cupertino-icons md-36'>&#xf5bf;</i> &#x2014; Cupertino icon named "captions_bubble_fill". Available on cupertino_icons package 1.0.0+ only.

- **car_fill**: `IconData`
  <i class='cupertino-icons md-36'>&#xf36f;</i> &#x2014; Cupertino icon named "car_fill". Available on cupertino_icons package 1.0.0+ only.
 This is the same icon as [car] which is available in cupertino_icons 0.1.3.

- **cart**: `IconData`
  <i class='cupertino-icons md-36'>&#xf3f7;</i> &#x2014; Cupertino icon named "cart". Available on cupertino_icons package 1.0.0+ only.
 This is the same icon as [shopping_cart] which is available in cupertino_icons 0.1.3.

- **cart_badge_minus**: `IconData`
  <i class='cupertino-icons md-36'>&#xf5c0;</i> &#x2014; Cupertino icon named "cart_badge_minus". Available on cupertino_icons package 1.0.0+ only.

- **cart_badge_plus**: `IconData`
  <i class='cupertino-icons md-36'>&#xf5c1;</i> &#x2014; Cupertino icon named "cart_badge_plus". Available on cupertino_icons package 1.0.0+ only.

- **cart_fill**: `IconData`
  <i class='cupertino-icons md-36'>&#xf5c2;</i> &#x2014; Cupertino icon named "cart_fill". Available on cupertino_icons package 1.0.0+ only.

- **cart_fill_badge_minus**: `IconData`
  <i class='cupertino-icons md-36'>&#xf5c3;</i> &#x2014; Cupertino icon named "cart_fill_badge_minus". Available on cupertino_icons package 1.0.0+ only.

- **cart_fill_badge_plus**: `IconData`
  <i class='cupertino-icons md-36'>&#xf5c4;</i> &#x2014; Cupertino icon named "cart_fill_badge_plus". Available on cupertino_icons package 1.0.0+ only.

- **chart_bar**: `IconData`
  <i class='cupertino-icons md-36'>&#xf5c5;</i> &#x2014; Cupertino icon named "chart_bar". Available on cupertino_icons package 1.0.0+ only.

- **chart_bar_alt_fill**: `IconData`
  <i class='cupertino-icons md-36'>&#xf8b7;</i> &#x2014; Cupertino icon named "chart_bar_alt_fill". Available on cupertino_icons package 1.0.0+ only.

- **chart_bar_circle**: `IconData`
  <i class='cupertino-icons md-36'>&#xf8b8;</i> &#x2014; Cupertino icon named "chart_bar_circle". Available on cupertino_icons package 1.0.0+ only.

- **chart_bar_circle_fill**: `IconData`
  <i class='cupertino-icons md-36'>&#xf8b9;</i> &#x2014; Cupertino icon named "chart_bar_circle_fill". Available on cupertino_icons package 1.0.0+ only.

- **chart_bar_fill**: `IconData`
  <i class='cupertino-icons md-36'>&#xf5c6;</i> &#x2014; Cupertino icon named "chart_bar_fill". Available on cupertino_icons package 1.0.0+ only.

- **chart_bar_square**: `IconData`
  <i class='cupertino-icons md-36'>&#xf8ba;</i> &#x2014; Cupertino icon named "chart_bar_square". Available on cupertino_icons package 1.0.0+ only.

- **chart_bar_square_fill**: `IconData`
  <i class='cupertino-icons md-36'>&#xf8bb;</i> &#x2014; Cupertino icon named "chart_bar_square_fill". Available on cupertino_icons package 1.0.0+ only.

- **chart_pie**: `IconData`
  <i class='cupertino-icons md-36'>&#xf5c7;</i> &#x2014; Cupertino icon named "chart_pie". Available on cupertino_icons package 1.0.0+ only.

- **chart_pie_fill**: `IconData`
  <i class='cupertino-icons md-36'>&#xf5c8;</i> &#x2014; Cupertino icon named "chart_pie_fill". Available on cupertino_icons package 1.0.0+ only.

- **chat_bubble**: `IconData`
  <i class='cupertino-icons md-36'>&#xf3fb;</i> &#x2014; Cupertino icon named "chat_bubble". Available on cupertino_icons package 1.0.0+ only.
 This is the same icon as [conversation_bubble] which is available in cupertino_icons 0.1.3.

- **chat_bubble_2**: `IconData`
  <i class='cupertino-icons md-36'>&#xf8bc;</i> &#x2014; Cupertino icon named "chat_bubble_2". Available on cupertino_icons package 1.0.0+ only.

- **chat_bubble_2_fill**: `IconData`
  <i class='cupertino-icons md-36'>&#xf8bd;</i> &#x2014; Cupertino icon named "chat_bubble_2_fill". Available on cupertino_icons package 1.0.0+ only.

- **chat_bubble_fill**: `IconData`
  <i class='cupertino-icons md-36'>&#xf8be;</i> &#x2014; Cupertino icon named "chat_bubble_fill". Available on cupertino_icons package 1.0.0+ only.

- **chat_bubble_text**: `IconData`
  <i class='cupertino-icons md-36'>&#xf8bf;</i> &#x2014; Cupertino icon named "chat_bubble_text". Available on cupertino_icons package 1.0.0+ only.

- **chat_bubble_text_fill**: `IconData`
  <i class='cupertino-icons md-36'>&#xf8c0;</i> &#x2014; Cupertino icon named "chat_bubble_text_fill". Available on cupertino_icons package 1.0.0+ only.

- **checkmark**: `IconData`
  <i class='cupertino-icons md-36'>&#xf3fd;</i> &#x2014; Cupertino icon named "checkmark". Available on cupertino_icons package 1.0.0+ only.
 This is the same icon as [check_mark] which is available in cupertino_icons 0.1.3.

- **checkmark_alt**: `IconData`
  <i class='cupertino-icons md-36'>&#xf8c1;</i> &#x2014; Cupertino icon named "checkmark_alt". Available on cupertino_icons package 1.0.0+ only.

- **checkmark_alt_circle**: `IconData`
  <i class='cupertino-icons md-36'>&#xf8c2;</i> &#x2014; Cupertino icon named "checkmark_alt_circle". Available on cupertino_icons package 1.0.0+ only.

- **checkmark_alt_circle_fill**: `IconData`
  <i class='cupertino-icons md-36'>&#xf8c3;</i> &#x2014; Cupertino icon named "checkmark_alt_circle_fill". Available on cupertino_icons package 1.0.0+ only.

- **checkmark_circle**: `IconData`
  <i class='cupertino-icons md-36'>&#xf3fe;</i> &#x2014; Cupertino icon named "checkmark_circle". Available on cupertino_icons package 1.0.0+ only.
 This is the same icon as [check_mark_circled] which is available in cupertino_icons 0.1.3.

- **checkmark_circle_fill**: `IconData`
  <i class='cupertino-icons md-36'>&#xf3ff;</i> &#x2014; Cupertino icon named "checkmark_circle_fill". Available on cupertino_icons package 1.0.0+ only.
 This is the same icon as [check_mark_circled_solid] which is available in cupertino_icons 0.1.3.

- **checkmark_rectangle**: `IconData`
  <i class='cupertino-icons md-36'>&#xf5c9;</i> &#x2014; Cupertino icon named "checkmark_rectangle". Available on cupertino_icons package 1.0.0+ only.

- **checkmark_rectangle_fill**: `IconData`
  <i class='cupertino-icons md-36'>&#xf5ca;</i> &#x2014; Cupertino icon named "checkmark_rectangle_fill". Available on cupertino_icons package 1.0.0+ only.

- **checkmark_seal**: `IconData`
  <i class='cupertino-icons md-36'>&#xf5cb;</i> &#x2014; Cupertino icon named "checkmark_seal". Available on cupertino_icons package 1.0.0+ only.

- **checkmark_seal_fill**: `IconData`
  <i class='cupertino-icons md-36'>&#xf5cc;</i> &#x2014; Cupertino icon named "checkmark_seal_fill". Available on cupertino_icons package 1.0.0+ only.

- **checkmark_shield**: `IconData`
  <i class='cupertino-icons md-36'>&#xf5cd;</i> &#x2014; Cupertino icon named "checkmark_shield". Available on cupertino_icons package 1.0.0+ only.

- **checkmark_shield_fill**: `IconData`
  <i class='cupertino-icons md-36'>&#xf5ce;</i> &#x2014; Cupertino icon named "checkmark_shield_fill". Available on cupertino_icons package 1.0.0+ only.

- **checkmark_square**: `IconData`
  <i class='cupertino-icons md-36'>&#xf5cf;</i> &#x2014; Cupertino icon named "checkmark_square". Available on cupertino_icons package 1.0.0+ only.

- **checkmark_square_fill**: `IconData`
  <i class='cupertino-icons md-36'>&#xf5d0;</i> &#x2014; Cupertino icon named "checkmark_square_fill". Available on cupertino_icons package 1.0.0+ only.

- **chevron_back**: `IconData`
  <i class='cupertino-icons md-36'>&#xf3cf;</i> &#x2014; Cupertino icon named "chevron_back". Available on cupertino_icons package 1.0.0+ only.
 This is the same icon as [back] which is available in cupertino_icons 0.1.3.

- **chevron_compact_down**: `IconData`
  <i class='cupertino-icons md-36'>&#xf5d1;</i> &#x2014; Cupertino icon named "chevron_compact_down". Available on cupertino_icons package 1.0.0+ only.

- **chevron_compact_left**: `IconData`
  <i class='cupertino-icons md-36'>&#xf5d2;</i> &#x2014; Cupertino icon named "chevron_compact_left". Available on cupertino_icons package 1.0.0+ only.

- **chevron_compact_right**: `IconData`
  <i class='cupertino-icons md-36'>&#xf5d3;</i> &#x2014; Cupertino icon named "chevron_compact_right". Available on cupertino_icons package 1.0.0+ only.

- **chevron_compact_up**: `IconData`
  <i class='cupertino-icons md-36'>&#xf5d4;</i> &#x2014; Cupertino icon named "chevron_compact_up". Available on cupertino_icons package 1.0.0+ only.

- **chevron_down**: `IconData`
  <i class='cupertino-icons md-36'>&#xf5d5;</i> &#x2014; Cupertino icon named "chevron_down". Available on cupertino_icons package 1.0.0+ only.

- **chevron_down_circle**: `IconData`
  <i class='cupertino-icons md-36'>&#xf5d6;</i> &#x2014; Cupertino icon named "chevron_down_circle". Available on cupertino_icons package 1.0.0+ only.

- **chevron_down_circle_fill**: `IconData`
  <i class='cupertino-icons md-36'>&#xf5d7;</i> &#x2014; Cupertino icon named "chevron_down_circle_fill". Available on cupertino_icons package 1.0.0+ only.

- **chevron_down_square**: `IconData`
  <i class='cupertino-icons md-36'>&#xf5d8;</i> &#x2014; Cupertino icon named "chevron_down_square". Available on cupertino_icons package 1.0.0+ only.

- **chevron_down_square_fill**: `IconData`
  <i class='cupertino-icons md-36'>&#xf5d9;</i> &#x2014; Cupertino icon named "chevron_down_square_fill". Available on cupertino_icons package 1.0.0+ only.

- **chevron_forward**: `IconData`
  <i class='cupertino-icons md-36'>&#xf3d1;</i> &#x2014; Cupertino icon named "chevron_forward". Available on cupertino_icons package 1.0.0+ only.
 This is the same icon as [forward] which is available in cupertino_icons 0.1.3.

- **chevron_left**: `IconData`
  <i class='cupertino-icons md-36'>&#xf3d2;</i> &#x2014; Cupertino icon named "chevron_left". Available on cupertino_icons package 1.0.0+ only.
 This is the same icon as [left_chevron] which is available in cupertino_icons 0.1.3.

- **chevron_left_2**: `IconData`
  <i class='cupertino-icons md-36'>&#xf5da;</i> &#x2014; Cupertino icon named "chevron_left_2". Available on cupertino_icons package 1.0.0+ only.

- **chevron_left_circle**: `IconData`
  <i class='cupertino-icons md-36'>&#xf5db;</i> &#x2014; Cupertino icon named "chevron_left_circle". Available on cupertino_icons package 1.0.0+ only.

- **chevron_left_circle_fill**: `IconData`
  <i class='cupertino-icons md-36'>&#xf5dc;</i> &#x2014; Cupertino icon named "chevron_left_circle_fill". Available on cupertino_icons package 1.0.0+ only.

- **chevron_left_slash_chevron_right**: `IconData`
  <i class='cupertino-icons md-36'>&#xf5dd;</i> &#x2014; Cupertino icon named "chevron_left_slash_chevron_right". Available on cupertino_icons package 1.0.0+ only.

- **chevron_left_square**: `IconData`
  <i class='cupertino-icons md-36'>&#xf5de;</i> &#x2014; Cupertino icon named "chevron_left_square". Available on cupertino_icons package 1.0.0+ only.

- **chevron_left_square_fill**: `IconData`
  <i class='cupertino-icons md-36'>&#xf5df;</i> &#x2014; Cupertino icon named "chevron_left_square_fill". Available on cupertino_icons package 1.0.0+ only.

- **chevron_right**: `IconData`
  <i class='cupertino-icons md-36'>&#xf3d3;</i> &#x2014; Cupertino icon named "chevron_right". Available on cupertino_icons package 1.0.0+ only.
 This is the same icon as [right_chevron] which is available in cupertino_icons 0.1.3.

- **chevron_right_2**: `IconData`
  <i class='cupertino-icons md-36'>&#xf5e0;</i> &#x2014; Cupertino icon named "chevron_right_2". Available on cupertino_icons package 1.0.0+ only.

- **chevron_right_circle**: `IconData`
  <i class='cupertino-icons md-36'>&#xf5e1;</i> &#x2014; Cupertino icon named "chevron_right_circle". Available on cupertino_icons package 1.0.0+ only.

- **chevron_right_circle_fill**: `IconData`
  <i class='cupertino-icons md-36'>&#xf5e2;</i> &#x2014; Cupertino icon named "chevron_right_circle_fill". Available on cupertino_icons package 1.0.0+ only.

- **chevron_right_square**: `IconData`
  <i class='cupertino-icons md-36'>&#xf5e3;</i> &#x2014; Cupertino icon named "chevron_right_square". Available on cupertino_icons package 1.0.0+ only.

- **chevron_right_square_fill**: `IconData`
  <i class='cupertino-icons md-36'>&#xf5e4;</i> &#x2014; Cupertino icon named "chevron_right_square_fill". Available on cupertino_icons package 1.0.0+ only.

- **chevron_up**: `IconData`
  <i class='cupertino-icons md-36'>&#xf5e5;</i> &#x2014; Cupertino icon named "chevron_up". Available on cupertino_icons package 1.0.0+ only.

- **chevron_up_chevron_down**: `IconData`
  <i class='cupertino-icons md-36'>&#xf5e6;</i> &#x2014; Cupertino icon named "chevron_up_chevron_down". Available on cupertino_icons package 1.0.0+ only.

- **chevron_up_circle**: `IconData`
  <i class='cupertino-icons md-36'>&#xf5e7;</i> &#x2014; Cupertino icon named "chevron_up_circle". Available on cupertino_icons package 1.0.0+ only.

- **chevron_up_circle_fill**: `IconData`
  <i class='cupertino-icons md-36'>&#xf5e8;</i> &#x2014; Cupertino icon named "chevron_up_circle_fill". Available on cupertino_icons package 1.0.0+ only.

- **chevron_up_square**: `IconData`
  <i class='cupertino-icons md-36'>&#xf5e9;</i> &#x2014; Cupertino icon named "chevron_up_square". Available on cupertino_icons package 1.0.0+ only.

- **chevron_up_square_fill**: `IconData`
  <i class='cupertino-icons md-36'>&#xf5ea;</i> &#x2014; Cupertino icon named "chevron_up_square_fill". Available on cupertino_icons package 1.0.0+ only.

- **circle_bottomthird_split**: `IconData`
  <i class='cupertino-icons md-36'>&#xf5eb;</i> &#x2014; Cupertino icon named "circle_bottomthird_split". Available on cupertino_icons package 1.0.0+ only.

- **circle_fill**: `IconData`
  <i class='cupertino-icons md-36'>&#xf400;</i> &#x2014; Cupertino icon named "circle_fill". Available on cupertino_icons package 1.0.0+ only.
 This is the same icon as [circle_filled] which is available in cupertino_icons 0.1.3.

- **circle_grid_3x3**: `IconData`
  <i class='cupertino-icons md-36'>&#xf5ec;</i> &#x2014; Cupertino icon named "circle_grid_3x3". Available on cupertino_icons package 1.0.0+ only.

- **circle_grid_3x3_fill**: `IconData`
  <i class='cupertino-icons md-36'>&#xf5ed;</i> &#x2014; Cupertino icon named "circle_grid_3x3_fill". Available on cupertino_icons package 1.0.0+ only.

- **circle_grid_hex**: `IconData`
  <i class='cupertino-icons md-36'>&#xf5ee;</i> &#x2014; Cupertino icon named "circle_grid_hex". Available on cupertino_icons package 1.0.0+ only.

- **circle_grid_hex_fill**: `IconData`
  <i class='cupertino-icons md-36'>&#xf5ef;</i> &#x2014; Cupertino icon named "circle_grid_hex_fill". Available on cupertino_icons package 1.0.0+ only.

- **circle_lefthalf_fill**: `IconData`
  <i class='cupertino-icons md-36'>&#xf5f0;</i> &#x2014; Cupertino icon named "circle_lefthalf_fill". Available on cupertino_icons package 1.0.0+ only.

- **circle_righthalf_fill**: `IconData`
  <i class='cupertino-icons md-36'>&#xf5f1;</i> &#x2014; Cupertino icon named "circle_righthalf_fill". Available on cupertino_icons package 1.0.0+ only.

- **clear_fill**: `IconData`
  <i class='cupertino-icons md-36'>&#xf5f3;</i> &#x2014; Cupertino icon named "clear_fill". Available on cupertino_icons package 1.0.0+ only.

- **clock_fill**: `IconData`
  <i class='cupertino-icons md-36'>&#xf403;</i> &#x2014; Cupertino icon named "clock_fill". Available on cupertino_icons package 1.0.0+ only.
 This is the same icon as [clock_solid] which is available in cupertino_icons 0.1.3.
 This is the same icon as [time_solid] which is available in cupertino_icons 0.1.3.

- **cloud**: `IconData`
  <i class='cupertino-icons md-36'>&#xf5f4;</i> &#x2014; Cupertino icon named "cloud". Available on cupertino_icons package 1.0.0+ only.

- **cloud_bolt**: `IconData`
  <i class='cupertino-icons md-36'>&#xf5f5;</i> &#x2014; Cupertino icon named "cloud_bolt". Available on cupertino_icons package 1.0.0+ only.

- **cloud_bolt_fill**: `IconData`
  <i class='cupertino-icons md-36'>&#xf5f6;</i> &#x2014; Cupertino icon named "cloud_bolt_fill". Available on cupertino_icons package 1.0.0+ only.

- **cloud_bolt_rain**: `IconData`
  <i class='cupertino-icons md-36'>&#xf5f7;</i> &#x2014; Cupertino icon named "cloud_bolt_rain". Available on cupertino_icons package 1.0.0+ only.

- **cloud_bolt_rain_fill**: `IconData`
  <i class='cupertino-icons md-36'>&#xf5f8;</i> &#x2014; Cupertino icon named "cloud_bolt_rain_fill". Available on cupertino_icons package 1.0.0+ only.

- **cloud_download**: `IconData`
  <i class='cupertino-icons md-36'>&#xf8c4;</i> &#x2014; Cupertino icon named "cloud_download". Available on cupertino_icons package 1.0.0+ only.

- **cloud_download_fill**: `IconData`
  <i class='cupertino-icons md-36'>&#xf8c5;</i> &#x2014; Cupertino icon named "cloud_download_fill". Available on cupertino_icons package 1.0.0+ only.

- **cloud_drizzle**: `IconData`
  <i class='cupertino-icons md-36'>&#xf5f9;</i> &#x2014; Cupertino icon named "cloud_drizzle". Available on cupertino_icons package 1.0.0+ only.

- **cloud_drizzle_fill**: `IconData`
  <i class='cupertino-icons md-36'>&#xf5fa;</i> &#x2014; Cupertino icon named "cloud_drizzle_fill". Available on cupertino_icons package 1.0.0+ only.

- **cloud_fill**: `IconData`
  <i class='cupertino-icons md-36'>&#xf5fb;</i> &#x2014; Cupertino icon named "cloud_fill". Available on cupertino_icons package 1.0.0+ only.

- **cloud_fog**: `IconData`
  <i class='cupertino-icons md-36'>&#xf5fc;</i> &#x2014; Cupertino icon named "cloud_fog". Available on cupertino_icons package 1.0.0+ only.

- **cloud_fog_fill**: `IconData`
  <i class='cupertino-icons md-36'>&#xf5fd;</i> &#x2014; Cupertino icon named "cloud_fog_fill". Available on cupertino_icons package 1.0.0+ only.

- **cloud_hail**: `IconData`
  <i class='cupertino-icons md-36'>&#xf5fe;</i> &#x2014; Cupertino icon named "cloud_hail". Available on cupertino_icons package 1.0.0+ only.

- **cloud_hail_fill**: `IconData`
  <i class='cupertino-icons md-36'>&#xf5ff;</i> &#x2014; Cupertino icon named "cloud_hail_fill". Available on cupertino_icons package 1.0.0+ only.

- **cloud_heavyrain**: `IconData`
  <i class='cupertino-icons md-36'>&#xf600;</i> &#x2014; Cupertino icon named "cloud_heavyrain". Available on cupertino_icons package 1.0.0+ only.

- **cloud_heavyrain_fill**: `IconData`
  <i class='cupertino-icons md-36'>&#xf601;</i> &#x2014; Cupertino icon named "cloud_heavyrain_fill". Available on cupertino_icons package 1.0.0+ only.

- **cloud_moon**: `IconData`
  <i class='cupertino-icons md-36'>&#xf602;</i> &#x2014; Cupertino icon named "cloud_moon". Available on cupertino_icons package 1.0.0+ only.

- **cloud_moon_bolt**: `IconData`
  <i class='cupertino-icons md-36'>&#xf603;</i> &#x2014; Cupertino icon named "cloud_moon_bolt". Available on cupertino_icons package 1.0.0+ only.

- **cloud_moon_bolt_fill**: `IconData`
  <i class='cupertino-icons md-36'>&#xf604;</i> &#x2014; Cupertino icon named "cloud_moon_bolt_fill". Available on cupertino_icons package 1.0.0+ only.

- **cloud_moon_fill**: `IconData`
  <i class='cupertino-icons md-36'>&#xf605;</i> &#x2014; Cupertino icon named "cloud_moon_fill". Available on cupertino_icons package 1.0.0+ only.

- **cloud_moon_rain**: `IconData`
  <i class='cupertino-icons md-36'>&#xf606;</i> &#x2014; Cupertino icon named "cloud_moon_rain". Available on cupertino_icons package 1.0.0+ only.

- **cloud_moon_rain_fill**: `IconData`
  <i class='cupertino-icons md-36'>&#xf607;</i> &#x2014; Cupertino icon named "cloud_moon_rain_fill". Available on cupertino_icons package 1.0.0+ only.

- **cloud_rain**: `IconData`
  <i class='cupertino-icons md-36'>&#xf608;</i> &#x2014; Cupertino icon named "cloud_rain". Available on cupertino_icons package 1.0.0+ only.

- **cloud_rain_fill**: `IconData`
  <i class='cupertino-icons md-36'>&#xf609;</i> &#x2014; Cupertino icon named "cloud_rain_fill". Available on cupertino_icons package 1.0.0+ only.

- **cloud_sleet**: `IconData`
  <i class='cupertino-icons md-36'>&#xf60a;</i> &#x2014; Cupertino icon named "cloud_sleet". Available on cupertino_icons package 1.0.0+ only.

- **cloud_sleet_fill**: `IconData`
  <i class='cupertino-icons md-36'>&#xf60b;</i> &#x2014; Cupertino icon named "cloud_sleet_fill". Available on cupertino_icons package 1.0.0+ only.

- **cloud_snow**: `IconData`
  <i class='cupertino-icons md-36'>&#xf60c;</i> &#x2014; Cupertino icon named "cloud_snow". Available on cupertino_icons package 1.0.0+ only.

- **cloud_snow_fill**: `IconData`
  <i class='cupertino-icons md-36'>&#xf60d;</i> &#x2014; Cupertino icon named "cloud_snow_fill". Available on cupertino_icons package 1.0.0+ only.

- **cloud_sun**: `IconData`
  <i class='cupertino-icons md-36'>&#xf60e;</i> &#x2014; Cupertino icon named "cloud_sun". Available on cupertino_icons package 1.0.0+ only.

- **cloud_sun_bolt**: `IconData`
  <i class='cupertino-icons md-36'>&#xf60f;</i> &#x2014; Cupertino icon named "cloud_sun_bolt". Available on cupertino_icons package 1.0.0+ only.

- **cloud_sun_bolt_fill**: `IconData`
  <i class='cupertino-icons md-36'>&#xf610;</i> &#x2014; Cupertino icon named "cloud_sun_bolt_fill". Available on cupertino_icons package 1.0.0+ only.

- **cloud_sun_fill**: `IconData`
  <i class='cupertino-icons md-36'>&#xf611;</i> &#x2014; Cupertino icon named "cloud_sun_fill". Available on cupertino_icons package 1.0.0+ only.

- **cloud_sun_rain**: `IconData`
  <i class='cupertino-icons md-36'>&#xf612;</i> &#x2014; Cupertino icon named "cloud_sun_rain". Available on cupertino_icons package 1.0.0+ only.

- **cloud_sun_rain_fill**: `IconData`
  <i class='cupertino-icons md-36'>&#xf613;</i> &#x2014; Cupertino icon named "cloud_sun_rain_fill". Available on cupertino_icons package 1.0.0+ only.

- **cloud_upload**: `IconData`
  <i class='cupertino-icons md-36'>&#xf8c6;</i> &#x2014; Cupertino icon named "cloud_upload". Available on cupertino_icons package 1.0.0+ only.

- **cloud_upload_fill**: `IconData`
  <i class='cupertino-icons md-36'>&#xf8c7;</i> &#x2014; Cupertino icon named "cloud_upload_fill". Available on cupertino_icons package 1.0.0+ only.

- **color_filter**: `IconData`
  <i class='cupertino-icons md-36'>&#xf8c8;</i> &#x2014; Cupertino icon named "color_filter". Available on cupertino_icons package 1.0.0+ only.

- **color_filter_fill**: `IconData`
  <i class='cupertino-icons md-36'>&#xf8c9;</i> &#x2014; Cupertino icon named "color_filter_fill". Available on cupertino_icons package 1.0.0+ only.

- **command**: `IconData`
  <i class='cupertino-icons md-36'>&#xf614;</i> &#x2014; Cupertino icon named "command". Available on cupertino_icons package 1.0.0+ only.

- **compass**: `IconData`
  <i class='cupertino-icons md-36'>&#xf8ca;</i> &#x2014; Cupertino icon named "compass". Available on cupertino_icons package 1.0.0+ only.

- **compass_fill**: `IconData`
  <i class='cupertino-icons md-36'>&#xf8cb;</i> &#x2014; Cupertino icon named "compass_fill". Available on cupertino_icons package 1.0.0+ only.

- **control**: `IconData`
  <i class='cupertino-icons md-36'>&#xf615;</i> &#x2014; Cupertino icon named "control". Available on cupertino_icons package 1.0.0+ only.

- **creditcard**: `IconData`
  <i class='cupertino-icons md-36'>&#xf616;</i> &#x2014; Cupertino icon named "creditcard". Available on cupertino_icons package 1.0.0+ only.

- **creditcard_fill**: `IconData`
  <i class='cupertino-icons md-36'>&#xf617;</i> &#x2014; Cupertino icon named "creditcard_fill". Available on cupertino_icons package 1.0.0+ only.

- **crop**: `IconData`
  <i class='cupertino-icons md-36'>&#xf618;</i> &#x2014; Cupertino icon named "crop". Available on cupertino_icons package 1.0.0+ only.

- **crop_rotate**: `IconData`
  <i class='cupertino-icons md-36'>&#xf619;</i> &#x2014; Cupertino icon named "crop_rotate". Available on cupertino_icons package 1.0.0+ only.

- **cube**: `IconData`
  <i class='cupertino-icons md-36'>&#xf61a;</i> &#x2014; Cupertino icon named "cube". Available on cupertino_icons package 1.0.0+ only.

- **cube_box**: `IconData`
  <i class='cupertino-icons md-36'>&#xf61b;</i> &#x2014; Cupertino icon named "cube_box". Available on cupertino_icons package 1.0.0+ only.

- **cube_box_fill**: `IconData`
  <i class='cupertino-icons md-36'>&#xf61c;</i> &#x2014; Cupertino icon named "cube_box_fill". Available on cupertino_icons package 1.0.0+ only.

- **cube_fill**: `IconData`
  <i class='cupertino-icons md-36'>&#xf61d;</i> &#x2014; Cupertino icon named "cube_fill". Available on cupertino_icons package 1.0.0+ only.

- **cursor_rays**: `IconData`
  <i class='cupertino-icons md-36'>&#xf61e;</i> &#x2014; Cupertino icon named "cursor_rays". Available on cupertino_icons package 1.0.0+ only.

- **decrease_indent**: `IconData`
  <i class='cupertino-icons md-36'>&#xf61f;</i> &#x2014; Cupertino icon named "decrease_indent". Available on cupertino_icons package 1.0.0+ only.

- **decrease_quotelevel**: `IconData`
  <i class='cupertino-icons md-36'>&#xf620;</i> &#x2014; Cupertino icon named "decrease_quotelevel". Available on cupertino_icons package 1.0.0+ only.

- **delete_left**: `IconData`
  <i class='cupertino-icons md-36'>&#xf621;</i> &#x2014; Cupertino icon named "delete_left". Available on cupertino_icons package 1.0.0+ only.

- **delete_left_fill**: `IconData`
  <i class='cupertino-icons md-36'>&#xf622;</i> &#x2014; Cupertino icon named "delete_left_fill". Available on cupertino_icons package 1.0.0+ only.

- **delete_right**: `IconData`
  <i class='cupertino-icons md-36'>&#xf623;</i> &#x2014; Cupertino icon named "delete_right". Available on cupertino_icons package 1.0.0+ only.

- **delete_right_fill**: `IconData`
  <i class='cupertino-icons md-36'>&#xf624;</i> &#x2014; Cupertino icon named "delete_right_fill". Available on cupertino_icons package 1.0.0+ only.

- **desktopcomputer**: `IconData`
  <i class='cupertino-icons md-36'>&#xf625;</i> &#x2014; Cupertino icon named "desktopcomputer". Available on cupertino_icons package 1.0.0+ only.

- **device_desktop**: `IconData`
  <i class='cupertino-icons md-36'>&#xf8cc;</i> &#x2014; Cupertino icon named "device_desktop". Available on cupertino_icons package 1.0.0+ only.

- **device_laptop**: `IconData`
  <i class='cupertino-icons md-36'>&#xf8cd;</i> &#x2014; Cupertino icon named "device_laptop". Available on cupertino_icons package 1.0.0+ only.

- **device_phone_landscape**: `IconData`
  <i class='cupertino-icons md-36'>&#xf8ce;</i> &#x2014; Cupertino icon named "device_phone_landscape". Available on cupertino_icons package 1.0.0+ only.

- **device_phone_portrait**: `IconData`
  <i class='cupertino-icons md-36'>&#xf8cf;</i> &#x2014; Cupertino icon named "device_phone_portrait". Available on cupertino_icons package 1.0.0+ only.

- **dial**: `IconData`
  <i class='cupertino-icons md-36'>&#xf626;</i> &#x2014; Cupertino icon named "dial". Available on cupertino_icons package 1.0.0+ only.

- **dial_fill**: `IconData`
  <i class='cupertino-icons md-36'>&#xf627;</i> &#x2014; Cupertino icon named "dial_fill". Available on cupertino_icons package 1.0.0+ only.

- **divide**: `IconData`
  <i class='cupertino-icons md-36'>&#xf628;</i> &#x2014; Cupertino icon named "divide". Available on cupertino_icons package 1.0.0+ only.

- **divide_circle**: `IconData`
  <i class='cupertino-icons md-36'>&#xf629;</i> &#x2014; Cupertino icon named "divide_circle". Available on cupertino_icons package 1.0.0+ only.

- **divide_circle_fill**: `IconData`
  <i class='cupertino-icons md-36'>&#xf62a;</i> &#x2014; Cupertino icon named "divide_circle_fill". Available on cupertino_icons package 1.0.0+ only.

- **divide_square**: `IconData`
  <i class='cupertino-icons md-36'>&#xf62b;</i> &#x2014; Cupertino icon named "divide_square". Available on cupertino_icons package 1.0.0+ only.

- **divide_square_fill**: `IconData`
  <i class='cupertino-icons md-36'>&#xf62c;</i> &#x2014; Cupertino icon named "divide_square_fill". Available on cupertino_icons package 1.0.0+ only.

- **doc**: `IconData`
  <i class='cupertino-icons md-36'>&#xf62d;</i> &#x2014; Cupertino icon named "doc". Available on cupertino_icons package 1.0.0+ only.

- **doc_append**: `IconData`
  <i class='cupertino-icons md-36'>&#xf62e;</i> &#x2014; Cupertino icon named "doc_append". Available on cupertino_icons package 1.0.0+ only.

- **doc_chart**: `IconData`
  <i class='cupertino-icons md-36'>&#xf8d0;</i> &#x2014; Cupertino icon named "doc_chart". Available on cupertino_icons package 1.0.0+ only.

- **doc_chart_fill**: `IconData`
  <i class='cupertino-icons md-36'>&#xf8d1;</i> &#x2014; Cupertino icon named "doc_chart_fill". Available on cupertino_icons package 1.0.0+ only.

- **doc_checkmark**: `IconData`
  <i class='cupertino-icons md-36'>&#xf8d2;</i> &#x2014; Cupertino icon named "doc_checkmark". Available on cupertino_icons package 1.0.0+ only.

- **doc_checkmark_fill**: `IconData`
  <i class='cupertino-icons md-36'>&#xf8d3;</i> &#x2014; Cupertino icon named "doc_checkmark_fill". Available on cupertino_icons package 1.0.0+ only.

- **doc_circle**: `IconData`
  <i class='cupertino-icons md-36'>&#xf62f;</i> &#x2014; Cupertino icon named "doc_circle". Available on cupertino_icons package 1.0.0+ only.

- **doc_circle_fill**: `IconData`
  <i class='cupertino-icons md-36'>&#xf630;</i> &#x2014; Cupertino icon named "doc_circle_fill". Available on cupertino_icons package 1.0.0+ only.

- **doc_fill**: `IconData`
  <i class='cupertino-icons md-36'>&#xf631;</i> &#x2014; Cupertino icon named "doc_fill". Available on cupertino_icons package 1.0.0+ only.

- **doc_on_clipboard**: `IconData`
  <i class='cupertino-icons md-36'>&#xf632;</i> &#x2014; Cupertino icon named "doc_on_clipboard". Available on cupertino_icons package 1.0.0+ only.

- **doc_on_clipboard_fill**: `IconData`
  <i class='cupertino-icons md-36'>&#xf633;</i> &#x2014; Cupertino icon named "doc_on_clipboard_fill". Available on cupertino_icons package 1.0.0+ only.

- **doc_on_doc**: `IconData`
  <i class='cupertino-icons md-36'>&#xf634;</i> &#x2014; Cupertino icon named "doc_on_doc". Available on cupertino_icons package 1.0.0+ only.

- **doc_on_doc_fill**: `IconData`
  <i class='cupertino-icons md-36'>&#xf635;</i> &#x2014; Cupertino icon named "doc_on_doc_fill". Available on cupertino_icons package 1.0.0+ only.

- **doc_person**: `IconData`
  <i class='cupertino-icons md-36'>&#xf8d4;</i> &#x2014; Cupertino icon named "doc_person". Available on cupertino_icons package 1.0.0+ only.

- **doc_person_fill**: `IconData`
  <i class='cupertino-icons md-36'>&#xf8d5;</i> &#x2014; Cupertino icon named "doc_person_fill". Available on cupertino_icons package 1.0.0+ only.

- **doc_plaintext**: `IconData`
  <i class='cupertino-icons md-36'>&#xf636;</i> &#x2014; Cupertino icon named "doc_plaintext". Available on cupertino_icons package 1.0.0+ only.

- **doc_richtext**: `IconData`
  <i class='cupertino-icons md-36'>&#xf637;</i> &#x2014; Cupertino icon named "doc_richtext". Available on cupertino_icons package 1.0.0+ only.

- **doc_text**: `IconData`
  <i class='cupertino-icons md-36'>&#xf638;</i> &#x2014; Cupertino icon named "doc_text". Available on cupertino_icons package 1.0.0+ only.

- **doc_text_fill**: `IconData`
  <i class='cupertino-icons md-36'>&#xf639;</i> &#x2014; Cupertino icon named "doc_text_fill". Available on cupertino_icons package 1.0.0+ only.

- **doc_text_search**: `IconData`
  <i class='cupertino-icons md-36'>&#xf63a;</i> &#x2014; Cupertino icon named "doc_text_search". Available on cupertino_icons package 1.0.0+ only.

- **doc_text_viewfinder**: `IconData`
  <i class='cupertino-icons md-36'>&#xf63b;</i> &#x2014; Cupertino icon named "doc_text_viewfinder". Available on cupertino_icons package 1.0.0+ only.

- **dot_radiowaves_left_right**: `IconData`
  <i class='cupertino-icons md-36'>&#xf63c;</i> &#x2014; Cupertino icon named "dot_radiowaves_left_right". Available on cupertino_icons package 1.0.0+ only.

- **dot_radiowaves_right**: `IconData`
  <i class='cupertino-icons md-36'>&#xf63d;</i> &#x2014; Cupertino icon named "dot_radiowaves_right". Available on cupertino_icons package 1.0.0+ only.

- **dot_square**: `IconData`
  <i class='cupertino-icons md-36'>&#xf63e;</i> &#x2014; Cupertino icon named "dot_square". Available on cupertino_icons package 1.0.0+ only.

- **dot_square_fill**: `IconData`
  <i class='cupertino-icons md-36'>&#xf63f;</i> &#x2014; Cupertino icon named "dot_square_fill". Available on cupertino_icons package 1.0.0+ only.

- **download_circle**: `IconData`
  <i class='cupertino-icons md-36'>&#xf8d6;</i> &#x2014; Cupertino icon named "download_circle". Available on cupertino_icons package 1.0.0+ only.

- **download_circle_fill**: `IconData`
  <i class='cupertino-icons md-36'>&#xf8d7;</i> &#x2014; Cupertino icon named "download_circle_fill". Available on cupertino_icons package 1.0.0+ only.

- **drop**: `IconData`
  <i class='cupertino-icons md-36'>&#xf8d8;</i> &#x2014; Cupertino icon named "drop". Available on cupertino_icons package 1.0.0+ only.

- **drop_fill**: `IconData`
  <i class='cupertino-icons md-36'>&#xf8d9;</i> &#x2014; Cupertino icon named "drop_fill". Available on cupertino_icons package 1.0.0+ only.

- **drop_triangle**: `IconData`
  <i class='cupertino-icons md-36'>&#xf640;</i> &#x2014; Cupertino icon named "drop_triangle". Available on cupertino_icons package 1.0.0+ only.

- **drop_triangle_fill**: `IconData`
  <i class='cupertino-icons md-36'>&#xf641;</i> &#x2014; Cupertino icon named "drop_triangle_fill". Available on cupertino_icons package 1.0.0+ only.

- **ear**: `IconData`
  <i class='cupertino-icons md-36'>&#xf642;</i> &#x2014; Cupertino icon named "ear". Available on cupertino_icons package 1.0.0+ only.

- **eject**: `IconData`
  <i class='cupertino-icons md-36'>&#xf643;</i> &#x2014; Cupertino icon named "eject". Available on cupertino_icons package 1.0.0+ only.

- **eject_fill**: `IconData`
  <i class='cupertino-icons md-36'>&#xf644;</i> &#x2014; Cupertino icon named "eject_fill". Available on cupertino_icons package 1.0.0+ only.

- **ellipses_bubble**: `IconData`
  <i class='cupertino-icons md-36'>&#xf645;</i> &#x2014; Cupertino icon named "ellipses_bubble". Available on cupertino_icons package 1.0.0+ only.

- **ellipses_bubble_fill**: `IconData`
  <i class='cupertino-icons md-36'>&#xf646;</i> &#x2014; Cupertino icon named "ellipses_bubble_fill". Available on cupertino_icons package 1.0.0+ only.

- **ellipsis_circle**: `IconData`
  <i class='cupertino-icons md-36'>&#xf647;</i> &#x2014; Cupertino icon named "ellipsis_circle". Available on cupertino_icons package 1.0.0+ only.

- **ellipsis_circle_fill**: `IconData`
  <i class='cupertino-icons md-36'>&#xf648;</i> &#x2014; Cupertino icon named "ellipsis_circle_fill". Available on cupertino_icons package 1.0.0+ only.

- **ellipsis_vertical**: `IconData`
  <i class='cupertino-icons md-36'>&#xf8da;</i> &#x2014; Cupertino icon named "ellipsis_vertical". Available on cupertino_icons package 1.0.0+ only.

- **ellipsis_vertical_circle**: `IconData`
  <i class='cupertino-icons md-36'>&#xf8db;</i> &#x2014; Cupertino icon named "ellipsis_vertical_circle". Available on cupertino_icons package 1.0.0+ only.

- **ellipsis_vertical_circle_fill**: `IconData`
  <i class='cupertino-icons md-36'>&#xf8dc;</i> &#x2014; Cupertino icon named "ellipsis_vertical_circle_fill". Available on cupertino_icons package 1.0.0+ only.

- **envelope**: `IconData`
  <i class='cupertino-icons md-36'>&#xf422;</i> &#x2014; Cupertino icon named "envelope". Available on cupertino_icons package 1.0.0+ only.
 This is the same icon as [mail] which is available in cupertino_icons 0.1.3.

- **envelope_badge**: `IconData`
  <i class='cupertino-icons md-36'>&#xf649;</i> &#x2014; Cupertino icon named "envelope_badge". Available on cupertino_icons package 1.0.0+ only.

- **envelope_badge_fill**: `IconData`
  <i class='cupertino-icons md-36'>&#xf64a;</i> &#x2014; Cupertino icon named "envelope_badge_fill". Available on cupertino_icons package 1.0.0+ only.

- **envelope_circle**: `IconData`
  <i class='cupertino-icons md-36'>&#xf64b;</i> &#x2014; Cupertino icon named "envelope_circle". Available on cupertino_icons package 1.0.0+ only.

- **envelope_circle_fill**: `IconData`
  <i class='cupertino-icons md-36'>&#xf64c;</i> &#x2014; Cupertino icon named "envelope_circle_fill". Available on cupertino_icons package 1.0.0+ only.

- **envelope_fill**: `IconData`
  <i class='cupertino-icons md-36'>&#xf423;</i> &#x2014; Cupertino icon named "envelope_fill". Available on cupertino_icons package 1.0.0+ only.
 This is the same icon as [mail_solid] which is available in cupertino_icons 0.1.3.

- **envelope_open**: `IconData`
  <i class='cupertino-icons md-36'>&#xf64d;</i> &#x2014; Cupertino icon named "envelope_open". Available on cupertino_icons package 1.0.0+ only.

- **envelope_open_fill**: `IconData`
  <i class='cupertino-icons md-36'>&#xf64e;</i> &#x2014; Cupertino icon named "envelope_open_fill". Available on cupertino_icons package 1.0.0+ only.

- **equal**: `IconData`
  <i class='cupertino-icons md-36'>&#xf64f;</i> &#x2014; Cupertino icon named "equal". Available on cupertino_icons package 1.0.0+ only.

- **equal_circle**: `IconData`
  <i class='cupertino-icons md-36'>&#xf650;</i> &#x2014; Cupertino icon named "equal_circle". Available on cupertino_icons package 1.0.0+ only.

- **equal_circle_fill**: `IconData`
  <i class='cupertino-icons md-36'>&#xf651;</i> &#x2014; Cupertino icon named "equal_circle_fill". Available on cupertino_icons package 1.0.0+ only.

- **equal_square**: `IconData`
  <i class='cupertino-icons md-36'>&#xf652;</i> &#x2014; Cupertino icon named "equal_square". Available on cupertino_icons package 1.0.0+ only.

- **equal_square_fill**: `IconData`
  <i class='cupertino-icons md-36'>&#xf653;</i> &#x2014; Cupertino icon named "equal_square_fill". Available on cupertino_icons package 1.0.0+ only.

- **escape**: `IconData`
  <i class='cupertino-icons md-36'>&#xf654;</i> &#x2014; Cupertino icon named "escape". Available on cupertino_icons package 1.0.0+ only.

- **exclamationmark**: `IconData`
  <i class='cupertino-icons md-36'>&#xf655;</i> &#x2014; Cupertino icon named "exclamationmark". Available on cupertino_icons package 1.0.0+ only.

- **exclamationmark_bubble**: `IconData`
  <i class='cupertino-icons md-36'>&#xf656;</i> &#x2014; Cupertino icon named "exclamationmark_bubble". Available on cupertino_icons package 1.0.0+ only.

- **exclamationmark_bubble_fill**: `IconData`
  <i class='cupertino-icons md-36'>&#xf657;</i> &#x2014; Cupertino icon named "exclamationmark_bubble_fill". Available on cupertino_icons package 1.0.0+ only.

- **exclamationmark_circle**: `IconData`
  <i class='cupertino-icons md-36'>&#xf658;</i> &#x2014; Cupertino icon named "exclamationmark_circle". Available on cupertino_icons package 1.0.0+ only.

- **exclamationmark_circle_fill**: `IconData`
  <i class='cupertino-icons md-36'>&#xf659;</i> &#x2014; Cupertino icon named "exclamationmark_circle_fill". Available on cupertino_icons package 1.0.0+ only.

- **exclamationmark_octagon**: `IconData`
  <i class='cupertino-icons md-36'>&#xf65a;</i> &#x2014; Cupertino icon named "exclamationmark_octagon". Available on cupertino_icons package 1.0.0+ only.

- **exclamationmark_octagon_fill**: `IconData`
  <i class='cupertino-icons md-36'>&#xf65b;</i> &#x2014; Cupertino icon named "exclamationmark_octagon_fill". Available on cupertino_icons package 1.0.0+ only.

- **exclamationmark_shield**: `IconData`
  <i class='cupertino-icons md-36'>&#xf65c;</i> &#x2014; Cupertino icon named "exclamationmark_shield". Available on cupertino_icons package 1.0.0+ only.

- **exclamationmark_shield_fill**: `IconData`
  <i class='cupertino-icons md-36'>&#xf65d;</i> &#x2014; Cupertino icon named "exclamationmark_shield_fill". Available on cupertino_icons package 1.0.0+ only.

- **exclamationmark_square**: `IconData`
  <i class='cupertino-icons md-36'>&#xf65e;</i> &#x2014; Cupertino icon named "exclamationmark_square". Available on cupertino_icons package 1.0.0+ only.

- **exclamationmark_square_fill**: `IconData`
  <i class='cupertino-icons md-36'>&#xf65f;</i> &#x2014; Cupertino icon named "exclamationmark_square_fill". Available on cupertino_icons package 1.0.0+ only.

- **exclamationmark_triangle**: `IconData`
  <i class='cupertino-icons md-36'>&#xf660;</i> &#x2014; Cupertino icon named "exclamationmark_triangle". Available on cupertino_icons package 1.0.0+ only.

- **exclamationmark_triangle_fill**: `IconData`
  <i class='cupertino-icons md-36'>&#xf661;</i> &#x2014; Cupertino icon named "exclamationmark_triangle_fill". Available on cupertino_icons package 1.0.0+ only.

- **eye_fill**: `IconData`
  <i class='cupertino-icons md-36'>&#xf425;</i> &#x2014; Cupertino icon named "eye_fill". Available on cupertino_icons package 1.0.0+ only.
 This is the same icon as [eye_solid] which is available in cupertino_icons 0.1.3.

- **eye_slash**: `IconData`
  <i class='cupertino-icons md-36'>&#xf662;</i> &#x2014; Cupertino icon named "eye_slash". Available on cupertino_icons package 1.0.0+ only.

- **eye_slash_fill**: `IconData`
  <i class='cupertino-icons md-36'>&#xf663;</i> &#x2014; Cupertino icon named "eye_slash_fill". Available on cupertino_icons package 1.0.0+ only.

- **eyedropper**: `IconData`
  <i class='cupertino-icons md-36'>&#xf664;</i> &#x2014; Cupertino icon named "eyedropper". Available on cupertino_icons package 1.0.0+ only.

- **eyedropper_full**: `IconData`
  <i class='cupertino-icons md-36'>&#xf665;</i> &#x2014; Cupertino icon named "eyedropper_full". Available on cupertino_icons package 1.0.0+ only.

- **eyedropper_halffull**: `IconData`
  <i class='cupertino-icons md-36'>&#xf666;</i> &#x2014; Cupertino icon named "eyedropper_halffull". Available on cupertino_icons package 1.0.0+ only.

- **eyeglasses**: `IconData`
  <i class='cupertino-icons md-36'>&#xf667;</i> &#x2014; Cupertino icon named "eyeglasses". Available on cupertino_icons package 1.0.0+ only.

- **f_cursive**: `IconData`
  <i class='cupertino-icons md-36'>&#xf668;</i> &#x2014; Cupertino icon named "f_cursive". Available on cupertino_icons package 1.0.0+ only.

- **f_cursive_circle**: `IconData`
  <i class='cupertino-icons md-36'>&#xf669;</i> &#x2014; Cupertino icon named "f_cursive_circle". Available on cupertino_icons package 1.0.0+ only.

- **f_cursive_circle_fill**: `IconData`
  <i class='cupertino-icons md-36'>&#xf66a;</i> &#x2014; Cupertino icon named "f_cursive_circle_fill". Available on cupertino_icons package 1.0.0+ only.

- **film**: `IconData`
  <i class='cupertino-icons md-36'>&#xf66b;</i> &#x2014; Cupertino icon named "film". Available on cupertino_icons package 1.0.0+ only.

- **film_fill**: `IconData`
  <i class='cupertino-icons md-36'>&#xf66c;</i> &#x2014; Cupertino icon named "film_fill". Available on cupertino_icons package 1.0.0+ only.

- **flag_circle**: `IconData`
  <i class='cupertino-icons md-36'>&#xf66d;</i> &#x2014; Cupertino icon named "flag_circle". Available on cupertino_icons package 1.0.0+ only.

- **flag_circle_fill**: `IconData`
  <i class='cupertino-icons md-36'>&#xf66e;</i> &#x2014; Cupertino icon named "flag_circle_fill". Available on cupertino_icons package 1.0.0+ only.

- **flag_fill**: `IconData`
  <i class='cupertino-icons md-36'>&#xf66f;</i> &#x2014; Cupertino icon named "flag_fill". Available on cupertino_icons package 1.0.0+ only.

- **flag_slash**: `IconData`
  <i class='cupertino-icons md-36'>&#xf670;</i> &#x2014; Cupertino icon named "flag_slash". Available on cupertino_icons package 1.0.0+ only.

- **flag_slash_fill**: `IconData`
  <i class='cupertino-icons md-36'>&#xf671;</i> &#x2014; Cupertino icon named "flag_slash_fill". Available on cupertino_icons package 1.0.0+ only.

- **flame**: `IconData`
  <i class='cupertino-icons md-36'>&#xf672;</i> &#x2014; Cupertino icon named "flame". Available on cupertino_icons package 1.0.0+ only.

- **flame_fill**: `IconData`
  <i class='cupertino-icons md-36'>&#xf673;</i> &#x2014; Cupertino icon named "flame_fill". Available on cupertino_icons package 1.0.0+ only.

- **floppy_disk**: `IconData`
  <i class='cupertino-icons md-36'>&#xf8dd;</i> &#x2014; Cupertino icon named "floppy_disk". Available on cupertino_icons package 1.0.0+ only.

- **flowchart**: `IconData`
  <i class='cupertino-icons md-36'>&#xf674;</i> &#x2014; Cupertino icon named "flowchart". Available on cupertino_icons package 1.0.0+ only.

- **flowchart_fill**: `IconData`
  <i class='cupertino-icons md-36'>&#xf675;</i> &#x2014; Cupertino icon named "flowchart_fill". Available on cupertino_icons package 1.0.0+ only.

- **folder_badge_minus**: `IconData`
  <i class='cupertino-icons md-36'>&#xf676;</i> &#x2014; Cupertino icon named "folder_badge_minus". Available on cupertino_icons package 1.0.0+ only.

- **folder_badge_person_crop**: `IconData`
  <i class='cupertino-icons md-36'>&#xf677;</i> &#x2014; Cupertino icon named "folder_badge_person_crop". Available on cupertino_icons package 1.0.0+ only.

- **folder_badge_plus**: `IconData`
  <i class='cupertino-icons md-36'>&#xf678;</i> &#x2014; Cupertino icon named "folder_badge_plus". Available on cupertino_icons package 1.0.0+ only.

- **folder_circle**: `IconData`
  <i class='cupertino-icons md-36'>&#xf679;</i> &#x2014; Cupertino icon named "folder_circle". Available on cupertino_icons package 1.0.0+ only.

- **folder_circle_fill**: `IconData`
  <i class='cupertino-icons md-36'>&#xf67a;</i> &#x2014; Cupertino icon named "folder_circle_fill". Available on cupertino_icons package 1.0.0+ only.

- **folder_fill**: `IconData`
  <i class='cupertino-icons md-36'>&#xf435;</i> &#x2014; Cupertino icon named "folder_fill". Available on cupertino_icons package 1.0.0+ only.
 This is the same icon as [folder_solid] which is available in cupertino_icons 0.1.3.

- **folder_fill_badge_minus**: `IconData`
  <i class='cupertino-icons md-36'>&#xf67b;</i> &#x2014; Cupertino icon named "folder_fill_badge_minus". Available on cupertino_icons package 1.0.0+ only.

- **folder_fill_badge_person_crop**: `IconData`
  <i class='cupertino-icons md-36'>&#xf67c;</i> &#x2014; Cupertino icon named "folder_fill_badge_person_crop". Available on cupertino_icons package 1.0.0+ only.

- **folder_fill_badge_plus**: `IconData`
  <i class='cupertino-icons md-36'>&#xf67d;</i> &#x2014; Cupertino icon named "folder_fill_badge_plus". Available on cupertino_icons package 1.0.0+ only.

- **forward_end**: `IconData`
  <i class='cupertino-icons md-36'>&#xf67f;</i> &#x2014; Cupertino icon named "forward_end". Available on cupertino_icons package 1.0.0+ only.

- **forward_end_alt**: `IconData`
  <i class='cupertino-icons md-36'>&#xf680;</i> &#x2014; Cupertino icon named "forward_end_alt". Available on cupertino_icons package 1.0.0+ only.

- **forward_end_alt_fill**: `IconData`
  <i class='cupertino-icons md-36'>&#xf681;</i> &#x2014; Cupertino icon named "forward_end_alt_fill". Available on cupertino_icons package 1.0.0+ only.

- **forward_end_fill**: `IconData`
  <i class='cupertino-icons md-36'>&#xf682;</i> &#x2014; Cupertino icon named "forward_end_fill". Available on cupertino_icons package 1.0.0+ only.

- **forward_fill**: `IconData`
  <i class='cupertino-icons md-36'>&#xf683;</i> &#x2014; Cupertino icon named "forward_fill". Available on cupertino_icons package 1.0.0+ only.

- **function**: `IconData`
  <i class='cupertino-icons md-36'>&#xf684;</i> &#x2014; Cupertino icon named "function". Available on cupertino_icons package 1.0.0+ only.

- **fx**: `IconData`
  <i class='cupertino-icons md-36'>&#xf685;</i> &#x2014; Cupertino icon named "fx". Available on cupertino_icons package 1.0.0+ only.

- **gamecontroller**: `IconData`
  <i class='cupertino-icons md-36'>&#xf43a;</i> &#x2014; Cupertino icon named "gamecontroller". Available on cupertino_icons package 1.0.0+ only.
 This is the same icon as [game_controller] which is available in cupertino_icons 0.1.3.

- **gamecontroller_alt_fill**: `IconData`
  <i class='cupertino-icons md-36'>&#xf8de;</i> &#x2014; Cupertino icon named "gamecontroller_alt_fill". Available on cupertino_icons package 1.0.0+ only.

- **gamecontroller_fill**: `IconData`
  <i class='cupertino-icons md-36'>&#xf43b;</i> &#x2014; Cupertino icon named "gamecontroller_fill". Available on cupertino_icons package 1.0.0+ only.
 This is the same icon as [game_controller_solid] which is available in cupertino_icons 0.1.3.

- **gauge**: `IconData`
  <i class='cupertino-icons md-36'>&#xf686;</i> &#x2014; Cupertino icon named "gauge". Available on cupertino_icons package 1.0.0+ only.

- **gauge_badge_minus**: `IconData`
  <i class='cupertino-icons md-36'>&#xf687;</i> &#x2014; Cupertino icon named "gauge_badge_minus". Available on cupertino_icons package 1.0.0+ only.

- **gauge_badge_plus**: `IconData`
  <i class='cupertino-icons md-36'>&#xf688;</i> &#x2014; Cupertino icon named "gauge_badge_plus". Available on cupertino_icons package 1.0.0+ only.

- **gear_alt**: `IconData`
  <i class='cupertino-icons md-36'>&#xf43c;</i> &#x2014; Cupertino icon named "gear_alt". Available on cupertino_icons package 1.0.0+ only.
 This is the same icon as [gear] which is available in cupertino_icons 0.1.3.
 This is the same icon as [gear_big] which is available in cupertino_icons 0.1.3.

- **gear_alt_fill**: `IconData`
  <i class='cupertino-icons md-36'>&#xf43d;</i> &#x2014; Cupertino icon named "gear_alt_fill". Available on cupertino_icons package 1.0.0+ only.
 This is the same icon as [gear_solid] which is available in cupertino_icons 0.1.3.

- **gift**: `IconData`
  <i class='cupertino-icons md-36'>&#xf689;</i> &#x2014; Cupertino icon named "gift". Available on cupertino_icons package 1.0.0+ only.

- **gift_alt**: `IconData`
  <i class='cupertino-icons md-36'>&#xf68a;</i> &#x2014; Cupertino icon named "gift_alt". Available on cupertino_icons package 1.0.0+ only.

- **gift_alt_fill**: `IconData`
  <i class='cupertino-icons md-36'>&#xf68b;</i> &#x2014; Cupertino icon named "gift_alt_fill". Available on cupertino_icons package 1.0.0+ only.

- **gift_fill**: `IconData`
  <i class='cupertino-icons md-36'>&#xf68c;</i> &#x2014; Cupertino icon named "gift_fill". Available on cupertino_icons package 1.0.0+ only.

- **globe**: `IconData`
  <i class='cupertino-icons md-36'>&#xf68d;</i> &#x2014; Cupertino icon named "globe". Available on cupertino_icons package 1.0.0+ only.

- **gobackward**: `IconData`
  <i class='cupertino-icons md-36'>&#xf68e;</i> &#x2014; Cupertino icon named "gobackward". Available on cupertino_icons package 1.0.0+ only.

- **gobackward_10**: `IconData`
  <i class='cupertino-icons md-36'>&#xf68f;</i> &#x2014; Cupertino icon named "gobackward_10". Available on cupertino_icons package 1.0.0+ only.

- **gobackward_15**: `IconData`
  <i class='cupertino-icons md-36'>&#xf690;</i> &#x2014; Cupertino icon named "gobackward_15". Available on cupertino_icons package 1.0.0+ only.

- **gobackward_30**: `IconData`
  <i class='cupertino-icons md-36'>&#xf691;</i> &#x2014; Cupertino icon named "gobackward_30". Available on cupertino_icons package 1.0.0+ only.

- **gobackward_45**: `IconData`
  <i class='cupertino-icons md-36'>&#xf692;</i> &#x2014; Cupertino icon named "gobackward_45". Available on cupertino_icons package 1.0.0+ only.

- **gobackward_60**: `IconData`
  <i class='cupertino-icons md-36'>&#xf693;</i> &#x2014; Cupertino icon named "gobackward_60". Available on cupertino_icons package 1.0.0+ only.

- **gobackward_75**: `IconData`
  <i class='cupertino-icons md-36'>&#xf694;</i> &#x2014; Cupertino icon named "gobackward_75". Available on cupertino_icons package 1.0.0+ only.

- **gobackward_90**: `IconData`
  <i class='cupertino-icons md-36'>&#xf695;</i> &#x2014; Cupertino icon named "gobackward_90". Available on cupertino_icons package 1.0.0+ only.

- **gobackward_minus**: `IconData`
  <i class='cupertino-icons md-36'>&#xf696;</i> &#x2014; Cupertino icon named "gobackward_minus". Available on cupertino_icons package 1.0.0+ only.

- **goforward**: `IconData`
  <i class='cupertino-icons md-36'>&#xf697;</i> &#x2014; Cupertino icon named "goforward". Available on cupertino_icons package 1.0.0+ only.

- **goforward_10**: `IconData`
  <i class='cupertino-icons md-36'>&#xf698;</i> &#x2014; Cupertino icon named "goforward_10". Available on cupertino_icons package 1.0.0+ only.

- **goforward_15**: `IconData`
  <i class='cupertino-icons md-36'>&#xf699;</i> &#x2014; Cupertino icon named "goforward_15". Available on cupertino_icons package 1.0.0+ only.

- **goforward_30**: `IconData`
  <i class='cupertino-icons md-36'>&#xf69a;</i> &#x2014; Cupertino icon named "goforward_30". Available on cupertino_icons package 1.0.0+ only.

- **goforward_45**: `IconData`
  <i class='cupertino-icons md-36'>&#xf69b;</i> &#x2014; Cupertino icon named "goforward_45". Available on cupertino_icons package 1.0.0+ only.

- **goforward_60**: `IconData`
  <i class='cupertino-icons md-36'>&#xf69c;</i> &#x2014; Cupertino icon named "goforward_60". Available on cupertino_icons package 1.0.0+ only.

- **goforward_75**: `IconData`
  <i class='cupertino-icons md-36'>&#xf69d;</i> &#x2014; Cupertino icon named "goforward_75". Available on cupertino_icons package 1.0.0+ only.

- **goforward_90**: `IconData`
  <i class='cupertino-icons md-36'>&#xf69e;</i> &#x2014; Cupertino icon named "goforward_90". Available on cupertino_icons package 1.0.0+ only.

- **goforward_plus**: `IconData`
  <i class='cupertino-icons md-36'>&#xf69f;</i> &#x2014; Cupertino icon named "goforward_plus". Available on cupertino_icons package 1.0.0+ only.

- **graph_circle**: `IconData`
  <i class='cupertino-icons md-36'>&#xf8df;</i> &#x2014; Cupertino icon named "graph_circle". Available on cupertino_icons package 1.0.0+ only.

- **graph_circle_fill**: `IconData`
  <i class='cupertino-icons md-36'>&#xf8e0;</i> &#x2014; Cupertino icon named "graph_circle_fill". Available on cupertino_icons package 1.0.0+ only.

- **graph_square**: `IconData`
  <i class='cupertino-icons md-36'>&#xf8e1;</i> &#x2014; Cupertino icon named "graph_square". Available on cupertino_icons package 1.0.0+ only.

- **graph_square_fill**: `IconData`
  <i class='cupertino-icons md-36'>&#xf8e2;</i> &#x2014; Cupertino icon named "graph_square_fill". Available on cupertino_icons package 1.0.0+ only.

- **greaterthan**: `IconData`
  <i class='cupertino-icons md-36'>&#xf6a0;</i> &#x2014; Cupertino icon named "greaterthan". Available on cupertino_icons package 1.0.0+ only.

- **greaterthan_circle**: `IconData`
  <i class='cupertino-icons md-36'>&#xf6a1;</i> &#x2014; Cupertino icon named "greaterthan_circle". Available on cupertino_icons package 1.0.0+ only.

- **greaterthan_circle_fill**: `IconData`
  <i class='cupertino-icons md-36'>&#xf6a2;</i> &#x2014; Cupertino icon named "greaterthan_circle_fill". Available on cupertino_icons package 1.0.0+ only.

- **greaterthan_square**: `IconData`
  <i class='cupertino-icons md-36'>&#xf6a3;</i> &#x2014; Cupertino icon named "greaterthan_square". Available on cupertino_icons package 1.0.0+ only.

- **greaterthan_square_fill**: `IconData`
  <i class='cupertino-icons md-36'>&#xf6a4;</i> &#x2014; Cupertino icon named "greaterthan_square_fill". Available on cupertino_icons package 1.0.0+ only.

- **grid**: `IconData`
  <i class='cupertino-icons md-36'>&#xf6a5;</i> &#x2014; Cupertino icon named "grid". Available on cupertino_icons package 1.0.0+ only.

- **grid_circle**: `IconData`
  <i class='cupertino-icons md-36'>&#xf6a6;</i> &#x2014; Cupertino icon named "grid_circle". Available on cupertino_icons package 1.0.0+ only.

- **grid_circle_fill**: `IconData`
  <i class='cupertino-icons md-36'>&#xf6a7;</i> &#x2014; Cupertino icon named "grid_circle_fill". Available on cupertino_icons package 1.0.0+ only.

- **guitars**: `IconData`
  <i class='cupertino-icons md-36'>&#xf6a8;</i> &#x2014; Cupertino icon named "guitars". Available on cupertino_icons package 1.0.0+ only.

- **hammer**: `IconData`
  <i class='cupertino-icons md-36'>&#xf6a9;</i> &#x2014; Cupertino icon named "hammer". Available on cupertino_icons package 1.0.0+ only.

- **hammer_fill**: `IconData`
  <i class='cupertino-icons md-36'>&#xf6aa;</i> &#x2014; Cupertino icon named "hammer_fill". Available on cupertino_icons package 1.0.0+ only.

- **hand_draw**: `IconData`
  <i class='cupertino-icons md-36'>&#xf6ab;</i> &#x2014; Cupertino icon named "hand_draw". Available on cupertino_icons package 1.0.0+ only.

- **hand_draw_fill**: `IconData`
  <i class='cupertino-icons md-36'>&#xf6ac;</i> &#x2014; Cupertino icon named "hand_draw_fill". Available on cupertino_icons package 1.0.0+ only.

- **hand_point_left**: `IconData`
  <i class='cupertino-icons md-36'>&#xf6ad;</i> &#x2014; Cupertino icon named "hand_point_left". Available on cupertino_icons package 1.0.0+ only.

- **hand_point_left_fill**: `IconData`
  <i class='cupertino-icons md-36'>&#xf6ae;</i> &#x2014; Cupertino icon named "hand_point_left_fill". Available on cupertino_icons package 1.0.0+ only.

- **hand_point_right**: `IconData`
  <i class='cupertino-icons md-36'>&#xf6af;</i> &#x2014; Cupertino icon named "hand_point_right". Available on cupertino_icons package 1.0.0+ only.

- **hand_point_right_fill**: `IconData`
  <i class='cupertino-icons md-36'>&#xf6b0;</i> &#x2014; Cupertino icon named "hand_point_right_fill". Available on cupertino_icons package 1.0.0+ only.

- **hand_raised**: `IconData`
  <i class='cupertino-icons md-36'>&#xf6b1;</i> &#x2014; Cupertino icon named "hand_raised". Available on cupertino_icons package 1.0.0+ only.

- **hand_raised_fill**: `IconData`
  <i class='cupertino-icons md-36'>&#xf6b2;</i> &#x2014; Cupertino icon named "hand_raised_fill". Available on cupertino_icons package 1.0.0+ only.

- **hand_raised_slash**: `IconData`
  <i class='cupertino-icons md-36'>&#xf6b3;</i> &#x2014; Cupertino icon named "hand_raised_slash". Available on cupertino_icons package 1.0.0+ only.

- **hand_raised_slash_fill**: `IconData`
  <i class='cupertino-icons md-36'>&#xf6b4;</i> &#x2014; Cupertino icon named "hand_raised_slash_fill". Available on cupertino_icons package 1.0.0+ only.

- **hand_thumbsdown**: `IconData`
  <i class='cupertino-icons md-36'>&#xf6b5;</i> &#x2014; Cupertino icon named "hand_thumbsdown". Available on cupertino_icons package 1.0.0+ only.

- **hand_thumbsdown_fill**: `IconData`
  <i class='cupertino-icons md-36'>&#xf6b6;</i> &#x2014; Cupertino icon named "hand_thumbsdown_fill". Available on cupertino_icons package 1.0.0+ only.

- **hand_thumbsup**: `IconData`
  <i class='cupertino-icons md-36'>&#xf6b7;</i> &#x2014; Cupertino icon named "hand_thumbsup". Available on cupertino_icons package 1.0.0+ only.

- **hand_thumbsup_fill**: `IconData`
  <i class='cupertino-icons md-36'>&#xf6b8;</i> &#x2014; Cupertino icon named "hand_thumbsup_fill". Available on cupertino_icons package 1.0.0+ only.

- **hare**: `IconData`
  <i class='cupertino-icons md-36'>&#xf6b9;</i> &#x2014; Cupertino icon named "hare". Available on cupertino_icons package 1.0.0+ only.

- **hare_fill**: `IconData`
  <i class='cupertino-icons md-36'>&#xf6ba;</i> &#x2014; Cupertino icon named "hare_fill". Available on cupertino_icons package 1.0.0+ only.

- **headphones**: `IconData`
  <i class='cupertino-icons md-36'>&#xf6bb;</i> &#x2014; Cupertino icon named "headphones". Available on cupertino_icons package 1.0.0+ only.

- **heart_circle**: `IconData`
  <i class='cupertino-icons md-36'>&#xf6bc;</i> &#x2014; Cupertino icon named "heart_circle". Available on cupertino_icons package 1.0.0+ only.

- **heart_circle_fill**: `IconData`
  <i class='cupertino-icons md-36'>&#xf6bd;</i> &#x2014; Cupertino icon named "heart_circle_fill". Available on cupertino_icons package 1.0.0+ only.

- **heart_fill**: `IconData`
  <i class='cupertino-icons md-36'>&#xf443;</i> &#x2014; Cupertino icon named "heart_fill". Available on cupertino_icons package 1.0.0+ only.
 This is the same icon as [heart_solid] which is available in cupertino_icons 0.1.3.

- **heart_slash**: `IconData`
  <i class='cupertino-icons md-36'>&#xf6be;</i> &#x2014; Cupertino icon named "heart_slash". Available on cupertino_icons package 1.0.0+ only.

- **heart_slash_circle**: `IconData`
  <i class='cupertino-icons md-36'>&#xf6bf;</i> &#x2014; Cupertino icon named "heart_slash_circle". Available on cupertino_icons package 1.0.0+ only.

- **heart_slash_circle_fill**: `IconData`
  <i class='cupertino-icons md-36'>&#xf6c0;</i> &#x2014; Cupertino icon named "heart_slash_circle_fill". Available on cupertino_icons package 1.0.0+ only.

- **heart_slash_fill**: `IconData`
  <i class='cupertino-icons md-36'>&#xf6c1;</i> &#x2014; Cupertino icon named "heart_slash_fill". Available on cupertino_icons package 1.0.0+ only.

- **helm**: `IconData`
  <i class='cupertino-icons md-36'>&#xf6c2;</i> &#x2014; Cupertino icon named "helm". Available on cupertino_icons package 1.0.0+ only.

- **hexagon**: `IconData`
  <i class='cupertino-icons md-36'>&#xf6c3;</i> &#x2014; Cupertino icon named "hexagon". Available on cupertino_icons package 1.0.0+ only.

- **hexagon_fill**: `IconData`
  <i class='cupertino-icons md-36'>&#xf6c4;</i> &#x2014; Cupertino icon named "hexagon_fill". Available on cupertino_icons package 1.0.0+ only.

- **hifispeaker**: `IconData`
  <i class='cupertino-icons md-36'>&#xf6c5;</i> &#x2014; Cupertino icon named "hifispeaker". Available on cupertino_icons package 1.0.0+ only.

- **hifispeaker_fill**: `IconData`
  <i class='cupertino-icons md-36'>&#xf6c6;</i> &#x2014; Cupertino icon named "hifispeaker_fill". Available on cupertino_icons package 1.0.0+ only.

- **hourglass**: `IconData`
  <i class='cupertino-icons md-36'>&#xf6c7;</i> &#x2014; Cupertino icon named "hourglass". Available on cupertino_icons package 1.0.0+ only.

- **hourglass_bottomhalf_fill**: `IconData`
  <i class='cupertino-icons md-36'>&#xf6c8;</i> &#x2014; Cupertino icon named "hourglass_bottomhalf_fill". Available on cupertino_icons package 1.0.0+ only.

- **hourglass_tophalf_fill**: `IconData`
  <i class='cupertino-icons md-36'>&#xf6c9;</i> &#x2014; Cupertino icon named "hourglass_tophalf_fill". Available on cupertino_icons package 1.0.0+ only.

- **house**: `IconData`
  <i class='cupertino-icons md-36'>&#xf447;</i> &#x2014; Cupertino icon named "house". Available on cupertino_icons package 1.0.0+ only.
 This is the same icon as [home] which is available in cupertino_icons 0.1.3.

- **house_alt**: `IconData`
  <i class='cupertino-icons md-36'>&#xf8e3;</i> &#x2014; Cupertino icon named "house_alt". Available on cupertino_icons package 1.0.0+ only.

- **house_alt_fill**: `IconData`
  <i class='cupertino-icons md-36'>&#xf8e4;</i> &#x2014; Cupertino icon named "house_alt_fill". Available on cupertino_icons package 1.0.0+ only.

- **house_fill**: `IconData`
  <i class='cupertino-icons md-36'>&#xf6ca;</i> &#x2014; Cupertino icon named "house_fill". Available on cupertino_icons package 1.0.0+ only.

- **hurricane**: `IconData`
  <i class='cupertino-icons md-36'>&#xf6cb;</i> &#x2014; Cupertino icon named "hurricane". Available on cupertino_icons package 1.0.0+ only.

- **increase_indent**: `IconData`
  <i class='cupertino-icons md-36'>&#xf6cc;</i> &#x2014; Cupertino icon named "increase_indent". Available on cupertino_icons package 1.0.0+ only.

- **increase_quotelevel**: `IconData`
  <i class='cupertino-icons md-36'>&#xf6cd;</i> &#x2014; Cupertino icon named "increase_quotelevel". Available on cupertino_icons package 1.0.0+ only.

- **infinite**: `IconData`
  <i class='cupertino-icons md-36'>&#xf449;</i> &#x2014; Cupertino icon named "infinite". Available on cupertino_icons package 1.0.0+ only.
 This is the same icon as [loop] which is available in cupertino_icons 0.1.3.
 This is the same icon as [loop_thick] which is available in cupertino_icons 0.1.3.

- **info_circle**: `IconData`
  <i class='cupertino-icons md-36'>&#xf44c;</i> &#x2014; Cupertino icon named "info_circle". Available on cupertino_icons package 1.0.0+ only.
 This is the same icon as [info] which is available in cupertino_icons 0.1.3.

- **info_circle_fill**: `IconData`
  <i class='cupertino-icons md-36'>&#xf6cf;</i> &#x2014; Cupertino icon named "info_circle_fill". Available on cupertino_icons package 1.0.0+ only.

- **italic**: `IconData`
  <i class='cupertino-icons md-36'>&#xf6d0;</i> &#x2014; Cupertino icon named "italic". Available on cupertino_icons package 1.0.0+ only.

- **keyboard**: `IconData`
  <i class='cupertino-icons md-36'>&#xf6d1;</i> &#x2014; Cupertino icon named "keyboard". Available on cupertino_icons package 1.0.0+ only.

- **keyboard_chevron_compact_down**: `IconData`
  <i class='cupertino-icons md-36'>&#xf6d2;</i> &#x2014; Cupertino icon named "keyboard_chevron_compact_down". Available on cupertino_icons package 1.0.0+ only.

- **largecircle_fill_circle**: `IconData`
  <i class='cupertino-icons md-36'>&#xf6d3;</i> &#x2014; Cupertino icon named "largecircle_fill_circle". Available on cupertino_icons package 1.0.0+ only.

- **lasso**: `IconData`
  <i class='cupertino-icons md-36'>&#xf6d4;</i> &#x2014; Cupertino icon named "lasso". Available on cupertino_icons package 1.0.0+ only.

- **layers**: `IconData`
  <i class='cupertino-icons md-36'>&#xf8e5;</i> &#x2014; Cupertino icon named "layers". Available on cupertino_icons package 1.0.0+ only.

- **layers_alt**: `IconData`
  <i class='cupertino-icons md-36'>&#xf8e6;</i> &#x2014; Cupertino icon named "layers_alt". Available on cupertino_icons package 1.0.0+ only.

- **layers_alt_fill**: `IconData`
  <i class='cupertino-icons md-36'>&#xf8e7;</i> &#x2014; Cupertino icon named "layers_alt_fill". Available on cupertino_icons package 1.0.0+ only.

- **layers_fill**: `IconData`
  <i class='cupertino-icons md-36'>&#xf8e8;</i> &#x2014; Cupertino icon named "layers_fill". Available on cupertino_icons package 1.0.0+ only.

- **leaf_arrow_circlepath**: `IconData`
  <i class='cupertino-icons md-36'>&#xf6d5;</i> &#x2014; Cupertino icon named "leaf_arrow_circlepath". Available on cupertino_icons package 1.0.0+ only.

- **lessthan**: `IconData`
  <i class='cupertino-icons md-36'>&#xf6d6;</i> &#x2014; Cupertino icon named "lessthan". Available on cupertino_icons package 1.0.0+ only.

- **lessthan_circle**: `IconData`
  <i class='cupertino-icons md-36'>&#xf6d7;</i> &#x2014; Cupertino icon named "lessthan_circle". Available on cupertino_icons package 1.0.0+ only.

- **lessthan_circle_fill**: `IconData`
  <i class='cupertino-icons md-36'>&#xf6d8;</i> &#x2014; Cupertino icon named "lessthan_circle_fill". Available on cupertino_icons package 1.0.0+ only.

- **lessthan_square**: `IconData`
  <i class='cupertino-icons md-36'>&#xf6d9;</i> &#x2014; Cupertino icon named "lessthan_square". Available on cupertino_icons package 1.0.0+ only.

- **lessthan_square_fill**: `IconData`
  <i class='cupertino-icons md-36'>&#xf6da;</i> &#x2014; Cupertino icon named "lessthan_square_fill". Available on cupertino_icons package 1.0.0+ only.

- **light_max**: `IconData`
  <i class='cupertino-icons md-36'>&#xf6db;</i> &#x2014; Cupertino icon named "light_max". Available on cupertino_icons package 1.0.0+ only.

- **light_min**: `IconData`
  <i class='cupertino-icons md-36'>&#xf6dc;</i> &#x2014; Cupertino icon named "light_min". Available on cupertino_icons package 1.0.0+ only.

- **lightbulb**: `IconData`
  <i class='cupertino-icons md-36'>&#xf6dd;</i> &#x2014; Cupertino icon named "lightbulb". Available on cupertino_icons package 1.0.0+ only.

- **lightbulb_fill**: `IconData`
  <i class='cupertino-icons md-36'>&#xf6de;</i> &#x2014; Cupertino icon named "lightbulb_fill". Available on cupertino_icons package 1.0.0+ only.

- **lightbulb_slash**: `IconData`
  <i class='cupertino-icons md-36'>&#xf6df;</i> &#x2014; Cupertino icon named "lightbulb_slash". Available on cupertino_icons package 1.0.0+ only.

- **lightbulb_slash_fill**: `IconData`
  <i class='cupertino-icons md-36'>&#xf6e0;</i> &#x2014; Cupertino icon named "lightbulb_slash_fill". Available on cupertino_icons package 1.0.0+ only.

- **line_horizontal_3**: `IconData`
  <i class='cupertino-icons md-36'>&#xf6e1;</i> &#x2014; Cupertino icon named "line_horizontal_3". Available on cupertino_icons package 1.0.0+ only.

- **line_horizontal_3_decrease**: `IconData`
  <i class='cupertino-icons md-36'>&#xf6e2;</i> &#x2014; Cupertino icon named "line_horizontal_3_decrease". Available on cupertino_icons package 1.0.0+ only.

- **line_horizontal_3_decrease_circle**: `IconData`
  <i class='cupertino-icons md-36'>&#xf6e3;</i> &#x2014; Cupertino icon named "line_horizontal_3_decrease_circle". Available on cupertino_icons package 1.0.0+ only.

- **line_horizontal_3_decrease_circle_fill**: `IconData`
  <i class='cupertino-icons md-36'>&#xf6e4;</i> &#x2014; Cupertino icon named "line_horizontal_3_decrease_circle_fill". Available on cupertino_icons package 1.0.0+ only.

- **link**: `IconData`
  <i class='cupertino-icons md-36'>&#xf6e5;</i> &#x2014; Cupertino icon named "link". Available on cupertino_icons package 1.0.0+ only.

- **link_circle**: `IconData`
  <i class='cupertino-icons md-36'>&#xf6e6;</i> &#x2014; Cupertino icon named "link_circle". Available on cupertino_icons package 1.0.0+ only.

- **link_circle_fill**: `IconData`
  <i class='cupertino-icons md-36'>&#xf6e7;</i> &#x2014; Cupertino icon named "link_circle_fill". Available on cupertino_icons package 1.0.0+ only.

- **list_bullet**: `IconData`
  <i class='cupertino-icons md-36'>&#xf6e8;</i> &#x2014; Cupertino icon named "list_bullet". Available on cupertino_icons package 1.0.0+ only.

- **list_bullet_below_rectangle**: `IconData`
  <i class='cupertino-icons md-36'>&#xf6e9;</i> &#x2014; Cupertino icon named "list_bullet_below_rectangle". Available on cupertino_icons package 1.0.0+ only.

- **list_bullet_indent**: `IconData`
  <i class='cupertino-icons md-36'>&#xf6ea;</i> &#x2014; Cupertino icon named "list_bullet_indent". Available on cupertino_icons package 1.0.0+ only.

- **list_dash**: `IconData`
  <i class='cupertino-icons md-36'>&#xf6eb;</i> &#x2014; Cupertino icon named "list_dash". Available on cupertino_icons package 1.0.0+ only.

- **list_number**: `IconData`
  <i class='cupertino-icons md-36'>&#xf6ec;</i> &#x2014; Cupertino icon named "list_number". Available on cupertino_icons package 1.0.0+ only.

- **list_number_rtl**: `IconData`
  <i class='cupertino-icons md-36'>&#xf6ed;</i> &#x2014; Cupertino icon named "list_number_rtl". Available on cupertino_icons package 1.0.0+ only.

- **location_circle**: `IconData`
  <i class='cupertino-icons md-36'>&#xf6ef;</i> &#x2014; Cupertino icon named "location_circle". Available on cupertino_icons package 1.0.0+ only.

- **location_circle_fill**: `IconData`
  <i class='cupertino-icons md-36'>&#xf6f0;</i> &#x2014; Cupertino icon named "location_circle_fill". Available on cupertino_icons package 1.0.0+ only.

- **location_fill**: `IconData`
  <i class='cupertino-icons md-36'>&#xf6f1;</i> &#x2014; Cupertino icon named "location_fill". Available on cupertino_icons package 1.0.0+ only.

- **location_north**: `IconData`
  <i class='cupertino-icons md-36'>&#xf6f2;</i> &#x2014; Cupertino icon named "location_north". Available on cupertino_icons package 1.0.0+ only.

- **location_north_fill**: `IconData`
  <i class='cupertino-icons md-36'>&#xf6f3;</i> &#x2014; Cupertino icon named "location_north_fill". Available on cupertino_icons package 1.0.0+ only.

- **location_north_line**: `IconData`
  <i class='cupertino-icons md-36'>&#xf6f4;</i> &#x2014; Cupertino icon named "location_north_line". Available on cupertino_icons package 1.0.0+ only.

- **location_north_line_fill**: `IconData`
  <i class='cupertino-icons md-36'>&#xf6f5;</i> &#x2014; Cupertino icon named "location_north_line_fill". Available on cupertino_icons package 1.0.0+ only.

- **location_slash**: `IconData`
  <i class='cupertino-icons md-36'>&#xf6f6;</i> &#x2014; Cupertino icon named "location_slash". Available on cupertino_icons package 1.0.0+ only.

- **location_slash_fill**: `IconData`
  <i class='cupertino-icons md-36'>&#xf6f7;</i> &#x2014; Cupertino icon named "location_slash_fill". Available on cupertino_icons package 1.0.0+ only.

- **lock**: `IconData`
  <i class='cupertino-icons md-36'>&#xf4c8;</i> &#x2014; Cupertino icon named "lock". Available on cupertino_icons package 1.0.0+ only.
 This is the same icon as [padlock] which is available in cupertino_icons 0.1.3.

- **lock_circle**: `IconData`
  <i class='cupertino-icons md-36'>&#xf6f8;</i> &#x2014; Cupertino icon named "lock_circle". Available on cupertino_icons package 1.0.0+ only.

- **lock_circle_fill**: `IconData`
  <i class='cupertino-icons md-36'>&#xf6f9;</i> &#x2014; Cupertino icon named "lock_circle_fill". Available on cupertino_icons package 1.0.0+ only.

- **lock_fill**: `IconData`
  <i class='cupertino-icons md-36'>&#xf4c9;</i> &#x2014; Cupertino icon named "lock_fill". Available on cupertino_icons package 1.0.0+ only.
 This is the same icon as [padlock_solid] which is available in cupertino_icons 0.1.3.

- **lock_open**: `IconData`
  <i class='cupertino-icons md-36'>&#xf6fa;</i> &#x2014; Cupertino icon named "lock_open". Available on cupertino_icons package 1.0.0+ only.

- **lock_open_fill**: `IconData`
  <i class='cupertino-icons md-36'>&#xf6fb;</i> &#x2014; Cupertino icon named "lock_open_fill". Available on cupertino_icons package 1.0.0+ only.

- **lock_rotation**: `IconData`
  <i class='cupertino-icons md-36'>&#xf6fc;</i> &#x2014; Cupertino icon named "lock_rotation". Available on cupertino_icons package 1.0.0+ only.

- **lock_rotation_open**: `IconData`
  <i class='cupertino-icons md-36'>&#xf6fd;</i> &#x2014; Cupertino icon named "lock_rotation_open". Available on cupertino_icons package 1.0.0+ only.

- **lock_shield**: `IconData`
  <i class='cupertino-icons md-36'>&#xf6fe;</i> &#x2014; Cupertino icon named "lock_shield". Available on cupertino_icons package 1.0.0+ only.

- **lock_shield_fill**: `IconData`
  <i class='cupertino-icons md-36'>&#xf6ff;</i> &#x2014; Cupertino icon named "lock_shield_fill". Available on cupertino_icons package 1.0.0+ only.

- **lock_slash**: `IconData`
  <i class='cupertino-icons md-36'>&#xf700;</i> &#x2014; Cupertino icon named "lock_slash". Available on cupertino_icons package 1.0.0+ only.

- **lock_slash_fill**: `IconData`
  <i class='cupertino-icons md-36'>&#xf701;</i> &#x2014; Cupertino icon named "lock_slash_fill". Available on cupertino_icons package 1.0.0+ only.

- **macwindow**: `IconData`
  <i class='cupertino-icons md-36'>&#xf702;</i> &#x2014; Cupertino icon named "macwindow". Available on cupertino_icons package 1.0.0+ only.

- **map**: `IconData`
  <i class='cupertino-icons md-36'>&#xf703;</i> &#x2014; Cupertino icon named "map". Available on cupertino_icons package 1.0.0+ only.

- **map_fill**: `IconData`
  <i class='cupertino-icons md-36'>&#xf704;</i> &#x2014; Cupertino icon named "map_fill". Available on cupertino_icons package 1.0.0+ only.

- **map_pin**: `IconData`
  <i class='cupertino-icons md-36'>&#xf705;</i> &#x2014; Cupertino icon named "map_pin". Available on cupertino_icons package 1.0.0+ only.

- **map_pin_ellipse**: `IconData`
  <i class='cupertino-icons md-36'>&#xf706;</i> &#x2014; Cupertino icon named "map_pin_ellipse". Available on cupertino_icons package 1.0.0+ only.

- **map_pin_slash**: `IconData`
  <i class='cupertino-icons md-36'>&#xf707;</i> &#x2014; Cupertino icon named "map_pin_slash". Available on cupertino_icons package 1.0.0+ only.

- **memories**: `IconData`
  <i class='cupertino-icons md-36'>&#xf708;</i> &#x2014; Cupertino icon named "memories". Available on cupertino_icons package 1.0.0+ only.

- **memories_badge_minus**: `IconData`
  <i class='cupertino-icons md-36'>&#xf709;</i> &#x2014; Cupertino icon named "memories_badge_minus". Available on cupertino_icons package 1.0.0+ only.

- **memories_badge_plus**: `IconData`
  <i class='cupertino-icons md-36'>&#xf70a;</i> &#x2014; Cupertino icon named "memories_badge_plus". Available on cupertino_icons package 1.0.0+ only.

- **metronome**: `IconData`
  <i class='cupertino-icons md-36'>&#xf70b;</i> &#x2014; Cupertino icon named "metronome". Available on cupertino_icons package 1.0.0+ only.

- **mic_circle**: `IconData`
  <i class='cupertino-icons md-36'>&#xf70c;</i> &#x2014; Cupertino icon named "mic_circle". Available on cupertino_icons package 1.0.0+ only.

- **mic_circle_fill**: `IconData`
  <i class='cupertino-icons md-36'>&#xf70d;</i> &#x2014; Cupertino icon named "mic_circle_fill". Available on cupertino_icons package 1.0.0+ only.

- **mic_fill**: `IconData`
  <i class='cupertino-icons md-36'>&#xf461;</i> &#x2014; Cupertino icon named "mic_fill". Available on cupertino_icons package 1.0.0+ only.
 This is the same icon as [mic_solid] which is available in cupertino_icons 0.1.3.

- **mic_slash**: `IconData`
  <i class='cupertino-icons md-36'>&#xf45f;</i> &#x2014; Cupertino icon named "mic_slash". Available on cupertino_icons package 1.0.0+ only.
 This is the same icon as [mic_off] which is available in cupertino_icons 0.1.3.

- **mic_slash_fill**: `IconData`
  <i class='cupertino-icons md-36'>&#xf70e;</i> &#x2014; Cupertino icon named "mic_slash_fill". Available on cupertino_icons package 1.0.0+ only.

- **minus**: `IconData`
  <i class='cupertino-icons md-36'>&#xf70f;</i> &#x2014; Cupertino icon named "minus". Available on cupertino_icons package 1.0.0+ only.

- **minus_circle**: `IconData`
  <i class='cupertino-icons md-36'>&#xf463;</i> &#x2014; Cupertino icon named "minus_circle". Available on cupertino_icons package 1.0.0+ only.
 This is the same icon as [minus_circled] which is available in cupertino_icons 0.1.3.

- **minus_circle_fill**: `IconData`
  <i class='cupertino-icons md-36'>&#xf710;</i> &#x2014; Cupertino icon named "minus_circle_fill". Available on cupertino_icons package 1.0.0+ only.

- **minus_rectangle**: `IconData`
  <i class='cupertino-icons md-36'>&#xf711;</i> &#x2014; Cupertino icon named "minus_rectangle". Available on cupertino_icons package 1.0.0+ only.

- **minus_rectangle_fill**: `IconData`
  <i class='cupertino-icons md-36'>&#xf712;</i> &#x2014; Cupertino icon named "minus_rectangle_fill". Available on cupertino_icons package 1.0.0+ only.

- **minus_slash_plus**: `IconData`
  <i class='cupertino-icons md-36'>&#xf713;</i> &#x2014; Cupertino icon named "minus_slash_plus". Available on cupertino_icons package 1.0.0+ only.

- **minus_square**: `IconData`
  <i class='cupertino-icons md-36'>&#xf714;</i> &#x2014; Cupertino icon named "minus_square". Available on cupertino_icons package 1.0.0+ only.

- **minus_square_fill**: `IconData`
  <i class='cupertino-icons md-36'>&#xf715;</i> &#x2014; Cupertino icon named "minus_square_fill". Available on cupertino_icons package 1.0.0+ only.

- **money_dollar**: `IconData`
  <i class='cupertino-icons md-36'>&#xf8e9;</i> &#x2014; Cupertino icon named "money_dollar". Available on cupertino_icons package 1.0.0+ only.

- **money_dollar_circle**: `IconData`
  <i class='cupertino-icons md-36'>&#xf8ea;</i> &#x2014; Cupertino icon named "money_dollar_circle". Available on cupertino_icons package 1.0.0+ only.

- **money_dollar_circle_fill**: `IconData`
  <i class='cupertino-icons md-36'>&#xf8eb;</i> &#x2014; Cupertino icon named "money_dollar_circle_fill". Available on cupertino_icons package 1.0.0+ only.

- **money_euro**: `IconData`
  <i class='cupertino-icons md-36'>&#xf8ec;</i> &#x2014; Cupertino icon named "money_euro". Available on cupertino_icons package 1.0.0+ only.

- **money_euro_circle**: `IconData`
  <i class='cupertino-icons md-36'>&#xf8ed;</i> &#x2014; Cupertino icon named "money_euro_circle". Available on cupertino_icons package 1.0.0+ only.

- **money_euro_circle_fill**: `IconData`
  <i class='cupertino-icons md-36'>&#xf8ee;</i> &#x2014; Cupertino icon named "money_euro_circle_fill". Available on cupertino_icons package 1.0.0+ only.

- **money_pound**: `IconData`
  <i class='cupertino-icons md-36'>&#xf8ef;</i> &#x2014; Cupertino icon named "money_pound". Available on cupertino_icons package 1.0.0+ only.

- **money_pound_circle**: `IconData`
  <i class='cupertino-icons md-36'>&#xf8f0;</i> &#x2014; Cupertino icon named "money_pound_circle". Available on cupertino_icons package 1.0.0+ only.

- **money_pound_circle_fill**: `IconData`
  <i class='cupertino-icons md-36'>&#xf8f1;</i> &#x2014; Cupertino icon named "money_pound_circle_fill". Available on cupertino_icons package 1.0.0+ only.

- **money_rubl**: `IconData`
  <i class='cupertino-icons md-36'>&#xf8f2;</i> &#x2014; Cupertino icon named "money_rubl". Available on cupertino_icons package 1.0.0+ only.

- **money_rubl_circle**: `IconData`
  <i class='cupertino-icons md-36'>&#xf8f3;</i> &#x2014; Cupertino icon named "money_rubl_circle". Available on cupertino_icons package 1.0.0+ only.

- **money_rubl_circle_fill**: `IconData`
  <i class='cupertino-icons md-36'>&#xf8f4;</i> &#x2014; Cupertino icon named "money_rubl_circle_fill". Available on cupertino_icons package 1.0.0+ only.

- **money_yen**: `IconData`
  <i class='cupertino-icons md-36'>&#xf8f5;</i> &#x2014; Cupertino icon named "money_yen". Available on cupertino_icons package 1.0.0+ only.

- **money_yen_circle**: `IconData`
  <i class='cupertino-icons md-36'>&#xf8f6;</i> &#x2014; Cupertino icon named "money_yen_circle". Available on cupertino_icons package 1.0.0+ only.

- **money_yen_circle_fill**: `IconData`
  <i class='cupertino-icons md-36'>&#xf8f7;</i> &#x2014; Cupertino icon named "money_yen_circle_fill". Available on cupertino_icons package 1.0.0+ only.

- **moon**: `IconData`
  <i class='cupertino-icons md-36'>&#xf716;</i> &#x2014; Cupertino icon named "moon". Available on cupertino_icons package 1.0.0+ only.

- **moon_circle**: `IconData`
  <i class='cupertino-icons md-36'>&#xf717;</i> &#x2014; Cupertino icon named "moon_circle". Available on cupertino_icons package 1.0.0+ only.

- **moon_circle_fill**: `IconData`
  <i class='cupertino-icons md-36'>&#xf718;</i> &#x2014; Cupertino icon named "moon_circle_fill". Available on cupertino_icons package 1.0.0+ only.

- **moon_fill**: `IconData`
  <i class='cupertino-icons md-36'>&#xf719;</i> &#x2014; Cupertino icon named "moon_fill". Available on cupertino_icons package 1.0.0+ only.

- **moon_stars**: `IconData`
  <i class='cupertino-icons md-36'>&#xf71a;</i> &#x2014; Cupertino icon named "moon_stars". Available on cupertino_icons package 1.0.0+ only.

- **moon_stars_fill**: `IconData`
  <i class='cupertino-icons md-36'>&#xf71b;</i> &#x2014; Cupertino icon named "moon_stars_fill". Available on cupertino_icons package 1.0.0+ only.

- **moon_zzz**: `IconData`
  <i class='cupertino-icons md-36'>&#xf71c;</i> &#x2014; Cupertino icon named "moon_zzz". Available on cupertino_icons package 1.0.0+ only.

- **moon_zzz_fill**: `IconData`
  <i class='cupertino-icons md-36'>&#xf71d;</i> &#x2014; Cupertino icon named "moon_zzz_fill". Available on cupertino_icons package 1.0.0+ only.

- **move**: `IconData`
  <i class='cupertino-icons md-36'>&#xf8f8;</i> &#x2014; Cupertino icon named "move". Available on cupertino_icons package 1.0.0+ only.

- **multiply**: `IconData`
  <i class='cupertino-icons md-36'>&#xf71e;</i> &#x2014; Cupertino icon named "multiply". Available on cupertino_icons package 1.0.0+ only.

- **multiply_circle**: `IconData`
  <i class='cupertino-icons md-36'>&#xf71f;</i> &#x2014; Cupertino icon named "multiply_circle". Available on cupertino_icons package 1.0.0+ only.

- **multiply_circle_fill**: `IconData`
  <i class='cupertino-icons md-36'>&#xf720;</i> &#x2014; Cupertino icon named "multiply_circle_fill". Available on cupertino_icons package 1.0.0+ only.

- **multiply_square**: `IconData`
  <i class='cupertino-icons md-36'>&#xf721;</i> &#x2014; Cupertino icon named "multiply_square". Available on cupertino_icons package 1.0.0+ only.

- **multiply_square_fill**: `IconData`
  <i class='cupertino-icons md-36'>&#xf722;</i> &#x2014; Cupertino icon named "multiply_square_fill". Available on cupertino_icons package 1.0.0+ only.

- **music_albums**: `IconData`
  <i class='cupertino-icons md-36'>&#xf8f9;</i> &#x2014; Cupertino icon named "music_albums". Available on cupertino_icons package 1.0.0+ only.

- **music_albums_fill**: `IconData`
  <i class='cupertino-icons md-36'>&#xf8fa;</i> &#x2014; Cupertino icon named "music_albums_fill". Available on cupertino_icons package 1.0.0+ only.

- **music_house**: `IconData`
  <i class='cupertino-icons md-36'>&#xf723;</i> &#x2014; Cupertino icon named "music_house". Available on cupertino_icons package 1.0.0+ only.

- **music_house_fill**: `IconData`
  <i class='cupertino-icons md-36'>&#xf724;</i> &#x2014; Cupertino icon named "music_house_fill". Available on cupertino_icons package 1.0.0+ only.

- **music_mic**: `IconData`
  <i class='cupertino-icons md-36'>&#xf725;</i> &#x2014; Cupertino icon named "music_mic". Available on cupertino_icons package 1.0.0+ only.

- **music_note_2**: `IconData`
  <i class='cupertino-icons md-36'>&#xf46c;</i> &#x2014; Cupertino icon named "music_note_2". Available on cupertino_icons package 1.0.0+ only.
 This is the same icon as [double_music_note] which is available in cupertino_icons 0.1.3.

- **music_note_list**: `IconData`
  <i class='cupertino-icons md-36'>&#xf726;</i> &#x2014; Cupertino icon named "music_note_list". Available on cupertino_icons package 1.0.0+ only.

- **nosign**: `IconData`
  <i class='cupertino-icons md-36'>&#xf727;</i> &#x2014; Cupertino icon named "nosign". Available on cupertino_icons package 1.0.0+ only.

- **number**: `IconData`
  <i class='cupertino-icons md-36'>&#xf728;</i> &#x2014; Cupertino icon named "number". Available on cupertino_icons package 1.0.0+ only.

- **number_circle**: `IconData`
  <i class='cupertino-icons md-36'>&#xf729;</i> &#x2014; Cupertino icon named "number_circle". Available on cupertino_icons package 1.0.0+ only.

- **number_circle_fill**: `IconData`
  <i class='cupertino-icons md-36'>&#xf72a;</i> &#x2014; Cupertino icon named "number_circle_fill". Available on cupertino_icons package 1.0.0+ only.

- **number_square**: `IconData`
  <i class='cupertino-icons md-36'>&#xf72b;</i> &#x2014; Cupertino icon named "number_square". Available on cupertino_icons package 1.0.0+ only.

- **number_square_fill**: `IconData`
  <i class='cupertino-icons md-36'>&#xf72c;</i> &#x2014; Cupertino icon named "number_square_fill". Available on cupertino_icons package 1.0.0+ only.

- **option**: `IconData`
  <i class='cupertino-icons md-36'>&#xf72d;</i> &#x2014; Cupertino icon named "option". Available on cupertino_icons package 1.0.0+ only.

- **paintbrush**: `IconData`
  <i class='cupertino-icons md-36'>&#xf72e;</i> &#x2014; Cupertino icon named "paintbrush". Available on cupertino_icons package 1.0.0+ only.

- **paintbrush_fill**: `IconData`
  <i class='cupertino-icons md-36'>&#xf72f;</i> &#x2014; Cupertino icon named "paintbrush_fill". Available on cupertino_icons package 1.0.0+ only.

- **pano**: `IconData`
  <i class='cupertino-icons md-36'>&#xf730;</i> &#x2014; Cupertino icon named "pano". Available on cupertino_icons package 1.0.0+ only.

- **pano_fill**: `IconData`
  <i class='cupertino-icons md-36'>&#xf731;</i> &#x2014; Cupertino icon named "pano_fill". Available on cupertino_icons package 1.0.0+ only.

- **paperclip**: `IconData`
  <i class='cupertino-icons md-36'>&#xf732;</i> &#x2014; Cupertino icon named "paperclip". Available on cupertino_icons package 1.0.0+ only.

- **paperplane**: `IconData`
  <i class='cupertino-icons md-36'>&#xf733;</i> &#x2014; Cupertino icon named "paperplane". Available on cupertino_icons package 1.0.0+ only.

- **paperplane_fill**: `IconData`
  <i class='cupertino-icons md-36'>&#xf734;</i> &#x2014; Cupertino icon named "paperplane_fill". Available on cupertino_icons package 1.0.0+ only.

- **paragraph**: `IconData`
  <i class='cupertino-icons md-36'>&#xf735;</i> &#x2014; Cupertino icon named "paragraph". Available on cupertino_icons package 1.0.0+ only.

- **pause_circle**: `IconData`
  <i class='cupertino-icons md-36'>&#xf736;</i> &#x2014; Cupertino icon named "pause_circle". Available on cupertino_icons package 1.0.0+ only.

- **pause_circle_fill**: `IconData`
  <i class='cupertino-icons md-36'>&#xf737;</i> &#x2014; Cupertino icon named "pause_circle_fill". Available on cupertino_icons package 1.0.0+ only.

- **pause_fill**: `IconData`
  <i class='cupertino-icons md-36'>&#xf478;</i> &#x2014; Cupertino icon named "pause_fill". Available on cupertino_icons package 1.0.0+ only.
 This is the same icon as [pause_solid] which is available in cupertino_icons 0.1.3.

- **pause_rectangle**: `IconData`
  <i class='cupertino-icons md-36'>&#xf738;</i> &#x2014; Cupertino icon named "pause_rectangle". Available on cupertino_icons package 1.0.0+ only.

- **pause_rectangle_fill**: `IconData`
  <i class='cupertino-icons md-36'>&#xf739;</i> &#x2014; Cupertino icon named "pause_rectangle_fill". Available on cupertino_icons package 1.0.0+ only.

- **pencil_circle**: `IconData`
  <i class='cupertino-icons md-36'>&#xf73a;</i> &#x2014; Cupertino icon named "pencil_circle". Available on cupertino_icons package 1.0.0+ only.

- **pencil_circle_fill**: `IconData`
  <i class='cupertino-icons md-36'>&#xf73b;</i> &#x2014; Cupertino icon named "pencil_circle_fill". Available on cupertino_icons package 1.0.0+ only.

- **pencil_ellipsis_rectangle**: `IconData`
  <i class='cupertino-icons md-36'>&#xf73c;</i> &#x2014; Cupertino icon named "pencil_ellipsis_rectangle". Available on cupertino_icons package 1.0.0+ only.

- **pencil_outline**: `IconData`
  <i class='cupertino-icons md-36'>&#xf73d;</i> &#x2014; Cupertino icon named "pencil_outline". Available on cupertino_icons package 1.0.0+ only.

- **pencil_slash**: `IconData`
  <i class='cupertino-icons md-36'>&#xf73e;</i> &#x2014; Cupertino icon named "pencil_slash". Available on cupertino_icons package 1.0.0+ only.

- **percent**: `IconData`
  <i class='cupertino-icons md-36'>&#xf73f;</i> &#x2014; Cupertino icon named "percent". Available on cupertino_icons package 1.0.0+ only.

- **person_2**: `IconData`
  <i class='cupertino-icons md-36'>&#xf740;</i> &#x2014; Cupertino icon named "person_2". Available on cupertino_icons package 1.0.0+ only.

- **person_2_alt**: `IconData`
  <i class='cupertino-icons md-36'>&#xf8fb;</i> &#x2014; Cupertino icon named "person_2_alt". Available on cupertino_icons package 1.0.0+ only.

- **person_2_fill**: `IconData`
  <i class='cupertino-icons md-36'>&#xf741;</i> &#x2014; Cupertino icon named "person_2_fill". Available on cupertino_icons package 1.0.0+ only.

- **person_2_square_stack**: `IconData`
  <i class='cupertino-icons md-36'>&#xf742;</i> &#x2014; Cupertino icon named "person_2_square_stack". Available on cupertino_icons package 1.0.0+ only.

- **person_2_square_stack_fill**: `IconData`
  <i class='cupertino-icons md-36'>&#xf743;</i> &#x2014; Cupertino icon named "person_2_square_stack_fill". Available on cupertino_icons package 1.0.0+ only.

- **person_3**: `IconData`
  <i class='cupertino-icons md-36'>&#xf47b;</i> &#x2014; Cupertino icon named "person_3". Available on cupertino_icons package 1.0.0+ only.
 This is the same icon as [group] which is available in cupertino_icons 0.1.3.

- **person_3_fill**: `IconData`
  <i class='cupertino-icons md-36'>&#xf47c;</i> &#x2014; Cupertino icon named "person_3_fill". Available on cupertino_icons package 1.0.0+ only.
 This is the same icon as [group_solid] which is available in cupertino_icons 0.1.3.

- **person_alt**: `IconData`
  <i class='cupertino-icons md-36'>&#xf8fc;</i> &#x2014; Cupertino icon named "person_alt". Available on cupertino_icons package 1.0.0+ only.

- **person_alt_circle**: `IconData`
  <i class='cupertino-icons md-36'>&#xf8fd;</i> &#x2014; Cupertino icon named "person_alt_circle". Available on cupertino_icons package 1.0.0+ only.

- **person_alt_circle_fill**: `IconData`
  <i class='cupertino-icons md-36'>&#xf8fe;</i> &#x2014; Cupertino icon named "person_alt_circle_fill". Available on cupertino_icons package 1.0.0+ only.

- **person_badge_minus**: `IconData`
  <i class='cupertino-icons md-36'>&#xf744;</i> &#x2014; Cupertino icon named "person_badge_minus". Available on cupertino_icons package 1.0.0+ only.

- **person_badge_minus_fill**: `IconData`
  <i class='cupertino-icons md-36'>&#xf745;</i> &#x2014; Cupertino icon named "person_badge_minus_fill". Available on cupertino_icons package 1.0.0+ only.

- **person_badge_plus**: `IconData`
  <i class='cupertino-icons md-36'>&#xf47f;</i> &#x2014; Cupertino icon named "person_badge_plus". Available on cupertino_icons package 1.0.0+ only.
 This is the same icon as [person_add] which is available in cupertino_icons 0.1.3.

- **person_badge_plus_fill**: `IconData`
  <i class='cupertino-icons md-36'>&#xf480;</i> &#x2014; Cupertino icon named "person_badge_plus_fill". Available on cupertino_icons package 1.0.0+ only.
 This is the same icon as [person_add_solid] which is available in cupertino_icons 0.1.3.

- **person_circle**: `IconData`
  <i class='cupertino-icons md-36'>&#xf746;</i> &#x2014; Cupertino icon named "person_circle". Available on cupertino_icons package 1.0.0+ only.

- **person_circle_fill**: `IconData`
  <i class='cupertino-icons md-36'>&#xf747;</i> &#x2014; Cupertino icon named "person_circle_fill". Available on cupertino_icons package 1.0.0+ only.

- **person_crop_circle**: `IconData`
  <i class='cupertino-icons md-36'>&#xf419;</i> &#x2014; Cupertino icon named "person_crop_circle". Available on cupertino_icons package 1.0.0+ only.
 This is the same icon as [profile_circled] which is available in cupertino_icons 0.1.3.

- **person_crop_circle_badge_checkmark**: `IconData`
  <i class='cupertino-icons md-36'>&#xf748;</i> &#x2014; Cupertino icon named "person_crop_circle_badge_checkmark". Available on cupertino_icons package 1.0.0+ only.

- **person_crop_circle_badge_exclam**: `IconData`
  <i class='cupertino-icons md-36'>&#xf749;</i> &#x2014; Cupertino icon named "person_crop_circle_badge_exclam". Available on cupertino_icons package 1.0.0+ only.

- **person_crop_circle_badge_minus**: `IconData`
  <i class='cupertino-icons md-36'>&#xf74a;</i> &#x2014; Cupertino icon named "person_crop_circle_badge_minus". Available on cupertino_icons package 1.0.0+ only.

- **person_crop_circle_badge_plus**: `IconData`
  <i class='cupertino-icons md-36'>&#xf74b;</i> &#x2014; Cupertino icon named "person_crop_circle_badge_plus". Available on cupertino_icons package 1.0.0+ only.

- **person_crop_circle_badge_xmark**: `IconData`
  <i class='cupertino-icons md-36'>&#xf74c;</i> &#x2014; Cupertino icon named "person_crop_circle_badge_xmark". Available on cupertino_icons package 1.0.0+ only.

- **person_crop_circle_fill**: `IconData`
  <i class='cupertino-icons md-36'>&#xf74d;</i> &#x2014; Cupertino icon named "person_crop_circle_fill". Available on cupertino_icons package 1.0.0+ only.

- **person_crop_circle_fill_badge_checkmark**: `IconData`
  <i class='cupertino-icons md-36'>&#xf74e;</i> &#x2014; Cupertino icon named "person_crop_circle_fill_badge_checkmark". Available on cupertino_icons package 1.0.0+ only.

- **person_crop_circle_fill_badge_exclam**: `IconData`
  <i class='cupertino-icons md-36'>&#xf74f;</i> &#x2014; Cupertino icon named "person_crop_circle_fill_badge_exclam". Available on cupertino_icons package 1.0.0+ only.

- **person_crop_circle_fill_badge_minus**: `IconData`
  <i class='cupertino-icons md-36'>&#xf750;</i> &#x2014; Cupertino icon named "person_crop_circle_fill_badge_minus". Available on cupertino_icons package 1.0.0+ only.

- **person_crop_circle_fill_badge_plus**: `IconData`
  <i class='cupertino-icons md-36'>&#xf751;</i> &#x2014; Cupertino icon named "person_crop_circle_fill_badge_plus". Available on cupertino_icons package 1.0.0+ only.

- **person_crop_circle_fill_badge_xmark**: `IconData`
  <i class='cupertino-icons md-36'>&#xf752;</i> &#x2014; Cupertino icon named "person_crop_circle_fill_badge_xmark". Available on cupertino_icons package 1.0.0+ only.

- **person_crop_rectangle**: `IconData`
  <i class='cupertino-icons md-36'>&#xf753;</i> &#x2014; Cupertino icon named "person_crop_rectangle". Available on cupertino_icons package 1.0.0+ only.

- **person_crop_rectangle_fill**: `IconData`
  <i class='cupertino-icons md-36'>&#xf754;</i> &#x2014; Cupertino icon named "person_crop_rectangle_fill". Available on cupertino_icons package 1.0.0+ only.

- **person_crop_square**: `IconData`
  <i class='cupertino-icons md-36'>&#xf755;</i> &#x2014; Cupertino icon named "person_crop_square". Available on cupertino_icons package 1.0.0+ only.

- **person_crop_square_fill**: `IconData`
  <i class='cupertino-icons md-36'>&#xf756;</i> &#x2014; Cupertino icon named "person_crop_square_fill". Available on cupertino_icons package 1.0.0+ only.

- **person_fill**: `IconData`
  <i class='cupertino-icons md-36'>&#xf47e;</i> &#x2014; Cupertino icon named "person_fill". Available on cupertino_icons package 1.0.0+ only.
 This is the same icon as [person_solid] which is available in cupertino_icons 0.1.3.

- **personalhotspot**: `IconData`
  <i class='cupertino-icons md-36'>&#xf757;</i> &#x2014; Cupertino icon named "personalhotspot". Available on cupertino_icons package 1.0.0+ only.

- **perspective**: `IconData`
  <i class='cupertino-icons md-36'>&#xf758;</i> &#x2014; Cupertino icon named "perspective". Available on cupertino_icons package 1.0.0+ only.

- **phone_arrow_down_left**: `IconData`
  <i class='cupertino-icons md-36'>&#xf759;</i> &#x2014; Cupertino icon named "phone_arrow_down_left". Available on cupertino_icons package 1.0.0+ only.

- **phone_arrow_right**: `IconData`
  <i class='cupertino-icons md-36'>&#xf75a;</i> &#x2014; Cupertino icon named "phone_arrow_right". Available on cupertino_icons package 1.0.0+ only.

- **phone_arrow_up_right**: `IconData`
  <i class='cupertino-icons md-36'>&#xf75b;</i> &#x2014; Cupertino icon named "phone_arrow_up_right". Available on cupertino_icons package 1.0.0+ only.

- **phone_badge_plus**: `IconData`
  <i class='cupertino-icons md-36'>&#xf75c;</i> &#x2014; Cupertino icon named "phone_badge_plus". Available on cupertino_icons package 1.0.0+ only.

- **phone_circle**: `IconData`
  <i class='cupertino-icons md-36'>&#xf75d;</i> &#x2014; Cupertino icon named "phone_circle". Available on cupertino_icons package 1.0.0+ only.

- **phone_circle_fill**: `IconData`
  <i class='cupertino-icons md-36'>&#xf75e;</i> &#x2014; Cupertino icon named "phone_circle_fill". Available on cupertino_icons package 1.0.0+ only.

- **phone_down**: `IconData`
  <i class='cupertino-icons md-36'>&#xf75f;</i> &#x2014; Cupertino icon named "phone_down". Available on cupertino_icons package 1.0.0+ only.

- **phone_down_circle**: `IconData`
  <i class='cupertino-icons md-36'>&#xf760;</i> &#x2014; Cupertino icon named "phone_down_circle". Available on cupertino_icons package 1.0.0+ only.

- **phone_down_circle_fill**: `IconData`
  <i class='cupertino-icons md-36'>&#xf761;</i> &#x2014; Cupertino icon named "phone_down_circle_fill". Available on cupertino_icons package 1.0.0+ only.

- **phone_down_fill**: `IconData`
  <i class='cupertino-icons md-36'>&#xf762;</i> &#x2014; Cupertino icon named "phone_down_fill". Available on cupertino_icons package 1.0.0+ only.

- **phone_fill**: `IconData`
  <i class='cupertino-icons md-36'>&#xf4b9;</i> &#x2014; Cupertino icon named "phone_fill". Available on cupertino_icons package 1.0.0+ only.
 This is the same icon as [phone_solid] which is available in cupertino_icons 0.1.3.

- **phone_fill_arrow_down_left**: `IconData`
  <i class='cupertino-icons md-36'>&#xf763;</i> &#x2014; Cupertino icon named "phone_fill_arrow_down_left". Available on cupertino_icons package 1.0.0+ only.

- **phone_fill_arrow_right**: `IconData`
  <i class='cupertino-icons md-36'>&#xf764;</i> &#x2014; Cupertino icon named "phone_fill_arrow_right". Available on cupertino_icons package 1.0.0+ only.

- **phone_fill_arrow_up_right**: `IconData`
  <i class='cupertino-icons md-36'>&#xf765;</i> &#x2014; Cupertino icon named "phone_fill_arrow_up_right". Available on cupertino_icons package 1.0.0+ only.

- **phone_fill_badge_plus**: `IconData`
  <i class='cupertino-icons md-36'>&#xf766;</i> &#x2014; Cupertino icon named "phone_fill_badge_plus". Available on cupertino_icons package 1.0.0+ only.

- **photo**: `IconData`
  <i class='cupertino-icons md-36'>&#xf767;</i> &#x2014; Cupertino icon named "photo". Available on cupertino_icons package 1.0.0+ only.

- **photo_fill**: `IconData`
  <i class='cupertino-icons md-36'>&#xf768;</i> &#x2014; Cupertino icon named "photo_fill". Available on cupertino_icons package 1.0.0+ only.

- **photo_fill_on_rectangle_fill**: `IconData`
  <i class='cupertino-icons md-36'>&#xf769;</i> &#x2014; Cupertino icon named "photo_fill_on_rectangle_fill". Available on cupertino_icons package 1.0.0+ only.

- **photo_on_rectangle**: `IconData`
  <i class='cupertino-icons md-36'>&#xf76a;</i> &#x2014; Cupertino icon named "photo_on_rectangle". Available on cupertino_icons package 1.0.0+ only.

- **piano**: `IconData`
  <i class='cupertino-icons md-36'>&#xf8ff;</i> &#x2014; Cupertino icon named "piano". Available on cupertino_icons package 1.0.0+ only.

- **pin**: `IconData`
  <i class='cupertino-icons md-36'>&#xf76b;</i> &#x2014; Cupertino icon named "pin". Available on cupertino_icons package 1.0.0+ only.

- **pin_fill**: `IconData`
  <i class='cupertino-icons md-36'>&#xf76c;</i> &#x2014; Cupertino icon named "pin_fill". Available on cupertino_icons package 1.0.0+ only.

- **pin_slash**: `IconData`
  <i class='cupertino-icons md-36'>&#xf76d;</i> &#x2014; Cupertino icon named "pin_slash". Available on cupertino_icons package 1.0.0+ only.

- **pin_slash_fill**: `IconData`
  <i class='cupertino-icons md-36'>&#xf76e;</i> &#x2014; Cupertino icon named "pin_slash_fill". Available on cupertino_icons package 1.0.0+ only.

- **placemark**: `IconData`
  <i class='cupertino-icons md-36'>&#xf455;</i> &#x2014; Cupertino icon named "placemark". Available on cupertino_icons package 1.0.0+ only.
 This is the same icon as [location] which is available in cupertino_icons 0.1.3.

- **placemark_fill**: `IconData`
  <i class='cupertino-icons md-36'>&#xf456;</i> &#x2014; Cupertino icon named "placemark_fill". Available on cupertino_icons package 1.0.0+ only.
 This is the same icon as [location_solid] which is available in cupertino_icons 0.1.3.

- **play**: `IconData`
  <i class='cupertino-icons md-36'>&#xf487;</i> &#x2014; Cupertino icon named "play". Available on cupertino_icons package 1.0.0+ only.
 This is the same icon as [play_arrow] which is available in cupertino_icons 0.1.3.

- **play_circle**: `IconData`
  <i class='cupertino-icons md-36'>&#xf76f;</i> &#x2014; Cupertino icon named "play_circle". Available on cupertino_icons package 1.0.0+ only.

- **play_circle_fill**: `IconData`
  <i class='cupertino-icons md-36'>&#xf770;</i> &#x2014; Cupertino icon named "play_circle_fill". Available on cupertino_icons package 1.0.0+ only.

- **play_fill**: `IconData`
  <i class='cupertino-icons md-36'>&#xf488;</i> &#x2014; Cupertino icon named "play_fill". Available on cupertino_icons package 1.0.0+ only.
 This is the same icon as [play_arrow_solid] which is available in cupertino_icons 0.1.3.

- **play_rectangle**: `IconData`
  <i class='cupertino-icons md-36'>&#xf771;</i> &#x2014; Cupertino icon named "play_rectangle". Available on cupertino_icons package 1.0.0+ only.

- **play_rectangle_fill**: `IconData`
  <i class='cupertino-icons md-36'>&#xf772;</i> &#x2014; Cupertino icon named "play_rectangle_fill". Available on cupertino_icons package 1.0.0+ only.

- **playpause**: `IconData`
  <i class='cupertino-icons md-36'>&#xf773;</i> &#x2014; Cupertino icon named "playpause". Available on cupertino_icons package 1.0.0+ only.

- **playpause_fill**: `IconData`
  <i class='cupertino-icons md-36'>&#xf774;</i> &#x2014; Cupertino icon named "playpause_fill". Available on cupertino_icons package 1.0.0+ only.

- **plus**: `IconData`
  <i class='cupertino-icons md-36'>&#xf489;</i> &#x2014; Cupertino icon named "plus". Available on cupertino_icons package 1.0.0+ only.
 This is the same icon as [add] which is available in cupertino_icons 0.1.3.

- **plus_app**: `IconData`
  <i class='cupertino-icons md-36'>&#xf775;</i> &#x2014; Cupertino icon named "plus_app". Available on cupertino_icons package 1.0.0+ only.

- **plus_app_fill**: `IconData`
  <i class='cupertino-icons md-36'>&#xf776;</i> &#x2014; Cupertino icon named "plus_app_fill". Available on cupertino_icons package 1.0.0+ only.

- **plus_bubble**: `IconData`
  <i class='cupertino-icons md-36'>&#xf777;</i> &#x2014; Cupertino icon named "plus_bubble". Available on cupertino_icons package 1.0.0+ only.

- **plus_bubble_fill**: `IconData`
  <i class='cupertino-icons md-36'>&#xf778;</i> &#x2014; Cupertino icon named "plus_bubble_fill". Available on cupertino_icons package 1.0.0+ only.

- **plus_circle**: `IconData`
  <i class='cupertino-icons md-36'>&#xf48a;</i> &#x2014; Cupertino icon named "plus_circle". Available on cupertino_icons package 1.0.0+ only.
 This is the same icon as [plus_circled] which is available in cupertino_icons 0.1.3.
 This is the same icon as [add_circled] which is available in cupertino_icons 0.1.3.

- **plus_circle_fill**: `IconData`
  <i class='cupertino-icons md-36'>&#xf48b;</i> &#x2014; Cupertino icon named "plus_circle_fill". Available on cupertino_icons package 1.0.0+ only.
 This is the same icon as [add_circled_solid] which is available in cupertino_icons 0.1.3.

- **plus_rectangle**: `IconData`
  <i class='cupertino-icons md-36'>&#xf779;</i> &#x2014; Cupertino icon named "plus_rectangle". Available on cupertino_icons package 1.0.0+ only.

- **plus_rectangle_fill**: `IconData`
  <i class='cupertino-icons md-36'>&#xf77a;</i> &#x2014; Cupertino icon named "plus_rectangle_fill". Available on cupertino_icons package 1.0.0+ only.

- **plus_rectangle_fill_on_rectangle_fill**: `IconData`
  <i class='cupertino-icons md-36'>&#xf77b;</i> &#x2014; Cupertino icon named "plus_rectangle_fill_on_rectangle_fill". Available on cupertino_icons package 1.0.0+ only.

- **plus_rectangle_on_rectangle**: `IconData`
  <i class='cupertino-icons md-36'>&#xf77c;</i> &#x2014; Cupertino icon named "plus_rectangle_on_rectangle". Available on cupertino_icons package 1.0.0+ only.

- **plus_slash_minus**: `IconData`
  <i class='cupertino-icons md-36'>&#xf77d;</i> &#x2014; Cupertino icon named "plus_slash_minus". Available on cupertino_icons package 1.0.0+ only.

- **plus_square**: `IconData`
  <i class='cupertino-icons md-36'>&#xf77e;</i> &#x2014; Cupertino icon named "plus_square". Available on cupertino_icons package 1.0.0+ only.

- **plus_square_fill**: `IconData`
  <i class='cupertino-icons md-36'>&#xf77f;</i> &#x2014; Cupertino icon named "plus_square_fill". Available on cupertino_icons package 1.0.0+ only.

- **plus_square_fill_on_square_fill**: `IconData`
  <i class='cupertino-icons md-36'>&#xf780;</i> &#x2014; Cupertino icon named "plus_square_fill_on_square_fill". Available on cupertino_icons package 1.0.0+ only.

- **plus_square_on_square**: `IconData`
  <i class='cupertino-icons md-36'>&#xf781;</i> &#x2014; Cupertino icon named "plus_square_on_square". Available on cupertino_icons package 1.0.0+ only.

- **plusminus**: `IconData`
  <i class='cupertino-icons md-36'>&#xf782;</i> &#x2014; Cupertino icon named "plusminus". Available on cupertino_icons package 1.0.0+ only.

- **plusminus_circle**: `IconData`
  <i class='cupertino-icons md-36'>&#xf783;</i> &#x2014; Cupertino icon named "plusminus_circle". Available on cupertino_icons package 1.0.0+ only.

- **plusminus_circle_fill**: `IconData`
  <i class='cupertino-icons md-36'>&#xf784;</i> &#x2014; Cupertino icon named "plusminus_circle_fill". Available on cupertino_icons package 1.0.0+ only.

- **power**: `IconData`
  <i class='cupertino-icons md-36'>&#xf785;</i> &#x2014; Cupertino icon named "power". Available on cupertino_icons package 1.0.0+ only.

- **printer**: `IconData`
  <i class='cupertino-icons md-36'>&#xf786;</i> &#x2014; Cupertino icon named "printer". Available on cupertino_icons package 1.0.0+ only.

- **printer_fill**: `IconData`
  <i class='cupertino-icons md-36'>&#xf787;</i> &#x2014; Cupertino icon named "printer_fill". Available on cupertino_icons package 1.0.0+ only.

- **projective**: `IconData`
  <i class='cupertino-icons md-36'>&#xf788;</i> &#x2014; Cupertino icon named "projective". Available on cupertino_icons package 1.0.0+ only.

- **purchased**: `IconData`
  <i class='cupertino-icons md-36'>&#xf789;</i> &#x2014; Cupertino icon named "purchased". Available on cupertino_icons package 1.0.0+ only.

- **purchased_circle**: `IconData`
  <i class='cupertino-icons md-36'>&#xf78a;</i> &#x2014; Cupertino icon named "purchased_circle". Available on cupertino_icons package 1.0.0+ only.

- **purchased_circle_fill**: `IconData`
  <i class='cupertino-icons md-36'>&#xf78b;</i> &#x2014; Cupertino icon named "purchased_circle_fill". Available on cupertino_icons package 1.0.0+ only.

- **qrcode**: `IconData`
  <i class='cupertino-icons md-36'>&#xf78c;</i> &#x2014; Cupertino icon named "qrcode". Available on cupertino_icons package 1.0.0+ only.

- **qrcode_viewfinder**: `IconData`
  <i class='cupertino-icons md-36'>&#xf78d;</i> &#x2014; Cupertino icon named "qrcode_viewfinder". Available on cupertino_icons package 1.0.0+ only.

- **question**: `IconData`
  <i class='cupertino-icons md-36'>&#xf78e;</i> &#x2014; Cupertino icon named "question". Available on cupertino_icons package 1.0.0+ only.

- **question_circle**: `IconData`
  <i class='cupertino-icons md-36'>&#xf78f;</i> &#x2014; Cupertino icon named "question_circle". Available on cupertino_icons package 1.0.0+ only.

- **question_circle_fill**: `IconData`
  <i class='cupertino-icons md-36'>&#xf790;</i> &#x2014; Cupertino icon named "question_circle_fill". Available on cupertino_icons package 1.0.0+ only.

- **question_diamond**: `IconData`
  <i class='cupertino-icons md-36'>&#xf791;</i> &#x2014; Cupertino icon named "question_diamond". Available on cupertino_icons package 1.0.0+ only.

- **question_diamond_fill**: `IconData`
  <i class='cupertino-icons md-36'>&#xf792;</i> &#x2014; Cupertino icon named "question_diamond_fill". Available on cupertino_icons package 1.0.0+ only.

- **question_square**: `IconData`
  <i class='cupertino-icons md-36'>&#xf793;</i> &#x2014; Cupertino icon named "question_square". Available on cupertino_icons package 1.0.0+ only.

- **question_square_fill**: `IconData`
  <i class='cupertino-icons md-36'>&#xf794;</i> &#x2014; Cupertino icon named "question_square_fill". Available on cupertino_icons package 1.0.0+ only.

- **quote_bubble**: `IconData`
  <i class='cupertino-icons md-36'>&#xf795;</i> &#x2014; Cupertino icon named "quote_bubble". Available on cupertino_icons package 1.0.0+ only.

- **quote_bubble_fill**: `IconData`
  <i class='cupertino-icons md-36'>&#xf796;</i> &#x2014; Cupertino icon named "quote_bubble_fill". Available on cupertino_icons package 1.0.0+ only.

- **radiowaves_left**: `IconData`
  <i class='cupertino-icons md-36'>&#xf797;</i> &#x2014; Cupertino icon named "radiowaves_left". Available on cupertino_icons package 1.0.0+ only.

- **radiowaves_right**: `IconData`
  <i class='cupertino-icons md-36'>&#xf798;</i> &#x2014; Cupertino icon named "radiowaves_right". Available on cupertino_icons package 1.0.0+ only.

- **rays**: `IconData`
  <i class='cupertino-icons md-36'>&#xf799;</i> &#x2014; Cupertino icon named "rays". Available on cupertino_icons package 1.0.0+ only.

- **recordingtape**: `IconData`
  <i class='cupertino-icons md-36'>&#xf79a;</i> &#x2014; Cupertino icon named "recordingtape". Available on cupertino_icons package 1.0.0+ only.

- **rectangle**: `IconData`
  <i class='cupertino-icons md-36'>&#xf79b;</i> &#x2014; Cupertino icon named "rectangle". Available on cupertino_icons package 1.0.0+ only.

- **rectangle_3_offgrid**: `IconData`
  <i class='cupertino-icons md-36'>&#xf79c;</i> &#x2014; Cupertino icon named "rectangle_3_offgrid". Available on cupertino_icons package 1.0.0+ only.

- **rectangle_3_offgrid_fill**: `IconData`
  <i class='cupertino-icons md-36'>&#xf79d;</i> &#x2014; Cupertino icon named "rectangle_3_offgrid_fill". Available on cupertino_icons package 1.0.0+ only.

- **rectangle_arrow_up_right_arrow_down_left**: `IconData`
  <i class='cupertino-icons md-36'>&#xf79e;</i> &#x2014; Cupertino icon named "rectangle_arrow_up_right_arrow_down_left". Available on cupertino_icons package 1.0.0+ only.

- **rectangle_arrow_up_right_arrow_down_left_slash**: `IconData`
  <i class='cupertino-icons md-36'>&#xf79f;</i> &#x2014; Cupertino icon named "rectangle_arrow_up_right_arrow_down_left_slash". Available on cupertino_icons package 1.0.0+ only.

- **rectangle_badge_checkmark**: `IconData`
  <i class='cupertino-icons md-36'>&#xf7a0;</i> &#x2014; Cupertino icon named "rectangle_badge_checkmark". Available on cupertino_icons package 1.0.0+ only.

- **rectangle_badge_xmark**: `IconData`
  <i class='cupertino-icons md-36'>&#xf7a1;</i> &#x2014; Cupertino icon named "rectangle_badge_xmark". Available on cupertino_icons package 1.0.0+ only.

- **rectangle_compress_vertical**: `IconData`
  <i class='cupertino-icons md-36'>&#xf7a2;</i> &#x2014; Cupertino icon named "rectangle_compress_vertical". Available on cupertino_icons package 1.0.0+ only.

- **rectangle_dock**: `IconData`
  <i class='cupertino-icons md-36'>&#xf7a3;</i> &#x2014; Cupertino icon named "rectangle_dock". Available on cupertino_icons package 1.0.0+ only.

- **rectangle_expand_vertical**: `IconData`
  <i class='cupertino-icons md-36'>&#xf7a4;</i> &#x2014; Cupertino icon named "rectangle_expand_vertical". Available on cupertino_icons package 1.0.0+ only.

- **rectangle_fill**: `IconData`
  <i class='cupertino-icons md-36'>&#xf7a5;</i> &#x2014; Cupertino icon named "rectangle_fill". Available on cupertino_icons package 1.0.0+ only.

- **rectangle_fill_badge_checkmark**: `IconData`
  <i class='cupertino-icons md-36'>&#xf7a6;</i> &#x2014; Cupertino icon named "rectangle_fill_badge_checkmark". Available on cupertino_icons package 1.0.0+ only.

- **rectangle_fill_badge_xmark**: `IconData`
  <i class='cupertino-icons md-36'>&#xf7a7;</i> &#x2014; Cupertino icon named "rectangle_fill_badge_xmark". Available on cupertino_icons package 1.0.0+ only.

- **rectangle_fill_on_rectangle_angled_fill**: `IconData`
  <i class='cupertino-icons md-36'>&#xf7a8;</i> &#x2014; Cupertino icon named "rectangle_fill_on_rectangle_angled_fill". Available on cupertino_icons package 1.0.0+ only.

- **rectangle_fill_on_rectangle_fill**: `IconData`
  <i class='cupertino-icons md-36'>&#xf7a9;</i> &#x2014; Cupertino icon named "rectangle_fill_on_rectangle_fill". Available on cupertino_icons package 1.0.0+ only.

- **rectangle_grid_1x2**: `IconData`
  <i class='cupertino-icons md-36'>&#xf7aa;</i> &#x2014; Cupertino icon named "rectangle_grid_1x2". Available on cupertino_icons package 1.0.0+ only.

- **rectangle_grid_1x2_fill**: `IconData`
  <i class='cupertino-icons md-36'>&#xf7ab;</i> &#x2014; Cupertino icon named "rectangle_grid_1x2_fill". Available on cupertino_icons package 1.0.0+ only.

- **rectangle_grid_2x2**: `IconData`
  <i class='cupertino-icons md-36'>&#xf7ac;</i> &#x2014; Cupertino icon named "rectangle_grid_2x2". Available on cupertino_icons package 1.0.0+ only.

- **rectangle_grid_2x2_fill**: `IconData`
  <i class='cupertino-icons md-36'>&#xf7ad;</i> &#x2014; Cupertino icon named "rectangle_grid_2x2_fill". Available on cupertino_icons package 1.0.0+ only.

- **rectangle_grid_3x2**: `IconData`
  <i class='cupertino-icons md-36'>&#xf7ae;</i> &#x2014; Cupertino icon named "rectangle_grid_3x2". Available on cupertino_icons package 1.0.0+ only.

- **rectangle_grid_3x2_fill**: `IconData`
  <i class='cupertino-icons md-36'>&#xf7af;</i> &#x2014; Cupertino icon named "rectangle_grid_3x2_fill". Available on cupertino_icons package 1.0.0+ only.

- **rectangle_on_rectangle**: `IconData`
  <i class='cupertino-icons md-36'>&#xf7b0;</i> &#x2014; Cupertino icon named "rectangle_on_rectangle". Available on cupertino_icons package 1.0.0+ only.

- **rectangle_on_rectangle_angled**: `IconData`
  <i class='cupertino-icons md-36'>&#xf7b1;</i> &#x2014; Cupertino icon named "rectangle_on_rectangle_angled". Available on cupertino_icons package 1.0.0+ only.

- **rectangle_paperclip**: `IconData`
  <i class='cupertino-icons md-36'>&#xf7b2;</i> &#x2014; Cupertino icon named "rectangle_paperclip". Available on cupertino_icons package 1.0.0+ only.

- **rectangle_split_3x1**: `IconData`
  <i class='cupertino-icons md-36'>&#xf7b3;</i> &#x2014; Cupertino icon named "rectangle_split_3x1". Available on cupertino_icons package 1.0.0+ only.

- **rectangle_split_3x1_fill**: `IconData`
  <i class='cupertino-icons md-36'>&#xf7b4;</i> &#x2014; Cupertino icon named "rectangle_split_3x1_fill". Available on cupertino_icons package 1.0.0+ only.

- **rectangle_split_3x3**: `IconData`
  <i class='cupertino-icons md-36'>&#xf7b5;</i> &#x2014; Cupertino icon named "rectangle_split_3x3". Available on cupertino_icons package 1.0.0+ only.

- **rectangle_split_3x3_fill**: `IconData`
  <i class='cupertino-icons md-36'>&#xf7b6;</i> &#x2014; Cupertino icon named "rectangle_split_3x3_fill". Available on cupertino_icons package 1.0.0+ only.

- **rectangle_stack**: `IconData`
  <i class='cupertino-icons md-36'>&#xf3c9;</i> &#x2014; Cupertino icon named "rectangle_stack". Available on cupertino_icons package 1.0.0+ only.
 This is the same icon as [collections] which is available in cupertino_icons 0.1.3.

- **rectangle_stack_badge_minus**: `IconData`
  <i class='cupertino-icons md-36'>&#xf7b7;</i> &#x2014; Cupertino icon named "rectangle_stack_badge_minus". Available on cupertino_icons package 1.0.0+ only.

- **rectangle_stack_badge_person_crop**: `IconData`
  <i class='cupertino-icons md-36'>&#xf7b8;</i> &#x2014; Cupertino icon named "rectangle_stack_badge_person_crop". Available on cupertino_icons package 1.0.0+ only.

- **rectangle_stack_badge_plus**: `IconData`
  <i class='cupertino-icons md-36'>&#xf7b9;</i> &#x2014; Cupertino icon named "rectangle_stack_badge_plus". Available on cupertino_icons package 1.0.0+ only.

- **rectangle_stack_fill**: `IconData`
  <i class='cupertino-icons md-36'>&#xf3ca;</i> &#x2014; Cupertino icon named "rectangle_stack_fill". Available on cupertino_icons package 1.0.0+ only.
 This is the same icon as [collections_solid] which is available in cupertino_icons 0.1.3.

- **rectangle_stack_fill_badge_minus**: `IconData`
  <i class='cupertino-icons md-36'>&#xf7ba;</i> &#x2014; Cupertino icon named "rectangle_stack_fill_badge_minus". Available on cupertino_icons package 1.0.0+ only.

- **rectangle_stack_fill_badge_person_crop**: `IconData`
  <i class='cupertino-icons md-36'>&#xf7bb;</i> &#x2014; Cupertino icon named "rectangle_stack_fill_badge_person_crop". Available on cupertino_icons package 1.0.0+ only.

- **rectangle_stack_fill_badge_plus**: `IconData`
  <i class='cupertino-icons md-36'>&#xf7bc;</i> &#x2014; Cupertino icon named "rectangle_stack_fill_badge_plus". Available on cupertino_icons package 1.0.0+ only.

- **rectangle_stack_person_crop**: `IconData`
  <i class='cupertino-icons md-36'>&#xf7bd;</i> &#x2014; Cupertino icon named "rectangle_stack_person_crop". Available on cupertino_icons package 1.0.0+ only.

- **rectangle_stack_person_crop_fill**: `IconData`
  <i class='cupertino-icons md-36'>&#xf7be;</i> &#x2014; Cupertino icon named "rectangle_stack_person_crop_fill". Available on cupertino_icons package 1.0.0+ only.

- **repeat**: `IconData`
  <i class='cupertino-icons md-36'>&#xf7bf;</i> &#x2014; Cupertino icon named "repeat". Available on cupertino_icons package 1.0.0+ only.

- **repeat_1**: `IconData`
  <i class='cupertino-icons md-36'>&#xf7c0;</i> &#x2014; Cupertino icon named "repeat_1". Available on cupertino_icons package 1.0.0+ only.

- **resize**: `IconData`
  <i class='cupertino-icons md-36'>&#xf900;</i> &#x2014; Cupertino icon named "resize". Available on cupertino_icons package 1.0.0+ only.

- **resize_h**: `IconData`
  <i class='cupertino-icons md-36'>&#xf901;</i> &#x2014; Cupertino icon named "resize_h". Available on cupertino_icons package 1.0.0+ only.

- **resize_v**: `IconData`
  <i class='cupertino-icons md-36'>&#xf902;</i> &#x2014; Cupertino icon named "resize_v". Available on cupertino_icons package 1.0.0+ only.

- **return_icon**: `IconData`
  <i class='cupertino-icons md-36'>&#xf7c1;</i> &#x2014; Cupertino icon named "return_icon". Available on cupertino_icons package 1.0.0+ only.

- **rhombus**: `IconData`
  <i class='cupertino-icons md-36'>&#xf7c2;</i> &#x2014; Cupertino icon named "rhombus". Available on cupertino_icons package 1.0.0+ only.

- **rhombus_fill**: `IconData`
  <i class='cupertino-icons md-36'>&#xf7c3;</i> &#x2014; Cupertino icon named "rhombus_fill". Available on cupertino_icons package 1.0.0+ only.

- **rocket**: `IconData`
  <i class='cupertino-icons md-36'>&#xf903;</i> &#x2014; Cupertino icon named "rocket". Available on cupertino_icons package 1.0.0+ only.

- **rocket_fill**: `IconData`
  <i class='cupertino-icons md-36'>&#xf904;</i> &#x2014; Cupertino icon named "rocket_fill". Available on cupertino_icons package 1.0.0+ only.

- **rosette**: `IconData`
  <i class='cupertino-icons md-36'>&#xf7c4;</i> &#x2014; Cupertino icon named "rosette". Available on cupertino_icons package 1.0.0+ only.

- **rotate_left**: `IconData`
  <i class='cupertino-icons md-36'>&#xf7c5;</i> &#x2014; Cupertino icon named "rotate_left". Available on cupertino_icons package 1.0.0+ only.

- **rotate_left_fill**: `IconData`
  <i class='cupertino-icons md-36'>&#xf7c6;</i> &#x2014; Cupertino icon named "rotate_left_fill". Available on cupertino_icons package 1.0.0+ only.

- **rotate_right**: `IconData`
  <i class='cupertino-icons md-36'>&#xf7c7;</i> &#x2014; Cupertino icon named "rotate_right". Available on cupertino_icons package 1.0.0+ only.

- **rotate_right_fill**: `IconData`
  <i class='cupertino-icons md-36'>&#xf7c8;</i> &#x2014; Cupertino icon named "rotate_right_fill". Available on cupertino_icons package 1.0.0+ only.

- **scissors**: `IconData`
  <i class='cupertino-icons md-36'>&#xf7c9;</i> &#x2014; Cupertino icon named "scissors". Available on cupertino_icons package 1.0.0+ only.

- **scissors_alt**: `IconData`
  <i class='cupertino-icons md-36'>&#xf905;</i> &#x2014; Cupertino icon named "scissors_alt". Available on cupertino_icons package 1.0.0+ only.

- **scope**: `IconData`
  <i class='cupertino-icons md-36'>&#xf7ca;</i> &#x2014; Cupertino icon named "scope". Available on cupertino_icons package 1.0.0+ only.

- **scribble**: `IconData`
  <i class='cupertino-icons md-36'>&#xf7cb;</i> &#x2014; Cupertino icon named "scribble". Available on cupertino_icons package 1.0.0+ only.

- **search_circle**: `IconData`
  <i class='cupertino-icons md-36'>&#xf7cc;</i> &#x2014; Cupertino icon named "search_circle". Available on cupertino_icons package 1.0.0+ only.

- **search_circle_fill**: `IconData`
  <i class='cupertino-icons md-36'>&#xf7cd;</i> &#x2014; Cupertino icon named "search_circle_fill". Available on cupertino_icons package 1.0.0+ only.

- **selection_pin_in_out**: `IconData`
  <i class='cupertino-icons md-36'>&#xf7ce;</i> &#x2014; Cupertino icon named "selection_pin_in_out". Available on cupertino_icons package 1.0.0+ only.

- **shield**: `IconData`
  <i class='cupertino-icons md-36'>&#xf7cf;</i> &#x2014; Cupertino icon named "shield". Available on cupertino_icons package 1.0.0+ only.

- **shield_fill**: `IconData`
  <i class='cupertino-icons md-36'>&#xf7d0;</i> &#x2014; Cupertino icon named "shield_fill". Available on cupertino_icons package 1.0.0+ only.

- **shield_lefthalf_fill**: `IconData`
  <i class='cupertino-icons md-36'>&#xf7d1;</i> &#x2014; Cupertino icon named "shield_lefthalf_fill". Available on cupertino_icons package 1.0.0+ only.

- **shield_slash**: `IconData`
  <i class='cupertino-icons md-36'>&#xf7d2;</i> &#x2014; Cupertino icon named "shield_slash". Available on cupertino_icons package 1.0.0+ only.

- **shield_slash_fill**: `IconData`
  <i class='cupertino-icons md-36'>&#xf7d3;</i> &#x2014; Cupertino icon named "shield_slash_fill". Available on cupertino_icons package 1.0.0+ only.

- **shift**: `IconData`
  <i class='cupertino-icons md-36'>&#xf7d4;</i> &#x2014; Cupertino icon named "shift". Available on cupertino_icons package 1.0.0+ only.

- **shift_fill**: `IconData`
  <i class='cupertino-icons md-36'>&#xf7d5;</i> &#x2014; Cupertino icon named "shift_fill". Available on cupertino_icons package 1.0.0+ only.

- **sidebar_left**: `IconData`
  <i class='cupertino-icons md-36'>&#xf7d6;</i> &#x2014; Cupertino icon named "sidebar_left". Available on cupertino_icons package 1.0.0+ only.

- **sidebar_right**: `IconData`
  <i class='cupertino-icons md-36'>&#xf7d7;</i> &#x2014; Cupertino icon named "sidebar_right". Available on cupertino_icons package 1.0.0+ only.

- **signature**: `IconData`
  <i class='cupertino-icons md-36'>&#xf7d8;</i> &#x2014; Cupertino icon named "signature". Available on cupertino_icons package 1.0.0+ only.

- **skew**: `IconData`
  <i class='cupertino-icons md-36'>&#xf7d9;</i> &#x2014; Cupertino icon named "skew". Available on cupertino_icons package 1.0.0+ only.

- **slash_circle**: `IconData`
  <i class='cupertino-icons md-36'>&#xf7da;</i> &#x2014; Cupertino icon named "slash_circle". Available on cupertino_icons package 1.0.0+ only.

- **slash_circle_fill**: `IconData`
  <i class='cupertino-icons md-36'>&#xf7db;</i> &#x2014; Cupertino icon named "slash_circle_fill". Available on cupertino_icons package 1.0.0+ only.

- **slider_horizontal_3**: `IconData`
  <i class='cupertino-icons md-36'>&#xf7dc;</i> &#x2014; Cupertino icon named "slider_horizontal_3". Available on cupertino_icons package 1.0.0+ only.

- **slider_horizontal_below_rectangle**: `IconData`
  <i class='cupertino-icons md-36'>&#xf7dd;</i> &#x2014; Cupertino icon named "slider_horizontal_below_rectangle". Available on cupertino_icons package 1.0.0+ only.

- **slowmo**: `IconData`
  <i class='cupertino-icons md-36'>&#xf7de;</i> &#x2014; Cupertino icon named "slowmo". Available on cupertino_icons package 1.0.0+ only.

- **smallcircle_circle**: `IconData`
  <i class='cupertino-icons md-36'>&#xf7df;</i> &#x2014; Cupertino icon named "smallcircle_circle". Available on cupertino_icons package 1.0.0+ only.

- **smallcircle_circle_fill**: `IconData`
  <i class='cupertino-icons md-36'>&#xf7e0;</i> &#x2014; Cupertino icon named "smallcircle_circle_fill". Available on cupertino_icons package 1.0.0+ only.

- **smallcircle_fill_circle**: `IconData`
  <i class='cupertino-icons md-36'>&#xf7e1;</i> &#x2014; Cupertino icon named "smallcircle_fill_circle". Available on cupertino_icons package 1.0.0+ only.

- **smallcircle_fill_circle_fill**: `IconData`
  <i class='cupertino-icons md-36'>&#xf7e2;</i> &#x2014; Cupertino icon named "smallcircle_fill_circle_fill". Available on cupertino_icons package 1.0.0+ only.

- **smiley**: `IconData`
  <i class='cupertino-icons md-36'>&#xf7e3;</i> &#x2014; Cupertino icon named "smiley". Available on cupertino_icons package 1.0.0+ only.

- **smiley_fill**: `IconData`
  <i class='cupertino-icons md-36'>&#xf7e4;</i> &#x2014; Cupertino icon named "smiley_fill". Available on cupertino_icons package 1.0.0+ only.

- **smoke**: `IconData`
  <i class='cupertino-icons md-36'>&#xf7e5;</i> &#x2014; Cupertino icon named "smoke". Available on cupertino_icons package 1.0.0+ only.

- **smoke_fill**: `IconData`
  <i class='cupertino-icons md-36'>&#xf7e6;</i> &#x2014; Cupertino icon named "smoke_fill". Available on cupertino_icons package 1.0.0+ only.

- **snow**: `IconData`
  <i class='cupertino-icons md-36'>&#xf7e7;</i> &#x2014; Cupertino icon named "snow". Available on cupertino_icons package 1.0.0+ only.

- **sort_down**: `IconData`
  <i class='cupertino-icons md-36'>&#xf906;</i> &#x2014; Cupertino icon named "sort_down". Available on cupertino_icons package 1.0.0+ only.

- **sort_down_circle**: `IconData`
  <i class='cupertino-icons md-36'>&#xf907;</i> &#x2014; Cupertino icon named "sort_down_circle". Available on cupertino_icons package 1.0.0+ only.

- **sort_down_circle_fill**: `IconData`
  <i class='cupertino-icons md-36'>&#xf908;</i> &#x2014; Cupertino icon named "sort_down_circle_fill". Available on cupertino_icons package 1.0.0+ only.

- **sort_up**: `IconData`
  <i class='cupertino-icons md-36'>&#xf909;</i> &#x2014; Cupertino icon named "sort_up". Available on cupertino_icons package 1.0.0+ only.

- **sort_up_circle**: `IconData`
  <i class='cupertino-icons md-36'>&#xf90a;</i> &#x2014; Cupertino icon named "sort_up_circle". Available on cupertino_icons package 1.0.0+ only.

- **sort_up_circle_fill**: `IconData`
  <i class='cupertino-icons md-36'>&#xf90b;</i> &#x2014; Cupertino icon named "sort_up_circle_fill". Available on cupertino_icons package 1.0.0+ only.

- **sparkles**: `IconData`
  <i class='cupertino-icons md-36'>&#xf7e8;</i> &#x2014; Cupertino icon named "sparkles". Available on cupertino_icons package 1.0.0+ only.

- **speaker**: `IconData`
  <i class='cupertino-icons md-36'>&#xf7e9;</i> &#x2014; Cupertino icon named "speaker". Available on cupertino_icons package 1.0.0+ only.

- **speaker_1**: `IconData`
  <i class='cupertino-icons md-36'>&#xf7ea;</i> &#x2014; Cupertino icon named "speaker_1". Available on cupertino_icons package 1.0.0+ only.

- **speaker_1_fill**: `IconData`
  <i class='cupertino-icons md-36'>&#xf3b7;</i> &#x2014; Cupertino icon named "speaker_1_fill". Available on cupertino_icons package 1.0.0+ only.
 This is the same icon as [volume_down] which is available in cupertino_icons 0.1.3.

- **speaker_2**: `IconData`
  <i class='cupertino-icons md-36'>&#xf7eb;</i> &#x2014; Cupertino icon named "speaker_2". Available on cupertino_icons package 1.0.0+ only.

- **speaker_2_fill**: `IconData`
  <i class='cupertino-icons md-36'>&#xf7ec;</i> &#x2014; Cupertino icon named "speaker_2_fill". Available on cupertino_icons package 1.0.0+ only.

- **speaker_3**: `IconData`
  <i class='cupertino-icons md-36'>&#xf7ed;</i> &#x2014; Cupertino icon named "speaker_3". Available on cupertino_icons package 1.0.0+ only.

- **speaker_3_fill**: `IconData`
  <i class='cupertino-icons md-36'>&#xf3ba;</i> &#x2014; Cupertino icon named "speaker_3_fill". Available on cupertino_icons package 1.0.0+ only.
 This is the same icon as [volume_up] which is available in cupertino_icons 0.1.3.

- **speaker_fill**: `IconData`
  <i class='cupertino-icons md-36'>&#xf3b8;</i> &#x2014; Cupertino icon named "speaker_fill". Available on cupertino_icons package 1.0.0+ only.
 This is the same icon as [volume_mute] which is available in cupertino_icons 0.1.3.

- **speaker_slash**: `IconData`
  <i class='cupertino-icons md-36'>&#xf7ee;</i> &#x2014; Cupertino icon named "speaker_slash". Available on cupertino_icons package 1.0.0+ only.

- **speaker_slash_fill**: `IconData`
  <i class='cupertino-icons md-36'>&#xf3b9;</i> &#x2014; Cupertino icon named "speaker_slash_fill". Available on cupertino_icons package 1.0.0+ only.
 This is the same icon as [volume_off] which is available in cupertino_icons 0.1.3.

- **speaker_slash_fill_rtl**: `IconData`
  <i class='cupertino-icons md-36'>&#xf7ef;</i> &#x2014; Cupertino icon named "speaker_slash_fill_rtl". Available on cupertino_icons package 1.0.0+ only.

- **speaker_slash_rtl**: `IconData`
  <i class='cupertino-icons md-36'>&#xf7f0;</i> &#x2014; Cupertino icon named "speaker_slash_rtl". Available on cupertino_icons package 1.0.0+ only.

- **speaker_zzz**: `IconData`
  <i class='cupertino-icons md-36'>&#xf7f1;</i> &#x2014; Cupertino icon named "speaker_zzz". Available on cupertino_icons package 1.0.0+ only.

- **speaker_zzz_fill**: `IconData`
  <i class='cupertino-icons md-36'>&#xf7f2;</i> &#x2014; Cupertino icon named "speaker_zzz_fill". Available on cupertino_icons package 1.0.0+ only.

- **speaker_zzz_fill_rtl**: `IconData`
  <i class='cupertino-icons md-36'>&#xf7f3;</i> &#x2014; Cupertino icon named "speaker_zzz_fill_rtl". Available on cupertino_icons package 1.0.0+ only.

- **speaker_zzz_rtl**: `IconData`
  <i class='cupertino-icons md-36'>&#xf7f4;</i> &#x2014; Cupertino icon named "speaker_zzz_rtl". Available on cupertino_icons package 1.0.0+ only.

- **speedometer**: `IconData`
  <i class='cupertino-icons md-36'>&#xf7f5;</i> &#x2014; Cupertino icon named "speedometer". Available on cupertino_icons package 1.0.0+ only.

- **sportscourt**: `IconData`
  <i class='cupertino-icons md-36'>&#xf7f6;</i> &#x2014; Cupertino icon named "sportscourt". Available on cupertino_icons package 1.0.0+ only.

- **sportscourt_fill**: `IconData`
  <i class='cupertino-icons md-36'>&#xf7f7;</i> &#x2014; Cupertino icon named "sportscourt_fill". Available on cupertino_icons package 1.0.0+ only.

- **square**: `IconData`
  <i class='cupertino-icons md-36'>&#xf7f8;</i> &#x2014; Cupertino icon named "square". Available on cupertino_icons package 1.0.0+ only.

- **square_arrow_down**: `IconData`
  <i class='cupertino-icons md-36'>&#xf7f9;</i> &#x2014; Cupertino icon named "square_arrow_down". Available on cupertino_icons package 1.0.0+ only.

- **square_arrow_down_fill**: `IconData`
  <i class='cupertino-icons md-36'>&#xf7fa;</i> &#x2014; Cupertino icon named "square_arrow_down_fill". Available on cupertino_icons package 1.0.0+ only.

- **square_arrow_down_on_square**: `IconData`
  <i class='cupertino-icons md-36'>&#xf7fb;</i> &#x2014; Cupertino icon named "square_arrow_down_on_square". Available on cupertino_icons package 1.0.0+ only.

- **square_arrow_down_on_square_fill**: `IconData`
  <i class='cupertino-icons md-36'>&#xf7fc;</i> &#x2014; Cupertino icon named "square_arrow_down_on_square_fill". Available on cupertino_icons package 1.0.0+ only.

- **square_arrow_left**: `IconData`
  <i class='cupertino-icons md-36'>&#xf90c;</i> &#x2014; Cupertino icon named "square_arrow_left". Available on cupertino_icons package 1.0.0+ only.

- **square_arrow_left_fill**: `IconData`
  <i class='cupertino-icons md-36'>&#xf90d;</i> &#x2014; Cupertino icon named "square_arrow_left_fill". Available on cupertino_icons package 1.0.0+ only.

- **square_arrow_right**: `IconData`
  <i class='cupertino-icons md-36'>&#xf90e;</i> &#x2014; Cupertino icon named "square_arrow_right". Available on cupertino_icons package 1.0.0+ only.

- **square_arrow_right_fill**: `IconData`
  <i class='cupertino-icons md-36'>&#xf90f;</i> &#x2014; Cupertino icon named "square_arrow_right_fill". Available on cupertino_icons package 1.0.0+ only.

- **square_arrow_up**: `IconData`
  <i class='cupertino-icons md-36'>&#xf4ca;</i> &#x2014; Cupertino icon named "square_arrow_up". Available on cupertino_icons package 1.0.0+ only.
 This is the same icon as [share] which is available in cupertino_icons 0.1.3.
 This is the same icon as [share_up] which is available in cupertino_icons 0.1.3.

- **square_arrow_up_fill**: `IconData`
  <i class='cupertino-icons md-36'>&#xf4cb;</i> &#x2014; Cupertino icon named "square_arrow_up_fill". Available on cupertino_icons package 1.0.0+ only.
 This is the same icon as [share_solid] which is available in cupertino_icons 0.1.3.

- **square_arrow_up_on_square**: `IconData`
  <i class='cupertino-icons md-36'>&#xf7fd;</i> &#x2014; Cupertino icon named "square_arrow_up_on_square". Available on cupertino_icons package 1.0.0+ only.

- **square_arrow_up_on_square_fill**: `IconData`
  <i class='cupertino-icons md-36'>&#xf7fe;</i> &#x2014; Cupertino icon named "square_arrow_up_on_square_fill". Available on cupertino_icons package 1.0.0+ only.

- **square_favorites**: `IconData`
  <i class='cupertino-icons md-36'>&#xf910;</i> &#x2014; Cupertino icon named "square_favorites". Available on cupertino_icons package 1.0.0+ only.

- **square_favorites_alt**: `IconData`
  <i class='cupertino-icons md-36'>&#xf911;</i> &#x2014; Cupertino icon named "square_favorites_alt". Available on cupertino_icons package 1.0.0+ only.

- **square_favorites_alt_fill**: `IconData`
  <i class='cupertino-icons md-36'>&#xf912;</i> &#x2014; Cupertino icon named "square_favorites_alt_fill". Available on cupertino_icons package 1.0.0+ only.

- **square_favorites_fill**: `IconData`
  <i class='cupertino-icons md-36'>&#xf913;</i> &#x2014; Cupertino icon named "square_favorites_fill". Available on cupertino_icons package 1.0.0+ only.

- **square_fill**: `IconData`
  <i class='cupertino-icons md-36'>&#xf7ff;</i> &#x2014; Cupertino icon named "square_fill". Available on cupertino_icons package 1.0.0+ only.

- **square_fill_line_vertical_square**: `IconData`
  <i class='cupertino-icons md-36'>&#xf800;</i> &#x2014; Cupertino icon named "square_fill_line_vertical_square". Available on cupertino_icons package 1.0.0+ only.

- **square_fill_line_vertical_square_fill**: `IconData`
  <i class='cupertino-icons md-36'>&#xf801;</i> &#x2014; Cupertino icon named "square_fill_line_vertical_square_fill". Available on cupertino_icons package 1.0.0+ only.

- **square_fill_on_circle_fill**: `IconData`
  <i class='cupertino-icons md-36'>&#xf802;</i> &#x2014; Cupertino icon named "square_fill_on_circle_fill". Available on cupertino_icons package 1.0.0+ only.

- **square_fill_on_square_fill**: `IconData`
  <i class='cupertino-icons md-36'>&#xf803;</i> &#x2014; Cupertino icon named "square_fill_on_square_fill". Available on cupertino_icons package 1.0.0+ only.

- **square_grid_2x2**: `IconData`
  <i class='cupertino-icons md-36'>&#xf804;</i> &#x2014; Cupertino icon named "square_grid_2x2". Available on cupertino_icons package 1.0.0+ only.

- **square_grid_2x2_fill**: `IconData`
  <i class='cupertino-icons md-36'>&#xf805;</i> &#x2014; Cupertino icon named "square_grid_2x2_fill". Available on cupertino_icons package 1.0.0+ only.

- **square_grid_3x2**: `IconData`
  <i class='cupertino-icons md-36'>&#xf806;</i> &#x2014; Cupertino icon named "square_grid_3x2". Available on cupertino_icons package 1.0.0+ only.

- **square_grid_3x2_fill**: `IconData`
  <i class='cupertino-icons md-36'>&#xf807;</i> &#x2014; Cupertino icon named "square_grid_3x2_fill". Available on cupertino_icons package 1.0.0+ only.

- **square_grid_4x3_fill**: `IconData`
  <i class='cupertino-icons md-36'>&#xf808;</i> &#x2014; Cupertino icon named "square_grid_4x3_fill". Available on cupertino_icons package 1.0.0+ only.

- **square_lefthalf_fill**: `IconData`
  <i class='cupertino-icons md-36'>&#xf809;</i> &#x2014; Cupertino icon named "square_lefthalf_fill". Available on cupertino_icons package 1.0.0+ only.

- **square_line_vertical_square**: `IconData`
  <i class='cupertino-icons md-36'>&#xf80a;</i> &#x2014; Cupertino icon named "square_line_vertical_square". Available on cupertino_icons package 1.0.0+ only.

- **square_line_vertical_square_fill**: `IconData`
  <i class='cupertino-icons md-36'>&#xf80b;</i> &#x2014; Cupertino icon named "square_line_vertical_square_fill". Available on cupertino_icons package 1.0.0+ only.

- **square_list**: `IconData`
  <i class='cupertino-icons md-36'>&#xf914;</i> &#x2014; Cupertino icon named "square_list". Available on cupertino_icons package 1.0.0+ only.

- **square_list_fill**: `IconData`
  <i class='cupertino-icons md-36'>&#xf915;</i> &#x2014; Cupertino icon named "square_list_fill". Available on cupertino_icons package 1.0.0+ only.

- **square_on_circle**: `IconData`
  <i class='cupertino-icons md-36'>&#xf80c;</i> &#x2014; Cupertino icon named "square_on_circle". Available on cupertino_icons package 1.0.0+ only.

- **square_on_square**: `IconData`
  <i class='cupertino-icons md-36'>&#xf80d;</i> &#x2014; Cupertino icon named "square_on_square". Available on cupertino_icons package 1.0.0+ only.

- **square_pencil**: `IconData`
  <i class='cupertino-icons md-36'>&#xf417;</i> &#x2014; Cupertino icon named "square_pencil". Available on cupertino_icons package 1.0.0+ only.
 This is the same icon as [create] which is available in cupertino_icons 0.1.3.
 This is the same icon as [create_solid] which is available in cupertino_icons 0.1.3.

- **square_pencil_fill**: `IconData`
  <i class='cupertino-icons md-36'>&#xf417;</i> &#x2014; Cupertino icon named "square_pencil_fill". Available on cupertino_icons package 1.0.0+ only.
 This is the same icon as [create] which is available in cupertino_icons 0.1.3.
 This is the same icon as [create_solid] which is available in cupertino_icons 0.1.3.

- **square_righthalf_fill**: `IconData`
  <i class='cupertino-icons md-36'>&#xf80e;</i> &#x2014; Cupertino icon named "square_righthalf_fill". Available on cupertino_icons package 1.0.0+ only.

- **square_split_1x2**: `IconData`
  <i class='cupertino-icons md-36'>&#xf80f;</i> &#x2014; Cupertino icon named "square_split_1x2". Available on cupertino_icons package 1.0.0+ only.

- **square_split_1x2_fill**: `IconData`
  <i class='cupertino-icons md-36'>&#xf810;</i> &#x2014; Cupertino icon named "square_split_1x2_fill". Available on cupertino_icons package 1.0.0+ only.

- **square_split_2x1**: `IconData`
  <i class='cupertino-icons md-36'>&#xf811;</i> &#x2014; Cupertino icon named "square_split_2x1". Available on cupertino_icons package 1.0.0+ only.

- **square_split_2x1_fill**: `IconData`
  <i class='cupertino-icons md-36'>&#xf812;</i> &#x2014; Cupertino icon named "square_split_2x1_fill". Available on cupertino_icons package 1.0.0+ only.

- **square_split_2x2**: `IconData`
  <i class='cupertino-icons md-36'>&#xf813;</i> &#x2014; Cupertino icon named "square_split_2x2". Available on cupertino_icons package 1.0.0+ only.

- **square_split_2x2_fill**: `IconData`
  <i class='cupertino-icons md-36'>&#xf814;</i> &#x2014; Cupertino icon named "square_split_2x2_fill". Available on cupertino_icons package 1.0.0+ only.

- **square_stack**: `IconData`
  <i class='cupertino-icons md-36'>&#xf815;</i> &#x2014; Cupertino icon named "square_stack". Available on cupertino_icons package 1.0.0+ only.

- **square_stack_3d_down_dottedline**: `IconData`
  <i class='cupertino-icons md-36'>&#xf816;</i> &#x2014; Cupertino icon named "square_stack_3d_down_dottedline". Available on cupertino_icons package 1.0.0+ only.

- **square_stack_3d_down_right**: `IconData`
  <i class='cupertino-icons md-36'>&#xf817;</i> &#x2014; Cupertino icon named "square_stack_3d_down_right". Available on cupertino_icons package 1.0.0+ only.

- **square_stack_3d_down_right_fill**: `IconData`
  <i class='cupertino-icons md-36'>&#xf818;</i> &#x2014; Cupertino icon named "square_stack_3d_down_right_fill". Available on cupertino_icons package 1.0.0+ only.

- **square_stack_3d_up**: `IconData`
  <i class='cupertino-icons md-36'>&#xf819;</i> &#x2014; Cupertino icon named "square_stack_3d_up". Available on cupertino_icons package 1.0.0+ only.

- **square_stack_3d_up_fill**: `IconData`
  <i class='cupertino-icons md-36'>&#xf81a;</i> &#x2014; Cupertino icon named "square_stack_3d_up_fill". Available on cupertino_icons package 1.0.0+ only.

- **square_stack_3d_up_slash**: `IconData`
  <i class='cupertino-icons md-36'>&#xf81b;</i> &#x2014; Cupertino icon named "square_stack_3d_up_slash". Available on cupertino_icons package 1.0.0+ only.

- **square_stack_3d_up_slash_fill**: `IconData`
  <i class='cupertino-icons md-36'>&#xf81c;</i> &#x2014; Cupertino icon named "square_stack_3d_up_slash_fill". Available on cupertino_icons package 1.0.0+ only.

- **square_stack_fill**: `IconData`
  <i class='cupertino-icons md-36'>&#xf81d;</i> &#x2014; Cupertino icon named "square_stack_fill". Available on cupertino_icons package 1.0.0+ only.

- **squares_below_rectangle**: `IconData`
  <i class='cupertino-icons md-36'>&#xf81e;</i> &#x2014; Cupertino icon named "squares_below_rectangle". Available on cupertino_icons package 1.0.0+ only.

- **star**: `IconData`
  <i class='cupertino-icons md-36'>&#xf81f;</i> &#x2014; Cupertino icon named "star". Available on cupertino_icons package 1.0.0+ only.

- **star_circle**: `IconData`
  <i class='cupertino-icons md-36'>&#xf820;</i> &#x2014; Cupertino icon named "star_circle". Available on cupertino_icons package 1.0.0+ only.

- **star_circle_fill**: `IconData`
  <i class='cupertino-icons md-36'>&#xf821;</i> &#x2014; Cupertino icon named "star_circle_fill". Available on cupertino_icons package 1.0.0+ only.

- **star_fill**: `IconData`
  <i class='cupertino-icons md-36'>&#xf822;</i> &#x2014; Cupertino icon named "star_fill". Available on cupertino_icons package 1.0.0+ only.

- **star_lefthalf_fill**: `IconData`
  <i class='cupertino-icons md-36'>&#xf823;</i> &#x2014; Cupertino icon named "star_lefthalf_fill". Available on cupertino_icons package 1.0.0+ only.

- **star_slash**: `IconData`
  <i class='cupertino-icons md-36'>&#xf824;</i> &#x2014; Cupertino icon named "star_slash". Available on cupertino_icons package 1.0.0+ only.

- **star_slash_fill**: `IconData`
  <i class='cupertino-icons md-36'>&#xf825;</i> &#x2014; Cupertino icon named "star_slash_fill". Available on cupertino_icons package 1.0.0+ only.

- **staroflife**: `IconData`
  <i class='cupertino-icons md-36'>&#xf826;</i> &#x2014; Cupertino icon named "staroflife". Available on cupertino_icons package 1.0.0+ only.

- **staroflife_fill**: `IconData`
  <i class='cupertino-icons md-36'>&#xf827;</i> &#x2014; Cupertino icon named "staroflife_fill". Available on cupertino_icons package 1.0.0+ only.

- **stop**: `IconData`
  <i class='cupertino-icons md-36'>&#xf828;</i> &#x2014; Cupertino icon named "stop". Available on cupertino_icons package 1.0.0+ only.

- **stop_circle**: `IconData`
  <i class='cupertino-icons md-36'>&#xf829;</i> &#x2014; Cupertino icon named "stop_circle". Available on cupertino_icons package 1.0.0+ only.

- **stop_circle_fill**: `IconData`
  <i class='cupertino-icons md-36'>&#xf82a;</i> &#x2014; Cupertino icon named "stop_circle_fill". Available on cupertino_icons package 1.0.0+ only.

- **stop_fill**: `IconData`
  <i class='cupertino-icons md-36'>&#xf82b;</i> &#x2014; Cupertino icon named "stop_fill". Available on cupertino_icons package 1.0.0+ only.

- **stopwatch**: `IconData`
  <i class='cupertino-icons md-36'>&#xf82c;</i> &#x2014; Cupertino icon named "stopwatch". Available on cupertino_icons package 1.0.0+ only.

- **stopwatch_fill**: `IconData`
  <i class='cupertino-icons md-36'>&#xf82d;</i> &#x2014; Cupertino icon named "stopwatch_fill". Available on cupertino_icons package 1.0.0+ only.

- **strikethrough**: `IconData`
  <i class='cupertino-icons md-36'>&#xf82e;</i> &#x2014; Cupertino icon named "strikethrough". Available on cupertino_icons package 1.0.0+ only.

- **suit_club**: `IconData`
  <i class='cupertino-icons md-36'>&#xf82f;</i> &#x2014; Cupertino icon named "suit_club". Available on cupertino_icons package 1.0.0+ only.

- **suit_club_fill**: `IconData`
  <i class='cupertino-icons md-36'>&#xf830;</i> &#x2014; Cupertino icon named "suit_club_fill". Available on cupertino_icons package 1.0.0+ only.

- **suit_diamond**: `IconData`
  <i class='cupertino-icons md-36'>&#xf831;</i> &#x2014; Cupertino icon named "suit_diamond". Available on cupertino_icons package 1.0.0+ only.

- **suit_diamond_fill**: `IconData`
  <i class='cupertino-icons md-36'>&#xf832;</i> &#x2014; Cupertino icon named "suit_diamond_fill". Available on cupertino_icons package 1.0.0+ only.

- **suit_heart**: `IconData`
  <i class='cupertino-icons md-36'>&#xf833;</i> &#x2014; Cupertino icon named "suit_heart". Available on cupertino_icons package 1.0.0+ only.

- **suit_heart_fill**: `IconData`
  <i class='cupertino-icons md-36'>&#xf834;</i> &#x2014; Cupertino icon named "suit_heart_fill". Available on cupertino_icons package 1.0.0+ only.

- **suit_spade**: `IconData`
  <i class='cupertino-icons md-36'>&#xf835;</i> &#x2014; Cupertino icon named "suit_spade". Available on cupertino_icons package 1.0.0+ only.

- **suit_spade_fill**: `IconData`
  <i class='cupertino-icons md-36'>&#xf836;</i> &#x2014; Cupertino icon named "suit_spade_fill". Available on cupertino_icons package 1.0.0+ only.

- **sum**: `IconData`
  <i class='cupertino-icons md-36'>&#xf837;</i> &#x2014; Cupertino icon named "sum". Available on cupertino_icons package 1.0.0+ only.

- **sun_dust**: `IconData`
  <i class='cupertino-icons md-36'>&#xf838;</i> &#x2014; Cupertino icon named "sun_dust". Available on cupertino_icons package 1.0.0+ only.

- **sun_dust_fill**: `IconData`
  <i class='cupertino-icons md-36'>&#xf839;</i> &#x2014; Cupertino icon named "sun_dust_fill". Available on cupertino_icons package 1.0.0+ only.

- **sun_haze**: `IconData`
  <i class='cupertino-icons md-36'>&#xf83a;</i> &#x2014; Cupertino icon named "sun_haze". Available on cupertino_icons package 1.0.0+ only.

- **sun_haze_fill**: `IconData`
  <i class='cupertino-icons md-36'>&#xf83b;</i> &#x2014; Cupertino icon named "sun_haze_fill". Available on cupertino_icons package 1.0.0+ only.

- **sun_max**: `IconData`
  <i class='cupertino-icons md-36'>&#xf4b6;</i> &#x2014; Cupertino icon named "sun_max". Available on cupertino_icons package 1.0.0+ only.
 This is the same icon as [brightness] which is available in cupertino_icons 0.1.3.

- **sun_max_fill**: `IconData`
  <i class='cupertino-icons md-36'>&#xf4b7;</i> &#x2014; Cupertino icon named "sun_max_fill". Available on cupertino_icons package 1.0.0+ only.
 This is the same icon as [brightness_solid] which is available in cupertino_icons 0.1.3.

- **sun_min**: `IconData`
  <i class='cupertino-icons md-36'>&#xf83c;</i> &#x2014; Cupertino icon named "sun_min". Available on cupertino_icons package 1.0.0+ only.

- **sun_min_fill**: `IconData`
  <i class='cupertino-icons md-36'>&#xf83d;</i> &#x2014; Cupertino icon named "sun_min_fill". Available on cupertino_icons package 1.0.0+ only.

- **sunrise**: `IconData`
  <i class='cupertino-icons md-36'>&#xf83e;</i> &#x2014; Cupertino icon named "sunrise". Available on cupertino_icons package 1.0.0+ only.

- **sunrise_fill**: `IconData`
  <i class='cupertino-icons md-36'>&#xf83f;</i> &#x2014; Cupertino icon named "sunrise_fill". Available on cupertino_icons package 1.0.0+ only.

- **sunset**: `IconData`
  <i class='cupertino-icons md-36'>&#xf840;</i> &#x2014; Cupertino icon named "sunset". Available on cupertino_icons package 1.0.0+ only.

- **sunset_fill**: `IconData`
  <i class='cupertino-icons md-36'>&#xf841;</i> &#x2014; Cupertino icon named "sunset_fill". Available on cupertino_icons package 1.0.0+ only.

- **t_bubble**: `IconData`
  <i class='cupertino-icons md-36'>&#xf842;</i> &#x2014; Cupertino icon named "t_bubble". Available on cupertino_icons package 1.0.0+ only.

- **t_bubble_fill**: `IconData`
  <i class='cupertino-icons md-36'>&#xf843;</i> &#x2014; Cupertino icon named "t_bubble_fill". Available on cupertino_icons package 1.0.0+ only.

- **table**: `IconData`
  <i class='cupertino-icons md-36'>&#xf844;</i> &#x2014; Cupertino icon named "table". Available on cupertino_icons package 1.0.0+ only.

- **table_badge_more**: `IconData`
  <i class='cupertino-icons md-36'>&#xf845;</i> &#x2014; Cupertino icon named "table_badge_more". Available on cupertino_icons package 1.0.0+ only.

- **table_badge_more_fill**: `IconData`
  <i class='cupertino-icons md-36'>&#xf846;</i> &#x2014; Cupertino icon named "table_badge_more_fill". Available on cupertino_icons package 1.0.0+ only.

- **table_fill**: `IconData`
  <i class='cupertino-icons md-36'>&#xf847;</i> &#x2014; Cupertino icon named "table_fill". Available on cupertino_icons package 1.0.0+ only.

- **tag_circle**: `IconData`
  <i class='cupertino-icons md-36'>&#xf848;</i> &#x2014; Cupertino icon named "tag_circle". Available on cupertino_icons package 1.0.0+ only.

- **tag_circle_fill**: `IconData`
  <i class='cupertino-icons md-36'>&#xf849;</i> &#x2014; Cupertino icon named "tag_circle_fill". Available on cupertino_icons package 1.0.0+ only.

- **tag_fill**: `IconData`
  <i class='cupertino-icons md-36'>&#xf48d;</i> &#x2014; Cupertino icon named "tag_fill". Available on cupertino_icons package 1.0.0+ only.
 This is the same icon as [tag_solid] which is available in cupertino_icons 0.1.3.
 This is the same icon as [tags_solid] which is available in cupertino_icons 0.1.3.

- **text_aligncenter**: `IconData`
  <i class='cupertino-icons md-36'>&#xf84a;</i> &#x2014; Cupertino icon named "text_aligncenter". Available on cupertino_icons package 1.0.0+ only.

- **text_alignleft**: `IconData`
  <i class='cupertino-icons md-36'>&#xf84b;</i> &#x2014; Cupertino icon named "text_alignleft". Available on cupertino_icons package 1.0.0+ only.

- **text_alignright**: `IconData`
  <i class='cupertino-icons md-36'>&#xf84c;</i> &#x2014; Cupertino icon named "text_alignright". Available on cupertino_icons package 1.0.0+ only.

- **text_append**: `IconData`
  <i class='cupertino-icons md-36'>&#xf84d;</i> &#x2014; Cupertino icon named "text_append". Available on cupertino_icons package 1.0.0+ only.

- **text_badge_checkmark**: `IconData`
  <i class='cupertino-icons md-36'>&#xf84e;</i> &#x2014; Cupertino icon named "text_badge_checkmark". Available on cupertino_icons package 1.0.0+ only.

- **text_badge_minus**: `IconData`
  <i class='cupertino-icons md-36'>&#xf84f;</i> &#x2014; Cupertino icon named "text_badge_minus". Available on cupertino_icons package 1.0.0+ only.

- **text_badge_plus**: `IconData`
  <i class='cupertino-icons md-36'>&#xf850;</i> &#x2014; Cupertino icon named "text_badge_plus". Available on cupertino_icons package 1.0.0+ only.

- **text_badge_star**: `IconData`
  <i class='cupertino-icons md-36'>&#xf851;</i> &#x2014; Cupertino icon named "text_badge_star". Available on cupertino_icons package 1.0.0+ only.

- **text_badge_xmark**: `IconData`
  <i class='cupertino-icons md-36'>&#xf852;</i> &#x2014; Cupertino icon named "text_badge_xmark". Available on cupertino_icons package 1.0.0+ only.

- **text_bubble**: `IconData`
  <i class='cupertino-icons md-36'>&#xf853;</i> &#x2014; Cupertino icon named "text_bubble". Available on cupertino_icons package 1.0.0+ only.

- **text_bubble_fill**: `IconData`
  <i class='cupertino-icons md-36'>&#xf854;</i> &#x2014; Cupertino icon named "text_bubble_fill". Available on cupertino_icons package 1.0.0+ only.

- **text_cursor**: `IconData`
  <i class='cupertino-icons md-36'>&#xf855;</i> &#x2014; Cupertino icon named "text_cursor". Available on cupertino_icons package 1.0.0+ only.

- **text_insert**: `IconData`
  <i class='cupertino-icons md-36'>&#xf856;</i> &#x2014; Cupertino icon named "text_insert". Available on cupertino_icons package 1.0.0+ only.

- **text_justify**: `IconData`
  <i class='cupertino-icons md-36'>&#xf857;</i> &#x2014; Cupertino icon named "text_justify". Available on cupertino_icons package 1.0.0+ only.

- **text_justifyleft**: `IconData`
  <i class='cupertino-icons md-36'>&#xf858;</i> &#x2014; Cupertino icon named "text_justifyleft". Available on cupertino_icons package 1.0.0+ only.

- **text_justifyright**: `IconData`
  <i class='cupertino-icons md-36'>&#xf859;</i> &#x2014; Cupertino icon named "text_justifyright". Available on cupertino_icons package 1.0.0+ only.

- **text_quote**: `IconData`
  <i class='cupertino-icons md-36'>&#xf85a;</i> &#x2014; Cupertino icon named "text_quote". Available on cupertino_icons package 1.0.0+ only.

- **textbox**: `IconData`
  <i class='cupertino-icons md-36'>&#xf85b;</i> &#x2014; Cupertino icon named "textbox". Available on cupertino_icons package 1.0.0+ only.

- **textformat**: `IconData`
  <i class='cupertino-icons md-36'>&#xf85c;</i> &#x2014; Cupertino icon named "textformat". Available on cupertino_icons package 1.0.0+ only.

- **textformat_123**: `IconData`
  <i class='cupertino-icons md-36'>&#xf85d;</i> &#x2014; Cupertino icon named "textformat_123". Available on cupertino_icons package 1.0.0+ only.

- **textformat_abc**: `IconData`
  <i class='cupertino-icons md-36'>&#xf85e;</i> &#x2014; Cupertino icon named "textformat_abc". Available on cupertino_icons package 1.0.0+ only.

- **textformat_abc_dottedunderline**: `IconData`
  <i class='cupertino-icons md-36'>&#xf85f;</i> &#x2014; Cupertino icon named "textformat_abc_dottedunderline". Available on cupertino_icons package 1.0.0+ only.

- **textformat_alt**: `IconData`
  <i class='cupertino-icons md-36'>&#xf860;</i> &#x2014; Cupertino icon named "textformat_alt". Available on cupertino_icons package 1.0.0+ only.

- **textformat_size**: `IconData`
  <i class='cupertino-icons md-36'>&#xf861;</i> &#x2014; Cupertino icon named "textformat_size". Available on cupertino_icons package 1.0.0+ only.

- **textformat_subscript**: `IconData`
  <i class='cupertino-icons md-36'>&#xf862;</i> &#x2014; Cupertino icon named "textformat_subscript". Available on cupertino_icons package 1.0.0+ only.

- **textformat_superscript**: `IconData`
  <i class='cupertino-icons md-36'>&#xf863;</i> &#x2014; Cupertino icon named "textformat_superscript". Available on cupertino_icons package 1.0.0+ only.

- **thermometer**: `IconData`
  <i class='cupertino-icons md-36'>&#xf864;</i> &#x2014; Cupertino icon named "thermometer". Available on cupertino_icons package 1.0.0+ only.

- **thermometer_snowflake**: `IconData`
  <i class='cupertino-icons md-36'>&#xf865;</i> &#x2014; Cupertino icon named "thermometer_snowflake". Available on cupertino_icons package 1.0.0+ only.

- **thermometer_sun**: `IconData`
  <i class='cupertino-icons md-36'>&#xf866;</i> &#x2014; Cupertino icon named "thermometer_sun". Available on cupertino_icons package 1.0.0+ only.

- **ticket**: `IconData`
  <i class='cupertino-icons md-36'>&#xf916;</i> &#x2014; Cupertino icon named "ticket". Available on cupertino_icons package 1.0.0+ only.

- **ticket_fill**: `IconData`
  <i class='cupertino-icons md-36'>&#xf917;</i> &#x2014; Cupertino icon named "ticket_fill". Available on cupertino_icons package 1.0.0+ only.

- **tickets**: `IconData`
  <i class='cupertino-icons md-36'>&#xf918;</i> &#x2014; Cupertino icon named "tickets". Available on cupertino_icons package 1.0.0+ only.

- **tickets_fill**: `IconData`
  <i class='cupertino-icons md-36'>&#xf919;</i> &#x2014; Cupertino icon named "tickets_fill". Available on cupertino_icons package 1.0.0+ only.

- **timelapse**: `IconData`
  <i class='cupertino-icons md-36'>&#xf867;</i> &#x2014; Cupertino icon named "timelapse". Available on cupertino_icons package 1.0.0+ only.

- **timer**: `IconData`
  <i class='cupertino-icons md-36'>&#xf868;</i> &#x2014; Cupertino icon named "timer". Available on cupertino_icons package 1.0.0+ only.

- **timer_fill**: `IconData`
  <i class='cupertino-icons md-36'>&#xf91a;</i> &#x2014; Cupertino icon named "timer_fill". Available on cupertino_icons package 1.0.0+ only.

- **today**: `IconData`
  <i class='cupertino-icons md-36'>&#xf91b;</i> &#x2014; Cupertino icon named "today". Available on cupertino_icons package 1.0.0+ only.

- **today_fill**: `IconData`
  <i class='cupertino-icons md-36'>&#xf91c;</i> &#x2014; Cupertino icon named "today_fill". Available on cupertino_icons package 1.0.0+ only.

- **tornado**: `IconData`
  <i class='cupertino-icons md-36'>&#xf869;</i> &#x2014; Cupertino icon named "tornado". Available on cupertino_icons package 1.0.0+ only.

- **tortoise**: `IconData`
  <i class='cupertino-icons md-36'>&#xf86a;</i> &#x2014; Cupertino icon named "tortoise". Available on cupertino_icons package 1.0.0+ only.

- **tortoise_fill**: `IconData`
  <i class='cupertino-icons md-36'>&#xf86b;</i> &#x2014; Cupertino icon named "tortoise_fill". Available on cupertino_icons package 1.0.0+ only.

- **tram_fill**: `IconData`
  <i class='cupertino-icons md-36'>&#xf86c;</i> &#x2014; Cupertino icon named "tram_fill". Available on cupertino_icons package 1.0.0+ only.

- **trash**: `IconData`
  <i class='cupertino-icons md-36'>&#xf4c4;</i> &#x2014; Cupertino icon named "trash". Available on cupertino_icons package 1.0.0+ only.
 This is the same icon as [delete] which is available in cupertino_icons 0.1.3.
 This is the same icon as [delete_simple] which is available in cupertino_icons 0.1.3.

- **trash_circle**: `IconData`
  <i class='cupertino-icons md-36'>&#xf86d;</i> &#x2014; Cupertino icon named "trash_circle". Available on cupertino_icons package 1.0.0+ only.

- **trash_circle_fill**: `IconData`
  <i class='cupertino-icons md-36'>&#xf86e;</i> &#x2014; Cupertino icon named "trash_circle_fill". Available on cupertino_icons package 1.0.0+ only.

- **trash_fill**: `IconData`
  <i class='cupertino-icons md-36'>&#xf4c5;</i> &#x2014; Cupertino icon named "trash_fill". Available on cupertino_icons package 1.0.0+ only.
 This is the same icon as [delete_solid] which is available in cupertino_icons 0.1.3.

- **trash_slash**: `IconData`
  <i class='cupertino-icons md-36'>&#xf86f;</i> &#x2014; Cupertino icon named "trash_slash". Available on cupertino_icons package 1.0.0+ only.

- **trash_slash_fill**: `IconData`
  <i class='cupertino-icons md-36'>&#xf870;</i> &#x2014; Cupertino icon named "trash_slash_fill". Available on cupertino_icons package 1.0.0+ only.

- **tray**: `IconData`
  <i class='cupertino-icons md-36'>&#xf871;</i> &#x2014; Cupertino icon named "tray". Available on cupertino_icons package 1.0.0+ only.

- **tray_2**: `IconData`
  <i class='cupertino-icons md-36'>&#xf872;</i> &#x2014; Cupertino icon named "tray_2". Available on cupertino_icons package 1.0.0+ only.

- **tray_2_fill**: `IconData`
  <i class='cupertino-icons md-36'>&#xf873;</i> &#x2014; Cupertino icon named "tray_2_fill". Available on cupertino_icons package 1.0.0+ only.

- **tray_arrow_down**: `IconData`
  <i class='cupertino-icons md-36'>&#xf874;</i> &#x2014; Cupertino icon named "tray_arrow_down". Available on cupertino_icons package 1.0.0+ only.

- **tray_arrow_down_fill**: `IconData`
  <i class='cupertino-icons md-36'>&#xf875;</i> &#x2014; Cupertino icon named "tray_arrow_down_fill". Available on cupertino_icons package 1.0.0+ only.

- **tray_arrow_up**: `IconData`
  <i class='cupertino-icons md-36'>&#xf876;</i> &#x2014; Cupertino icon named "tray_arrow_up". Available on cupertino_icons package 1.0.0+ only.

- **tray_arrow_up_fill**: `IconData`
  <i class='cupertino-icons md-36'>&#xf877;</i> &#x2014; Cupertino icon named "tray_arrow_up_fill". Available on cupertino_icons package 1.0.0+ only.

- **tray_fill**: `IconData`
  <i class='cupertino-icons md-36'>&#xf878;</i> &#x2014; Cupertino icon named "tray_fill". Available on cupertino_icons package 1.0.0+ only.

- **tray_full**: `IconData`
  <i class='cupertino-icons md-36'>&#xf879;</i> &#x2014; Cupertino icon named "tray_full". Available on cupertino_icons package 1.0.0+ only.

- **tray_full_fill**: `IconData`
  <i class='cupertino-icons md-36'>&#xf87a;</i> &#x2014; Cupertino icon named "tray_full_fill". Available on cupertino_icons package 1.0.0+ only.

- **tree**: `IconData`
  <i class='cupertino-icons md-36'>&#xf91d;</i> &#x2014; Cupertino icon named "tree". Available on cupertino_icons package 1.0.0+ only.

- **triangle**: `IconData`
  <i class='cupertino-icons md-36'>&#xf87b;</i> &#x2014; Cupertino icon named "triangle". Available on cupertino_icons package 1.0.0+ only.

- **triangle_fill**: `IconData`
  <i class='cupertino-icons md-36'>&#xf87c;</i> &#x2014; Cupertino icon named "triangle_fill". Available on cupertino_icons package 1.0.0+ only.

- **triangle_lefthalf_fill**: `IconData`
  <i class='cupertino-icons md-36'>&#xf87d;</i> &#x2014; Cupertino icon named "triangle_lefthalf_fill". Available on cupertino_icons package 1.0.0+ only.

- **triangle_righthalf_fill**: `IconData`
  <i class='cupertino-icons md-36'>&#xf87e;</i> &#x2014; Cupertino icon named "triangle_righthalf_fill". Available on cupertino_icons package 1.0.0+ only.

- **tropicalstorm**: `IconData`
  <i class='cupertino-icons md-36'>&#xf87f;</i> &#x2014; Cupertino icon named "tropicalstorm". Available on cupertino_icons package 1.0.0+ only.

- **tuningfork**: `IconData`
  <i class='cupertino-icons md-36'>&#xf880;</i> &#x2014; Cupertino icon named "tuningfork". Available on cupertino_icons package 1.0.0+ only.

- **tv**: `IconData`
  <i class='cupertino-icons md-36'>&#xf881;</i> &#x2014; Cupertino icon named "tv". Available on cupertino_icons package 1.0.0+ only.

- **tv_circle**: `IconData`
  <i class='cupertino-icons md-36'>&#xf882;</i> &#x2014; Cupertino icon named "tv_circle". Available on cupertino_icons package 1.0.0+ only.

- **tv_circle_fill**: `IconData`
  <i class='cupertino-icons md-36'>&#xf883;</i> &#x2014; Cupertino icon named "tv_circle_fill". Available on cupertino_icons package 1.0.0+ only.

- **tv_fill**: `IconData`
  <i class='cupertino-icons md-36'>&#xf884;</i> &#x2014; Cupertino icon named "tv_fill". Available on cupertino_icons package 1.0.0+ only.

- **tv_music_note**: `IconData`
  <i class='cupertino-icons md-36'>&#xf885;</i> &#x2014; Cupertino icon named "tv_music_note". Available on cupertino_icons package 1.0.0+ only.

- **tv_music_note_fill**: `IconData`
  <i class='cupertino-icons md-36'>&#xf886;</i> &#x2014; Cupertino icon named "tv_music_note_fill". Available on cupertino_icons package 1.0.0+ only.

- **uiwindow_split_2x1**: `IconData`
  <i class='cupertino-icons md-36'>&#xf887;</i> &#x2014; Cupertino icon named "uiwindow_split_2x1". Available on cupertino_icons package 1.0.0+ only.

- **umbrella**: `IconData`
  <i class='cupertino-icons md-36'>&#xf888;</i> &#x2014; Cupertino icon named "umbrella". Available on cupertino_icons package 1.0.0+ only.

- **umbrella_fill**: `IconData`
  <i class='cupertino-icons md-36'>&#xf889;</i> &#x2014; Cupertino icon named "umbrella_fill". Available on cupertino_icons package 1.0.0+ only.

- **underline**: `IconData`
  <i class='cupertino-icons md-36'>&#xf88a;</i> &#x2014; Cupertino icon named "underline". Available on cupertino_icons package 1.0.0+ only.

- **upload_circle**: `IconData`
  <i class='cupertino-icons md-36'>&#xf91e;</i> &#x2014; Cupertino icon named "upload_circle". Available on cupertino_icons package 1.0.0+ only.

- **upload_circle_fill**: `IconData`
  <i class='cupertino-icons md-36'>&#xf91f;</i> &#x2014; Cupertino icon named "upload_circle_fill". Available on cupertino_icons package 1.0.0+ only.

- **videocam**: `IconData`
  <i class='cupertino-icons md-36'>&#xf4cc;</i> &#x2014; Cupertino icon named "videocam". Available on cupertino_icons package 1.0.0+ only.
 This is the same icon as [video_camera] which is available in cupertino_icons 0.1.3.

- **videocam_circle**: `IconData`
  <i class='cupertino-icons md-36'>&#xf920;</i> &#x2014; Cupertino icon named "videocam_circle". Available on cupertino_icons package 1.0.0+ only.

- **videocam_circle_fill**: `IconData`
  <i class='cupertino-icons md-36'>&#xf921;</i> &#x2014; Cupertino icon named "videocam_circle_fill". Available on cupertino_icons package 1.0.0+ only.

- **videocam_fill**: `IconData`
  <i class='cupertino-icons md-36'>&#xf4cd;</i> &#x2014; Cupertino icon named "videocam_fill". Available on cupertino_icons package 1.0.0+ only.
 This is the same icon as [video_camera_solid] which is available in cupertino_icons 0.1.3.

- **view_2d**: `IconData`
  <i class='cupertino-icons md-36'>&#xf88b;</i> &#x2014; Cupertino icon named "view_2d". Available on cupertino_icons package 1.0.0+ only.

- **view_3d**: `IconData`
  <i class='cupertino-icons md-36'>&#xf88c;</i> &#x2014; Cupertino icon named "view_3d". Available on cupertino_icons package 1.0.0+ only.

- **viewfinder**: `IconData`
  <i class='cupertino-icons md-36'>&#xf88d;</i> &#x2014; Cupertino icon named "viewfinder". Available on cupertino_icons package 1.0.0+ only.

- **viewfinder_circle**: `IconData`
  <i class='cupertino-icons md-36'>&#xf88e;</i> &#x2014; Cupertino icon named "viewfinder_circle". Available on cupertino_icons package 1.0.0+ only.

- **viewfinder_circle_fill**: `IconData`
  <i class='cupertino-icons md-36'>&#xf88f;</i> &#x2014; Cupertino icon named "viewfinder_circle_fill". Available on cupertino_icons package 1.0.0+ only.

- **wand_rays**: `IconData`
  <i class='cupertino-icons md-36'>&#xf890;</i> &#x2014; Cupertino icon named "wand_rays". Available on cupertino_icons package 1.0.0+ only.

- **wand_rays_inverse**: `IconData`
  <i class='cupertino-icons md-36'>&#xf891;</i> &#x2014; Cupertino icon named "wand_rays_inverse". Available on cupertino_icons package 1.0.0+ only.

- **wand_stars**: `IconData`
  <i class='cupertino-icons md-36'>&#xf892;</i> &#x2014; Cupertino icon named "wand_stars". Available on cupertino_icons package 1.0.0+ only.

- **wand_stars_inverse**: `IconData`
  <i class='cupertino-icons md-36'>&#xf893;</i> &#x2014; Cupertino icon named "wand_stars_inverse". Available on cupertino_icons package 1.0.0+ only.

- **waveform**: `IconData`
  <i class='cupertino-icons md-36'>&#xf894;</i> &#x2014; Cupertino icon named "waveform". Available on cupertino_icons package 1.0.0+ only.

- **waveform_circle**: `IconData`
  <i class='cupertino-icons md-36'>&#xf895;</i> &#x2014; Cupertino icon named "waveform_circle". Available on cupertino_icons package 1.0.0+ only.

- **waveform_circle_fill**: `IconData`
  <i class='cupertino-icons md-36'>&#xf896;</i> &#x2014; Cupertino icon named "waveform_circle_fill". Available on cupertino_icons package 1.0.0+ only.

- **waveform_path**: `IconData`
  <i class='cupertino-icons md-36'>&#xf897;</i> &#x2014; Cupertino icon named "waveform_path". Available on cupertino_icons package 1.0.0+ only.

- **waveform_path_badge_minus**: `IconData`
  <i class='cupertino-icons md-36'>&#xf898;</i> &#x2014; Cupertino icon named "waveform_path_badge_minus". Available on cupertino_icons package 1.0.0+ only.

- **waveform_path_badge_plus**: `IconData`
  <i class='cupertino-icons md-36'>&#xf899;</i> &#x2014; Cupertino icon named "waveform_path_badge_plus". Available on cupertino_icons package 1.0.0+ only.

- **waveform_path_ecg**: `IconData`
  <i class='cupertino-icons md-36'>&#xf89a;</i> &#x2014; Cupertino icon named "waveform_path_ecg". Available on cupertino_icons package 1.0.0+ only.

- **wifi**: `IconData`
  <i class='cupertino-icons md-36'>&#xf89b;</i> &#x2014; Cupertino icon named "wifi". Available on cupertino_icons package 1.0.0+ only.

- **wifi_exclamationmark**: `IconData`
  <i class='cupertino-icons md-36'>&#xf89c;</i> &#x2014; Cupertino icon named "wifi_exclamationmark". Available on cupertino_icons package 1.0.0+ only.

- **wifi_slash**: `IconData`
  <i class='cupertino-icons md-36'>&#xf89d;</i> &#x2014; Cupertino icon named "wifi_slash". Available on cupertino_icons package 1.0.0+ only.

- **wind**: `IconData`
  <i class='cupertino-icons md-36'>&#xf89e;</i> &#x2014; Cupertino icon named "wind". Available on cupertino_icons package 1.0.0+ only.

- **wind_snow**: `IconData`
  <i class='cupertino-icons md-36'>&#xf89f;</i> &#x2014; Cupertino icon named "wind_snow". Available on cupertino_icons package 1.0.0+ only.

- **wrench**: `IconData`
  <i class='cupertino-icons md-36'>&#xf8a0;</i> &#x2014; Cupertino icon named "wrench". Available on cupertino_icons package 1.0.0+ only.

- **wrench_fill**: `IconData`
  <i class='cupertino-icons md-36'>&#xf8a1;</i> &#x2014; Cupertino icon named "wrench_fill". Available on cupertino_icons package 1.0.0+ only.

- **xmark**: `IconData`
  <i class='cupertino-icons md-36'>&#xf404;</i> &#x2014; Cupertino icon named "xmark". Available on cupertino_icons package 1.0.0+ only.
 This is the same icon as [clear_thick] which is available in cupertino_icons 0.1.3.
 This is the same icon as [clear] which is available in cupertino_icons 0.1.3.

- **xmark_circle**: `IconData`
  <i class='cupertino-icons md-36'>&#xf405;</i> &#x2014; Cupertino icon named "xmark_circle". Available on cupertino_icons package 1.0.0+ only.
 This is the same icon as [clear_circled] which is available in cupertino_icons 0.1.3.

- **xmark_circle_fill**: `IconData`
  <i class='cupertino-icons md-36'>&#xf36e;</i> &#x2014; Cupertino icon named "xmark_circle_fill". Available on cupertino_icons package 1.0.0+ only.
 This is the same icon as [clear_thick_circled] which is available in cupertino_icons 0.1.3.
 This is the same icon as [clear_circled_solid] which is available in cupertino_icons 0.1.3.

- **xmark_octagon**: `IconData`
  <i class='cupertino-icons md-36'>&#xf8a2;</i> &#x2014; Cupertino icon named "xmark_octagon". Available on cupertino_icons package 1.0.0+ only.

- **xmark_octagon_fill**: `IconData`
  <i class='cupertino-icons md-36'>&#xf8a3;</i> &#x2014; Cupertino icon named "xmark_octagon_fill". Available on cupertino_icons package 1.0.0+ only.

- **xmark_rectangle**: `IconData`
  <i class='cupertino-icons md-36'>&#xf8a4;</i> &#x2014; Cupertino icon named "xmark_rectangle". Available on cupertino_icons package 1.0.0+ only.

- **xmark_rectangle_fill**: `IconData`
  <i class='cupertino-icons md-36'>&#xf8a5;</i> &#x2014; Cupertino icon named "xmark_rectangle_fill". Available on cupertino_icons package 1.0.0+ only.

- **xmark_seal**: `IconData`
  <i class='cupertino-icons md-36'>&#xf8a6;</i> &#x2014; Cupertino icon named "xmark_seal". Available on cupertino_icons package 1.0.0+ only.

- **xmark_seal_fill**: `IconData`
  <i class='cupertino-icons md-36'>&#xf8a7;</i> &#x2014; Cupertino icon named "xmark_seal_fill". Available on cupertino_icons package 1.0.0+ only.

- **xmark_shield**: `IconData`
  <i class='cupertino-icons md-36'>&#xf8a8;</i> &#x2014; Cupertino icon named "xmark_shield". Available on cupertino_icons package 1.0.0+ only.

- **xmark_shield_fill**: `IconData`
  <i class='cupertino-icons md-36'>&#xf8a9;</i> &#x2014; Cupertino icon named "xmark_shield_fill". Available on cupertino_icons package 1.0.0+ only.

- **xmark_square**: `IconData`
  <i class='cupertino-icons md-36'>&#xf8aa;</i> &#x2014; Cupertino icon named "xmark_square". Available on cupertino_icons package 1.0.0+ only.

- **xmark_square_fill**: `IconData`
  <i class='cupertino-icons md-36'>&#xf8ab;</i> &#x2014; Cupertino icon named "xmark_square_fill". Available on cupertino_icons package 1.0.0+ only.

- **zoom_in**: `IconData`
  <i class='cupertino-icons md-36'>&#xf8ac;</i> &#x2014; Cupertino icon named "zoom_in". Available on cupertino_icons package 1.0.0+ only.

- **zoom_out**: `IconData`
  <i class='cupertino-icons md-36'>&#xf8ad;</i> &#x2014; Cupertino icon named "zoom_out". Available on cupertino_icons package 1.0.0+ only.

- **zzz**: `IconData`
  <i class='cupertino-icons md-36'>&#xf8ae;</i> &#x2014; Cupertino icon named "zzz". Available on cupertino_icons package 1.0.0+ only.

