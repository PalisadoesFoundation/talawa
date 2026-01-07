# Overview for `CupertinoTextField`

## Description

An iOS-style text field.

 A text field lets the user enter text, either with a hardware keyboard or with
 an onscreen keyboard.

 This widget corresponds to both a `UITextField` and an editable `UITextView`
 on iOS.

 The text field calls the [onChanged] callback whenever the user changes the
 text in the field. If the user indicates that they are done typing in the
 field (e.g., by pressing a button on the soft keyboard), the text field
 calls the [onSubmitted] callback.

 

 
 This example shows how to set the initial value of the [CupertinoTextField] using
 a [controller] that already contains some text.

 ** See code in examples/api/lib/cupertino/text_field/cupertino_text_field.0.dart **
 

 The [controller] can also control the selection and composing region (and to
 observe changes to the text, selection, and composing region).

 The text field has an overridable [decoration] that, by default, draws a
 rounded rectangle border around the text field. If you set the [decoration]
 property to null, the decoration will be removed entirely.

 

 Remember to call [TextEditingController.dispose] when it is no longer
 needed. This will ensure we discard any resources used by the object.

 

 ## Scrolling Considerations

 If this [CupertinoTextField] is not a descendant of [Scaffold] and is being
 used within a [Scrollable] or nested [Scrollable]s, consider placing a
 [ScrollNotificationObserver] above the root [Scrollable] that contains this
 [CupertinoTextField] to ensure proper scroll coordination for
 [CupertinoTextField] and its components like [TextSelectionOverlay].

 See also:

  * <https://developer.apple.com/documentation/uikit/uitextfield>
  * [TextField], an alternative text field widget that follows the Material
    Design UI conventions.
  * [EditableText], which is the raw text editing control at the heart of a
    [TextField].
  * Learn how to use a [TextEditingController] in one of our [cookbook recipes](https://docs.flutter.dev/cookbook/forms/text-field-changes#2-use-a-texteditingcontroller).
  * <https://developer.apple.com/design/human-interface-guidelines/ios/controls/text-fields/>

## Dependencies

- StatefulWidget

## Members

- **groupId**: `Object`
  

- **controller**: `TextEditingController?`
  Controls the text being edited.

 If null, this widget will create its own [TextEditingController].

- **focusNode**: `FocusNode?`
  

- **decoration**: `BoxDecoration?`
  Controls the [BoxDecoration] of the box behind the text input.

 Defaults to having a rounded rectangle grey border and can be null to have
 no box decoration.

- **padding**: `EdgeInsetsGeometry`
  Padding around the text entry area between the [prefix] and [suffix]
 or the clear button when [clearButtonMode] is not never.

 Defaults to a padding of 6 pixels on all sides and can be null.

- **placeholder**: `String?`
  A lighter colored placeholder hint that appears on the first line of the
 text field when the text entry is empty.

 Defaults to having no placeholder text.

 The text style of the placeholder text matches that of the text field's
 main text entry except a lighter font weight and a grey font color.

- **placeholderStyle**: `TextStyle?`
  The style to use for the placeholder text.

 The [placeholderStyle] is merged with the [style] [TextStyle] when applied
 to the [placeholder] text. To avoid merging with [style], specify
 [TextStyle.inherit] as false.

 Defaults to the [style] property with w300 font weight and grey color.

 If specifically set to null, placeholder's style will be the same as [style].

- **prefix**: `Widget?`
  An optional [Widget] to display before the text.

- **prefixMode**: `OverlayVisibilityMode`
  Controls the visibility of the [prefix] widget based on the state of
 text entry when the [prefix] argument is not null.

 Defaults to [OverlayVisibilityMode.always].

 Has no effect when [prefix] is null.

- **suffix**: `Widget?`
  An optional [Widget] to display after the text.

- **suffixMode**: `OverlayVisibilityMode`
  Controls the visibility of the [suffix] widget based on the state of
 text entry when the [suffix] argument is not null.

 Defaults to [OverlayVisibilityMode.always].

 Has no effect when [suffix] is null.

- **crossAxisAlignment**: `CrossAxisAlignment`
  Controls the vertical alignment of the [prefix] and the [suffix] widget in relation to content.

 Defaults to [CrossAxisAlignment.center].

 Has no effect when both the [prefix] and [suffix] are null.

- **clearButtonMode**: `OverlayVisibilityMode`
  Show an iOS-style clear button to clear the current text entry.

 Can be made to appear depending on various text states of the
 [TextEditingController].

 Will only appear if no [suffix] widget is appearing.

 Defaults to [OverlayVisibilityMode.never].

- **clearButtonSemanticLabel**: `String?`
  The semantic label for the clear button used by screen readers.

 This will be used by screen reading software to identify the clear button
 widget. Defaults to "Clear".

- **keyboardType**: `TextInputType`
  

- **textInputAction**: `TextInputAction?`
  The type of action button to use for the keyboard.

 Defaults to [TextInputAction.newline] if [keyboardType] is
 [TextInputType.multiline] and [TextInputAction.done] otherwise.

- **textCapitalization**: `TextCapitalization`
  

- **style**: `TextStyle?`
  The style to use for the text being edited.

 Also serves as a base for the [placeholder] text's style.

 Defaults to the standard iOS font style from [CupertinoTheme] if null.

- **strutStyle**: `StrutStyle?`
  

- **textAlign**: `TextAlign`
  

- **toolbarOptions**: `ToolbarOptions?`
  Configuration of toolbar options.

 If not set, select all and paste will default to be enabled. Copy and cut
 will be disabled if [obscureText] is true. If [readOnly] is true,
 paste and cut will be disabled regardless.

- **textAlignVertical**: `TextAlignVertical?`
  

- **textDirection**: `TextDirection?`
  

- **readOnly**: `bool`
  

- **showCursor**: `bool?`
  

- **autofocus**: `bool`
  

- **obscuringCharacter**: `String`
  

- **obscureText**: `bool`
  

- **autocorrect**: `bool`
  

- **smartDashesType**: `SmartDashesType`
  

- **smartQuotesType**: `SmartQuotesType`
  

- **enableSuggestions**: `bool`
  

- **maxLines**: `int?`
  
  * [expands], which determines whether the field should fill the height of
    its parent.

- **minLines**: `int?`
  
  * [expands], which determines whether the field should fill the height of
    its parent.

- **expands**: `bool`
  

- **maxLength**: `int?`
  The maximum number of characters (Unicode grapheme clusters) to allow in
 the text field.

 After [maxLength] characters have been input, additional input
 is ignored, unless [maxLengthEnforcement] is set to
 [MaxLengthEnforcement.none].

 The TextField enforces the length with a
 [LengthLimitingTextInputFormatter], which is evaluated after the supplied
 [inputFormatters], if any.

 This value must be either null or greater than zero. If set to null
 (the default), there is no limit to the number of characters allowed.

 Whitespace characters (e.g. newline, space, tab) are included in the
 character count.

 

- **maxLengthEnforcement**: `MaxLengthEnforcement?`
  Determines how the [maxLength] limit should be enforced.

 If [MaxLengthEnforcement.none] is set, additional input beyond [maxLength]
 will not be enforced by the limit.

 

 

- **onChanged**: `ValueChanged&lt;String&gt;?`
  

- **onEditingComplete**: `VoidCallback?`
  

- **onSubmitted**: `ValueChanged&lt;String&gt;?`
  

 See also:

  * [TextInputAction.next] and [TextInputAction.previous], which
    automatically shift the focus to the next/previous focusable item when
    the user is done editing.

- **onTapOutside**: `TapRegionCallback?`
  

- **onTapUpOutside**: `TapRegionCallback?`
  

- **inputFormatters**: `List&lt;TextInputFormatter&gt;?`
  

- **enabled**: `bool`
  Disables the text field when false.

 Text fields in disabled states have a light grey background and don't
 respond to touch events including the [prefix], [suffix] and the clear
 button.

 Defaults to true.

- **cursorWidth**: `double`
  

- **cursorHeight**: `double?`
  

- **cursorRadius**: `Radius`
  

- **cursorOpacityAnimates**: `bool`
  

- **cursorColor**: `Color?`
  The color to use when painting the cursor.

 Defaults to the [DefaultSelectionStyle.cursorColor]. If that color is
 null, it uses the [CupertinoThemeData.primaryColor] of the ambient theme,
 which itself defaults to [CupertinoColors.activeBlue] in the light theme
 and [CupertinoColors.activeOrange] in the dark theme.

- **selectionHeightStyle**: `ui.BoxHeightStyle`
  Controls how tall the selection highlight boxes are computed to be.

 See [ui.BoxHeightStyle] for details on available styles.

- **selectionWidthStyle**: `ui.BoxWidthStyle`
  Controls how wide the selection highlight boxes are computed to be.

 See [ui.BoxWidthStyle] for details on available styles.

- **keyboardAppearance**: `Brightness?`
  The appearance of the keyboard.

 This setting is only honored on iOS devices.

 If null, defaults to [Brightness.light].

- **scrollPadding**: `EdgeInsets`
  

- **enableInteractiveSelection**: `bool`
  

- **selectionControls**: `TextSelectionControls?`
  

- **dragStartBehavior**: `DragStartBehavior`
  

- **scrollController**: `ScrollController?`
  

- **scrollPhysics**: `ScrollPhysics?`
  

- **onTap**: `GestureTapCallback?`
  

- **autofillHints**: `Iterable&lt;String&gt;?`
  
 

- **clipBehavior**: `Clip`
  

 Defaults to [Clip.hardEdge].

- **restorationId**: `String?`
  

- **scribbleEnabled**: `bool`
  

- **stylusHandwritingEnabled**: `bool`
  

- **enableIMEPersonalizedLearning**: `bool`
  

- **contentInsertionConfiguration**: `ContentInsertionConfiguration?`
  

- **contextMenuBuilder**: `EditableTextContextMenuBuilder?`
  

 If not provided, will build a default menu based on the platform.

 See also:

  * [CupertinoAdaptiveTextSelectionToolbar], which is built by default.

- **magnifierConfiguration**: `TextMagnifierConfiguration?`
  Configuration for the text field magnifier.

 By default (when this property is set to null), a [CupertinoTextMagnifier]
 is used on mobile platforms, and nothing on desktop platforms. To suppress
 the magnifier on all platforms, consider passing
 [TextMagnifierConfiguration.disabled] explicitly.

 

 
 This sample demonstrates how to customize the magnifier that this text field uses.

 ** See code in examples/api/lib/widgets/text_magnifier/text_magnifier.0.dart **
 

- **spellCheckConfiguration**: `SpellCheckConfiguration?`
  

 If [SpellCheckConfiguration.misspelledTextStyle] is not specified in this
 configuration, then [cupertinoMisspelledTextStyle] is used by default.

- **cupertinoMisspelledTextStyle**: `TextStyle`
  The [TextStyle] used to indicate misspelled words in the Cupertino style.

 See also:
  * [SpellCheckConfiguration.misspelledTextStyle], the style configured to
    mark misspelled words with.
  * [TextField.materialMisspelledTextStyle], the style configured
    to mark misspelled words with in the Material style.

- **kMisspelledSelectionColor**: `Color`
  The color of the selection highlight when the spell check menu is visible.

 Eyeballed from a screenshot taken on an iPhone 11 running iOS 16.2.

- **undoController**: `UndoHistoryController?`
  

- **_iosMagnifierConfiguration**: `TextMagnifierConfiguration`
## Constructors

### Unnamed Constructor
Creates an iOS-style text field.

 To provide a prefilled text entry, pass in a [TextEditingController] with
 an initial value to the [controller] parameter.

 To provide a hint placeholder text that appears when the text entry is
 empty, pass a [String] to the [placeholder] parameter.

 The [maxLines] property can be set to null to remove the restriction on
 the number of lines. In this mode, the intrinsic height of the widget will
 grow as the number of lines of text grows. By default, it is `1`, meaning
 this is a single-line text field and will scroll horizontally when
 it overflows. [maxLines] must not be zero.

 The text cursor is not shown if [showCursor] is false or if [showCursor]
 is null (the default) and [readOnly] is true.

 If specified, the [maxLength] property must be greater than zero.

 The [selectionHeightStyle] and [selectionWidthStyle] properties allow
 changing the shape of the selection highlighting. These properties default
 to [ui.BoxHeightStyle.tight] and [ui.BoxWidthStyle.tight], respectively.

 The [autocorrect], [autofocus], [clearButtonMode], [dragStartBehavior],
 [expands], [obscureText], [prefixMode], [readOnly], [scrollPadding],
 [suffixMode], [textAlign], [selectionHeightStyle], [selectionWidthStyle],
 [enableSuggestions], and [enableIMEPersonalizedLearning] properties must
 not be null.

 

 See also:

  * [minLines], which is the minimum number of lines to occupy when the
    content spans fewer lines.
  * [expands], to allow the widget to size itself to its parent's height.
  * [maxLength], which discusses the precise meaning of "number of
    characters" and how it may differ from the intuitive meaning.

### borderless
Creates a borderless iOS-style text field.

 To provide a prefilled text entry, pass in a [TextEditingController] with
 an initial value to the [controller] parameter.

 To provide a hint placeholder text that appears when the text entry is
 empty, pass a [String] to the [placeholder] parameter.

 The [maxLines] property can be set to null to remove the restriction on
 the number of lines. In this mode, the intrinsic height of the widget will
 grow as the number of lines of text grows. By default, it is `1`, meaning
 this is a single-line text field and will scroll horizontally when
 it overflows. [maxLines] must not be zero.

 The text cursor is not shown if [showCursor] is false or if [showCursor]
 is null (the default) and [readOnly] is true.

 If specified, the [maxLength] property must be greater than zero.

 The [selectionHeightStyle] and [selectionWidthStyle] properties allow
 changing the shape of the selection highlighting. These properties default
 to [ui.BoxHeightStyle.tight] and [ui.BoxWidthStyle.tight] respectively.

 See also:

  * [minLines], which is the minimum number of lines to occupy when the
    content spans fewer lines.
  * [expands], to allow the widget to size itself to its parent's height.
  * [maxLength], which discusses the precise meaning of "number of
    characters" and how it may differ from the intuitive meaning.

#### Parameters

- ``: `dynamic`
- ``: `dynamic`
- ``: `dynamic`
- ``: `dynamic`
- ``: `dynamic`
- ``: `dynamic`
- ``: `dynamic`
- ``: `dynamic`
- ``: `dynamic`
- ``: `dynamic`
- ``: `dynamic`
- ``: `dynamic`
- ``: `dynamic`
- ``: `dynamic`
- ``: `dynamic`
- ``: `dynamic`
- ``: `dynamic`
- ``: `dynamic`
- ``: `dynamic`
- ``: `dynamic`
- ``: `dynamic`
- ``: `dynamic`
- ``: `dynamic`
- ``: `dynamic`
- ``: `dynamic`
- ``: `dynamic`
- ``: `dynamic`
- ``: `dynamic`
- ``: `dynamic`
- ``: `dynamic`
- ``: `dynamic`
- ``: `dynamic`
- ``: `dynamic`
- ``: `dynamic`
- ``: `dynamic`
- ``: `dynamic`
- ``: `dynamic`
- ``: `dynamic`
- ``: `dynamic`
- ``: `dynamic`
- ``: `dynamic`
- ``: `dynamic`
- ``: `dynamic`
- ``: `dynamic`
- ``: `dynamic`
- ``: `dynamic`
- ``: `dynamic`
- ``: `dynamic`
- ``: `dynamic`
- ``: `dynamic`
- ``: `dynamic`
- ``: `dynamic`
- ``: `dynamic`
- ``: `dynamic`
- ``: `dynamic`
- ``: `dynamic`
- ``: `dynamic`
- ``: `dynamic`
- ``: `dynamic`
- ``: `dynamic`
- ``: `dynamic`
- ``: `dynamic`
- ``: `dynamic`
- ``: `dynamic`
- ``: `dynamic`
- ``: `dynamic`
- ``: `dynamic`
- ``: `dynamic`
- ``: `dynamic`
- ``: `dynamic`
- ``: `dynamic`
