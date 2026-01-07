# Overview for `CupertinoSwitch`

## Description

An iOS-style switch.

 Used to toggle the on/off state of a single setting.

 

 The switch itself does not maintain its toggle state. Instead, when the
 toggle state of the switch changes, the widget calls the [onChanged]
 callback. Most widgets that use a switch will listen for the [onChanged]
 callback and rebuild the switch with a new [value] to update the visual
 appearance of the switch.

 
 This example shows a toggleable [CupertinoSwitch]. When the thumb slides to
 the other side of the track, the switch is toggled between on/off.

 ** See code in examples/api/lib/cupertino/switch/cupertino_switch.0.dart **
 

 

 This sample shows how to use a [CupertinoSwitch] in a [CupertinoListTile]. The
 [MergeSemantics] is used to turn the entire [CupertinoListTile] into a single item
 for accessibility tools.

 ```dart
 MergeSemantics(
   child: CupertinoListTile(
     title: const Text('Lights'),
     trailing: CupertinoSwitch(
       value: _lights,
       onChanged: (bool value) ,
     ),
     onTap:  ,
   ),
 )
 ```
 

 See also:

  * [Switch], the Material Design equivalent.
  * <https://developer.apple.com/design/human-interface-guidelines/toggles/>

## Dependencies

- StatefulWidget

## Members

- **value**: `bool`
  Whether this switch is on or off.

- **onChanged**: `ValueChanged&lt;bool&gt;?`
  Called when the user toggles the switch on or off.

 The switch passes the new value to the callback but does not actually
 change state until the parent widget rebuilds the switch with the new
 value.

 If null, the switch will be displayed as disabled, which has a reduced opacity.

 The callback provided to [onChanged] should update the state of the parent
 [StatefulWidget] using the [State.setState] method, so that the parent
 gets rebuilt; for example:

 ```dart
 CupertinoSwitch(
   value: _giveVerse,
   onChanged: (bool newValue) ,
 )
 ```

- **activeTrackColor**: `Color?`
  The color to use for the track when the switch is on.

 If null and [applyTheme] is false, defaults to [CupertinoColors.systemGreen]
 in accordance to native iOS behavior. Otherwise, defaults to
 [CupertinoThemeData.primaryColor].

 See also:

  * [inactiveTrackColor], the color to use for the track when the switch is off.

- **inactiveTrackColor**: `Color?`
  The color to use for the track when the switch is off.

 Defaults to [CupertinoColors.secondarySystemFill] when null.

 See also:

  * [activeTrackColor], the color to use for the track when the switch is on.

- **thumbColor**: `Color?`
  The color to use for the thumb when the switch is on.

 If this color is not opaque, it is blended against
 [CupertinoThemeData.scaffoldBackgroundColor], so as not to see through the
 thumb to the track underneath.

 Defaults to [CupertinoColors.white] when null.

 See also:

  * [inactiveThumbColor], the color to use for the thumb when the switch is off.

- **inactiveThumbColor**: `Color?`
  The color to use on the thumb when the switch is off.

 If this color is not opaque, it is blended against
 [CupertinoThemeData.scaffoldBackgroundColor], so as not to see through the
 thumb to the track underneath.

 If null, defaults to [thumbColor]. If that is also null,
 [CupertinoColors.white] is used.

 See also:

  * [thumbColor], the color to use for the thumb when the switch is on.

- **focusColor**: `Color?`
  The color to use for the focus highlight for keyboard interactions.

 Defaults to [activeColor] with an opacity of 0.80, a brightness of 0.69
 and a saturation of 0.835.

- **onLabelColor**: `Color?`
  The color to use for the accessibility label when the switch is on.

 Defaults to [CupertinoColors.white] when null.

- **offLabelColor**: `Color?`
  The color to use for the accessibility label when the switch is off.

 Defaults to [Color.fromARGB(255, 179, 179, 179)]
 (or [Color.fromARGB(255, 255, 255, 255)] in high contrast) when null.

- **activeThumbImage**: `ImageProvider?`
  

- **onActiveThumbImageError**: `ImageErrorListener?`
  

- **inactiveThumbImage**: `ImageProvider?`
  

- **onInactiveThumbImageError**: `ImageErrorListener?`
  

- **trackOutlineColor**: `WidgetStateProperty<Color?>?`
  The outline color of this [CupertinoSwitch]'s track.

 Resolved in the following states:
  * [WidgetState.selected].
  * [WidgetState.hovered].
  * [WidgetState.focused].
  * [WidgetState.disabled].

 
 This example resolves the [trackOutlineColor] based on the current
 [WidgetState] of the [CupertinoSwitch], providing a different [Color] when it is
 [WidgetState.disabled].

 ```dart
 CupertinoSwitch(
   value: true,
   onChanged: (bool value) ,
   trackOutlineColor: WidgetStateProperty.resolveWith<Color?>((Set&lt;WidgetState&gt; states) ),
 )
 ```
 

 The [CupertinoSwitch] track has no outline by default.

- **trackOutlineWidth**: `WidgetStateProperty<double?>?`
  The outline width of this [CupertinoSwitch]'s track.

 Resolved in the following states:
  * [WidgetState.selected].
  * [WidgetState.hovered].
  * [WidgetState.focused].
  * [WidgetState.disabled].

 
 This example resolves the [trackOutlineWidth] based on the current
 [WidgetState] of the [CupertinoSwitch], providing a different outline width when it is
 [WidgetState.disabled].

 ```dart
 CupertinoSwitch(
   value: true,
   onChanged: (bool value) ,
   trackOutlineWidth: WidgetStateProperty.resolveWith<double?>((Set&lt;WidgetState&gt; states) ),
 )
 ```
 

 Since a [CupertinoSwitch] has no track outline by default, this parameter
 is set only if [trackOutlineColor] is provided.

 Defaults to 2.0 if a [trackOutlineColor] is provided.

- **thumbIcon**: `WidgetStateProperty<Icon?>?`
  The icon to use on the thumb of this switch.

 Resolved in the following states:
  * [WidgetState.selected].
  * [WidgetState.hovered].
  * [WidgetState.focused].
  * [WidgetState.disabled].

 
 This example resolves the [thumbIcon] based on the current
 [WidgetState] of the [CupertinoSwitch], providing a different [Icon] when it is
 [WidgetState.disabled].

 ```dart
 CupertinoSwitch(
   value: true,
   onChanged: (bool value) ,
   thumbIcon: WidgetStateProperty.resolveWith<Icon?>((Set&lt;WidgetState&gt; states) ),
 )
 ```
 

 If null, then the [CupertinoSwitch] does not have any icons on the thumb.

- **mouseCursor**: `WidgetStateProperty&lt;MouseCursor&gt;?`
  The cursor for a mouse pointer when it enters or is hovering over the
 widget.

 Resolved in the following states:
  * [WidgetState.selected].
  * [WidgetState.hovered].
  * [WidgetState.focused].
  * [WidgetState.disabled].

 
 This example resolves the [mouseCursor] based on the current
 [WidgetState] of the [CupertinoSwitch], providing a different [mouseCursor] when it is
 [WidgetState.disabled].

 ```dart
 CupertinoSwitch(
   value: true,
   onChanged: (bool value) ,
   mouseCursor: WidgetStateProperty.resolveWith&lt;MouseCursor&gt;((Set&lt;WidgetState&gt; states) ),
 )
 ```
 

 If null, then [MouseCursor.defer] is used when the switch is disabled.
 When the switch is enabled, [SystemMouseCursors.click] is used on Web, and
 [MouseCursor.defer] is used on other platforms.

 See also:

  * [WidgetStateMouseCursor], a [MouseCursor] that implements
    `WidgetStateProperty` which is used in APIs that need to accept
    either a [MouseCursor] or a [WidgetStateProperty].

- **focusNode**: `FocusNode?`
  

- **onFocusChange**: `ValueChanged&lt;bool&gt;?`
  Handler called when the focus changes.

 Called with true if this widget's node gains focus, and false if it loses
 focus.

- **autofocus**: `bool`
  

- **applyTheme**: `bool?`
  
 Whether to apply the ambient [CupertinoThemeData].

 If true, the track uses [CupertinoThemeData.primaryColor] for the track
 when the switch is on.

 Defaults to [CupertinoThemeData.applyThemeToAll].
 

- **dragStartBehavior**: `DragStartBehavior`
  
 Determines the way that drag start behavior is handled.

 If set to [DragStartBehavior.start], the drag behavior used to move the
 switch from on to off will begin at the position where the drag gesture won
 the arena. If set to [DragStartBehavior.down] it will begin at the position
 where a down event was first detected.

 In general, setting this to [DragStartBehavior.start] will make drag
 animation smoother and setting it to [DragStartBehavior.down] will make
 drag behavior feel slightly more reactive.

 By default, the drag start behavior is [DragStartBehavior.start].

 See also:

  * [DragGestureRecognizer.dragStartBehavior], which gives an example for
    the different behaviors.

 

## Constructors

### Unnamed Constructor
Creates an iOS-style switch.

 The following arguments are required:

 * [value] determines whether this switch is on or off.
 * [onChanged] is called when the user toggles the switch on or off.

 The [dragStartBehavior] parameter defaults to [DragStartBehavior.start].

