# Overview for `DropdownMenu`

## Description

A dropdown menu that can be opened from a [TextField]. The selected
 menu item is displayed in that field.

 This widget is used to help people make a choice from a menu and put the
 selected item into the text input field. People can also filter the list based
 on the text input or search one item in the menu list.

 The menu is composed of a list of [DropdownMenuEntry]s. People can provide information,
 such as: label, leading icon or trailing icon for each entry. The [TextField]
 will be updated based on the selection from the menu entries. The text field
 will stay empty if the selected entry is disabled.

 When the dropdown menu has focus, it can be traversed by pressing the up or down key.
 During the process, the corresponding item will be highlighted and
 the text field will be updated. Disabled items will be skipped during traversal.

 The menu can be scrollable if not all items in the list are displayed at once.

 
 This sample shows how to display outlined [DropdownMenu] and filled [DropdownMenu].

 ** See code in examples/api/lib/material/dropdown_menu/dropdown_menu.0.dart **
 

 See also:

 * [MenuAnchor], which is a widget used to mark the "anchor" for a set of submenus.
   The [DropdownMenu] uses a [TextField] as the "anchor".
 * [TextField], which is a text input widget that uses an [InputDecoration].
 * [DropdownMenuEntry], which is used to build the [MenuItemButton] in the [DropdownMenu] list.

## Dependencies

- StatefulWidget

## Members

- **enabled**: `bool`
  Determine if the [DropdownMenu] is enabled.

 Defaults to true.

 
 This sample demonstrates how the [enabled] and [requestFocusOnTap] properties
 affect the textfield's hover cursor.

 ** See code in examples/api/lib/material/dropdown_menu/dropdown_menu.2.dart **
 

- **width**: `double?`
  Determine the width of the [DropdownMenu].

 If this is null, the width of the [DropdownMenu] will be the same as the width of the widest
 menu item plus the width of the leading/trailing icon.

- **menuHeight**: `double?`
  Determine the height of the menu.

 If this is null, the menu will display as many items as possible on the screen.

- **leadingIcon**: `Widget?`
  An optional Icon at the front of the text input field.

 Defaults to null. If this is not null, the menu items will have extra paddings to be aligned
 with the text in the text field.

- **trailingIcon**: `Widget?`
  An optional icon at the end of the text field.

 Defaults to an [Icon] with [Icons.arrow_drop_down].

- **label**: `Widget?`
  Optional widget that describes the input field.

 When the input field is empty and unfocused, the label is displayed on
 top of the input field (i.e., at the same location on the screen where
 text may be entered in the input field). When the input field receives
 focus (or if the field is non-empty), the label moves above, either
 vertically adjacent to, or to the center of the input field.

 Defaults to null.

- **hintText**: `String?`
  Text that suggests what sort of input the field accepts.

 Defaults to null;

- **helperText**: `String?`
  Text that provides context about the [DropdownMenu]'s value, such
 as how the value will be used.

 If non-null, the text is displayed below the input field, in
 the same location as [errorText]. If a non-null [errorText] value is
 specified then the helper text is not shown.

 Defaults to null;

 See also:

 * [InputDecoration.helperText], which is the text that provides context about the [InputDecorator.child]'s value.

- **errorText**: `String?`
  Text that appears below the input field and the border to show the error message.

 If non-null, the border's color animates to red and the [helperText] is not shown.

 Defaults to null;

 See also:

 * [InputDecoration.errorText], which is the text that appears below the [InputDecorator.child] and the border.

- **selectedTrailingIcon**: `Widget?`
  An optional icon at the end of the text field to indicate that the text
 field is pressed.

 Defaults to an [Icon] with [Icons.arrow_drop_up].

- **enableFilter**: `bool`
  Determine if the menu list can be filtered by the text input.

 Defaults to false.

- **enableSearch**: `bool`
  Determine if the first item that matches the text input can be highlighted.

 Defaults to true as the search function could be commonly used.

- **keyboardType**: `TextInputType?`
  The type of keyboard to use for editing the text.

 Defaults to [TextInputType.text].

- **textStyle**: `TextStyle?`
  The text style for the [TextField] of the [DropdownMenu];

 Defaults to the overall theme's [TextTheme.bodyLarge]
 if the dropdown menu theme's value is null.

- **textAlign**: `TextAlign`
  The text align for the [TextField] of the [DropdownMenu].

 Defaults to [TextAlign.start].

- **inputDecorationTheme**: `InputDecorationTheme?`
  Defines the default appearance of [InputDecoration] to show around the text field.

 By default, shows a outlined text field.

- **menuStyle**: `MenuStyle?`
  The [MenuStyle] that defines the visual attributes of the menu.

 The default width of the menu is set to the width of the text field.

- **controller**: `TextEditingController?`
  Controls the text being edited or selected in the menu.

 If null, this widget will create its own [TextEditingController].

- **initialSelection**: `T?`
  The value used to for an initial selection.

 Defaults to null.

- **onSelected**: `ValueChanged<T?>?`
  The callback is called when a selection is made.

 Defaults to null. If null, only the text field is updated.

- **focusNode**: `FocusNode?`
  Defines the keyboard focus for this widget.

 The [focusNode] is a long-lived object that's typically managed by a
 [StatefulWidget] parent. See [FocusNode] for more information.

 To give the keyboard focus to this widget, provide a [focusNode] and then
 use the current [FocusScope] to request the focus:

 ```dart
 FocusScope.of(context).requestFocus(myFocusNode);
 ```

 This happens automatically when the widget is tapped.

 To be notified when the widget gains or loses the focus, add a listener
 to the [focusNode]:

 ```dart
 myFocusNode.addListener( );
 ```

 If null, this widget will create its own [FocusNode].

 ## Keyboard

 Requesting the focus will typically cause the keyboard to be shown
 if it's not showing already.

 On Android, the user can hide the keyboard - without changing the focus -
 with the system back button. They can restore the keyboard's visibility
 by tapping on a text field. The user might hide the keyboard and
 switch to a physical keyboard, or they might just need to get it
 out of the way for a moment, to expose something it's
 obscuring. In this case requesting the focus again will not
 cause the focus to change, and will not make the keyboard visible.

 If this is non-null, the behaviour of [requestFocusOnTap] is overridden
 by the [FocusNode.canRequestFocus] property.

- **requestFocusOnTap**: `bool?`
  Determine if the dropdown button requests focus and the on-screen virtual
 keyboard is shown in response to a touch event.

 Ignored if a [focusNode] is explicitly provided (in which case,
 [FocusNode.canRequestFocus] controls the behavior).

 Defaults to null, which enables platform-specific behavior:

  * On mobile platforms, acts as if set to false; tapping on the text
    field and opening the menu will not cause a focus request and the
    virtual keyboard will not appear.

  * On desktop platforms, acts as if set to true; the dropdown takes the
    focus when activated.

 Set this to true or false explicitly to override the default behavior.

 
 This sample demonstrates how the [enabled] and [requestFocusOnTap] properties
 affect the textfield's hover cursor.

 ** See code in examples/api/lib/material/dropdown_menu/dropdown_menu.2.dart **
 

- **dropdownMenuEntries**: `List&lt;DropdownMenuEntry&lt;T&gt;&gt;`
  Descriptions of the menu items in the [DropdownMenu].

 This is a required parameter. It is recommended that at least one [DropdownMenuEntry]
 is provided. If this is an empty list, the menu will be empty and only
 contain space for padding.

- **expandedInsets**: `EdgeInsetsGeometry?`
  Defines the menu text field's width to be equal to its parent's width
 plus the horizontal width of the specified insets.

 If this property is null, the width of the text field will be determined
 by the width of menu items or [DropdownMenu.width]. If this property is not null,
 the text field's width will match the parent's width plus the specified insets.
 If the value of this property is [EdgeInsets.zero], the width of the text field will be the same
 as its parent's width.

 The [expandedInsets]' top and bottom are ignored, only its left and right
 properties are used.

 Defaults to null.

- **filterCallback**: `FilterCallback&lt;T&gt;?`
  When [DropdownMenu.enableFilter] is true, this callback is used to
 compute the list of filtered items.

 

 In this example the `filterCallback` returns the items that contains the
 trimmed query.

 ```dart
 DropdownMenu&lt;Text&gt;(
   enableFilter: true,
   filterCallback: (List&lt;DropdownMenuEntry&lt;Text&gt;&gt; entries, String filter) ,
   dropdownMenuEntries: const <DropdownMenuEntry&lt;Text>&gt;[],
 )
 ```
 

 Defaults to null. If this parameter is null and the
 [DropdownMenu.enableFilter] property is set to true, the default behavior
 will return a filtered list. The filtered list will contain items
 that match the text provided by the input field, with a case-insensitive
 comparison. When this is not null, `enableFilter` must be set to true.

- **searchCallback**: `SearchCallback&lt;T&gt;?`
  When [DropdownMenu.enableSearch] is true, this callback is used to compute
 the index of the search result to be highlighted.

 

 In this example the `searchCallback` returns the index of the search result
 that exactly matches the query.

 ```dart
 DropdownMenu&lt;Text&gt;(
   searchCallback: (List&lt;DropdownMenuEntry&lt;Text&gt;&gt; entries, String query) ,
   dropdownMenuEntries: const <DropdownMenuEntry&lt;Text>&gt;[],
 )
 ```
 

 Defaults to null. If this is null and [DropdownMenu.enableSearch] is true,
 the default function will return the index of the first matching result
 which contains the contents of the text input field.

- **inputFormatters**: `List&lt;TextInputFormatter&gt;?`
  Optional input validation and formatting overrides.

 Formatters are run in the provided order when the user changes the text
 this widget contains. When this parameter changes, the new formatters will
 not be applied until the next time the user inserts or deletes text.
 Formatters don't run when the text is changed
 programmatically via [controller].

 See also:

  * [TextEditingController], which implements the [Listenable] interface
    and notifies its listeners on [TextEditingValue] changes.

- **alignmentOffset**: `Offset?`
  

- **closeBehavior**: `DropdownMenuCloseBehavior`
  Defines the behavior for closing the dropdown menu when an item is selected.

 The close behavior can be set to:
 * [DropdownMenuCloseBehavior.all]: Closes all open menus in the widget tree.
 * [DropdownMenuCloseBehavior.self]: Closes only the current dropdown menu.
 * [DropdownMenuCloseBehavior.none]: Does not close any menus.

 This property allows fine-grained control over the menu's closing behavior,
 which can be useful for creating nested or complex menu structures.

 Defaults to [DropdownMenuCloseBehavior.all].

- **maxLines**: `int?`
  Specifies the maximum number of lines the selected value can display
 in the [DropdownMenu].

 If the provided value is 1, then the text will not wrap, but will scroll
 horizontally instead. Defaults to 1.

 If this is null, there is no limit to the number of lines, and the text
 container will start with enough vertical space for one line and
 automatically grow to accommodate additional lines as they are entered, up
 to the height of its constraints.

 If this is not null, the provided value must be greater than zero. The text
 field will restrict the input to the given number of lines and take up enough
 horizontal space to accommodate that number of lines.

 See also:
  * [TextField.maxLines], which specifies the maximum number of lines
    the [TextField] can display.

- **textInputAction**: `TextInputAction?`
  

## Constructors

### Unnamed Constructor
Creates a const [DropdownMenu].

 The leading and trailing icons in the text field can be customized by using
 [leadingIcon], [trailingIcon] and [selectedTrailingIcon] properties. They are
 passed down to the [InputDecoration] properties, and will override values
 in the [InputDecoration.prefixIcon] and [InputDecoration.suffixIcon].

 Except leading and trailing icons, the text field can be configured by the
 [InputDecorationTheme] property. The menu can be configured by the [menuStyle].

