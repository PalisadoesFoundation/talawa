# Overview for `CupertinoSearchTextField`

## Description

A [CupertinoTextField] that mimics the look and behavior of UIKit's
 `UISearchTextField`.

 This control defaults to showing the basic parts of a `UISearchTextField`,
 like the 'Search' placeholder, prefix-ed Search icon, and suffix-ed
 X-Mark icon.

 To control the text that is displayed in the text field, use the
 [controller]. For example, to set the initial value of the text field, use
 a [controller] that already contains some text such as:

 
 This examples shows how to provide initial text to a [CupertinoSearchTextField]
 using the [controller] property.

 ** See code in examples/api/lib/cupertino/search_field/cupertino_search_field.0.dart **
 

 It is recommended to pass a [ValueChanged&lt;String&gt;] to both [onChanged] and
 [onSubmitted] parameters in order to be notified once the value of the
 field changes or is submitted by the keyboard:

 
 This examples shows how to be notified of field changes or submitted text from
 a [CupertinoSearchTextField].

 ** See code in examples/api/lib/cupertino/search_field/cupertino_search_field.1.dart **
 

 See also:

  * <https://developer.apple.com/design/human-interface-guidelines/ios/bars/search-bars/>

## Dependencies

- StatefulWidget

## Members

- **controller**: `TextEditingController?`
  Controls the text being edited.

 Similar to [CupertinoTextField], to provide a prefilled text entry, pass
 in a [TextEditingController] with an initial value to the [controller]
 parameter. Defaults to creating its own [TextEditingController].

- **onChanged**: `ValueChanged&lt;String&gt;?`
  Invoked upon user input.

- **onSubmitted**: `ValueChanged&lt;String&gt;?`
  Invoked upon keyboard submission.

- **style**: `TextStyle?`
  Allows changing the style of the text.

 Defaults to the gray [CupertinoColors.secondaryLabel] iOS color.

- **placeholder**: `String?`
  A hint placeholder text that appears when the text entry is empty.

 Defaults to 'Search' localized in each supported language.

- **placeholderStyle**: `TextStyle?`
  Sets the style of the placeholder of the text field.

 Defaults to the gray [CupertinoColors.secondaryLabel] iOS color.

- **decoration**: `BoxDecoration?`
  Sets the decoration for the text field.

 This property is automatically set using the [backgroundColor] and
 [borderRadius] properties, which both have default values. Therefore,
 [decoration] has a default value upon building the widget. It is designed
 to mimic the look of a `UISearchTextField`.

- **backgroundColor**: `Color?`
  Set the [decoration] property's background color.

 Can't be set along with the [decoration]. Defaults to the translucent
 [CupertinoColors.tertiarySystemFill] iOS color.

- **borderRadius**: `BorderRadius?`
  Sets the [decoration] property's border radius.

 Can't be set along with the [decoration]. Defaults to 9 px circular
 corner radius.

- **keyboardType**: `TextInputType?`
  The keyboard type for this search field.

 Defaults to [TextInputType.text].

- **padding**: `EdgeInsetsGeometry`
  Sets the padding insets for the text and placeholder.

 Defaults to padding that replicates the `UISearchTextField` look. The
 inset values were determined using the comparison tool in
 https://github.com/flutter/platform_tests/.

- **itemColor**: `Color`
  Sets the color for the suffix and prefix icons.

 Defaults to [CupertinoColors.secondaryLabel].

- **itemSize**: `double`
  Sets the base icon size for the suffix and prefix icons.

 The size of the icon is scaled using the accessibility font scale
 settings. Defaults to `20.0`.

- **prefixInsets**: `EdgeInsetsGeometry`
  Sets the padding insets for the suffix.

 Defaults to padding that replicates the `UISearchTextField` suffix look.
 The inset values were determined using the comparison tool in
 https://github.com/flutter/platform_tests/.

- **prefixIcon**: `Widget`
  Sets a prefix widget.

 Defaults to an [Icon] widget with the [CupertinoIcons.search] icon.

- **suffixInsets**: `EdgeInsetsGeometry`
  Sets the padding insets for the prefix.

 Defaults to padding that replicates the `UISearchTextField` prefix look.
 The inset values were determined using the comparison tool in
 https://github.com/flutter/platform_tests/.

- **suffixIcon**: `Icon`
  Sets the suffix widget's icon.

 Defaults to the X-Mark [CupertinoIcons.xmark_circle_fill]. "To change the
 functionality of the suffix icon, provide a custom onSuffixTap callback
 and specify an intuitive suffixIcon.

- **suffixMode**: `OverlayVisibilityMode`
  Dictates when the X-Mark (suffix) should be visible.

 Defaults to only on when editing.

- **onSuffixTap**: `VoidCallback?`
  Sets the X-Mark (suffix) action.

 Defaults to clearing the text. The suffix action is customizable
 so that users can override it with other functionality, that isn't
 necessarily clearing text.

- **restorationId**: `String?`
  

- **focusNode**: `FocusNode?`
  

- **autofocus**: `bool`
  

- **onTap**: `VoidCallback?`
  

- **autocorrect**: `bool`
  

- **smartQuotesType**: `SmartQuotesType?`
  Whether to allow the platform to automatically format quotes.

 This flag only affects iOS, where it is equivalent to [`UITextSmartQuotesType`](https://developer.apple.com/documentation/uikit/uitextsmartquotestype?language=objc).

 When set to [SmartQuotesType.enabled], it passes
 [`UITextSmartQuotesTypeYes`](https://developer.apple.com/documentation/uikit/uitextsmartquotestype/uitextsmartquotestypeyes?language=objc),
 and when set to [SmartQuotesType.disabled], it passes
 [`UITextSmartQuotesTypeNo`](https://developer.apple.com/documentation/uikit/uitextsmartquotestype/uitextsmartquotestypeno?language=objc).

 If set to null, [SmartQuotesType.enabled] will be used.

 As an example of what this does, a standard vertical double quote
 character will be automatically replaced by a left or right double quote
 depending on its position in a word.

 Defaults to null.

 See also:

  * [smartDashesType]
  * <https://developer.apple.com/documentation/uikit/uitextinputtraits>

- **smartDashesType**: `SmartDashesType?`
  Whether to allow the platform to automatically format dashes.

 This flag only affects iOS versions 11 and above, where it is equivalent to [`UITextSmartDashesType`](https://developer.apple.com/documentation/uikit/uitextsmartdashestype?language=objc).

 When set to [SmartDashesType.enabled], it passes
 [`UITextSmartDashesTypeYes`](https://developer.apple.com/documentation/uikit/uitextsmartdashestype/uitextsmartdashestypeyes?language=objc),
 and when set to [SmartDashesType.disabled], it passes
 [`UITextSmartDashesTypeNo`](https://developer.apple.com/documentation/uikit/uitextsmartdashestype/uitextsmartdashestypeno?language=objc).

 If set to null, [SmartDashesType.enabled] will be used.

 As an example of what this does, two consecutive hyphen characters will be
 automatically replaced with one en dash, and three consecutive hyphens
 will become one em dash.

 Defaults to null.

 See also:

  * [smartQuotesType]
  * <https://developer.apple.com/documentation/uikit/uitextinputtraits>

- **enableIMEPersonalizedLearning**: `bool`
  

- **enabled**: `bool?`
  Disables the text field when false.

 Text fields in disabled states have a light grey background and don't
 respond to touch events including the [prefixIcon] and [suffixIcon] button.

- **cursorWidth**: `double`
  

- **cursorHeight**: `double?`
  

- **cursorRadius**: `Radius`
  

- **cursorOpacityAnimates**: `bool`
  

- **cursorColor**: `Color?`
  The color to use when painting the cursor.

## Constructors

### Unnamed Constructor
Creates a [CupertinoTextField] that mimics the look and behavior of
 UIKit's `UISearchTextField`.

 Similar to [CupertinoTextField], to provide a prefilled text entry, pass
 in a [TextEditingController] with an initial value to the [controller]
 parameter.

 The [onChanged] parameter takes a [ValueChanged&lt;String&gt;] which is invoked
 upon a change in the text field's value.

 The [onSubmitted] parameter takes a [ValueChanged&lt;String&gt;] which is
 invoked when the keyboard submits.

 To provide a hint placeholder text that appears when the text entry is
 empty, pass a [String] to the [placeholder] parameter. This defaults to
 'Search'.

 The [style] and [placeholderStyle] properties allow changing the style of
 the text and placeholder of the text field. [placeholderStyle] defaults
 to the gray [CupertinoColors.secondaryLabel] iOS color.

 To set the text field's background color and border radius, pass a
 [BoxDecoration] to the [decoration] parameter. This defaults to the
 default translucent tertiarySystemFill iOS color and 9 px corner radius.

 The [itemColor] and [itemSize] properties allow changing the icon color
 and icon size of the search icon (prefix) and X-Mark (suffix).
 They default to [CupertinoColors.secondaryLabel] and `20.0`.

 The [padding], [prefixInsets], and [suffixInsets] let you set the padding
 insets for text, the search icon (prefix), and the X-Mark icon (suffix).
 They default to values that replicate the `UISearchTextField` look. These
 default fields were determined using the comparison tool in
 https://github.com/flutter/platform_tests/.

 To customize the prefix icon, pass a [Widget] to [prefixIcon]. This
 defaults to the search icon.

 To customize the suffix icon, pass an [Icon] to [suffixIcon]. This
 defaults to the X-Mark.

 To dictate when the X-Mark (suffix) should be visible, a.k.a. only on when
 editing, not editing, on always, or on never, pass a
 [OverlayVisibilityMode] to [suffixMode]. This defaults to only on when
 editing.

 To customize the X-Mark (suffix) action, pass a [VoidCallback] to
 [onSuffixTap]. This defaults to clearing the text.

