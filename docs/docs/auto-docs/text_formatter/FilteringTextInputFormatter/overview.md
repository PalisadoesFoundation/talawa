# Overview for `FilteringTextInputFormatter`

## Description

A [TextInputFormatter] that prevents the insertion of characters matching
 (or not matching) a particular pattern, by replacing the characters with the
 given [replacementString].

 Instances of filtered characters found in the new [TextEditingValue]s
 will be replaced by the [replacementString] which defaults to the empty
 string, and the current [TextEditingValue.selection] and
 [TextEditingValue.composing] region will be adjusted to account for the
 replacement.

 This formatter is typically used to match potentially recurring [Pattern]s
 in the new [TextEditingValue]. It never completely rejects the new
 [TextEditingValue] and falls back to the current [TextEditingValue] when the
 given [filterPattern] fails to match. Consider using a different
 [TextInputFormatter] such as:

 ```dart
 // _pattern is a RegExp or other Pattern object
 TextInputFormatter.withFunction(
   (TextEditingValue oldValue, TextEditingValue newValue) ,
 ),
 ```

 for accepting/rejecting new input based on a predicate on the full string.
 As an example, [FilteringTextInputFormatter] typically shouldn't be used
 with [RegExp]s that contain positional matchers (`^` or `$`) since these
 patterns are usually meant for matching the whole string.

 ### Quote characters on iOS

 When filtering single (`'`) or double (`"`) quote characters, be aware that
 the default iOS keyboard actually inserts special directional versions of
 these characters (`‘` and `’` for single quote, and `“` and `”` for double
 quote). Consider including all three variants in your regular expressions to
 support iOS.

## Dependencies

- TextInputFormatter

## Members

- **filterPattern**: `Pattern`
  A [Pattern] to match or replace in incoming [TextEditingValue]s.

 The behavior of the pattern depends on the [allow] property. If
 it is true, then this is an allow list, specifying a pattern that
 characters must match to be accepted. Otherwise, it is a deny list,
 specifying a pattern that characters must not match to be accepted.

 
 Typically the pattern is a regular expression, as in:

 ```dart
 FilteringTextInputFormatter onlyDigits = FilteringTextInputFormatter.allow(RegExp(r'[0-9]'));
 ```
 

 
 If the pattern is a single character, a pattern consisting of a
 [String] can be used:

 ```dart
 FilteringTextInputFormatter noTabs = FilteringTextInputFormatter.deny('\t');
 ```
 

- **allow**: `bool`
  Whether the pattern is an allow list or not.

 When true, [filterPattern] denotes an allow list: characters
 must match the filter to be allowed.

 When false, [filterPattern] denotes a deny list: characters
 that match the filter are disallowed.

- **replacementString**: `String`
  String used to replace banned patterns.

 For deny lists ([allow] is false), each match of the
 [filterPattern] is replaced with this string. If [filterPattern]
 can match more than one character at a time, then this can
 result in multiple characters being replaced by a single
 instance of this [replacementString].

 For allow lists ([allow] is true), sequences between matches of
 [filterPattern] are replaced as one, regardless of the number of
 characters.

 For example, consider a [filterPattern] consisting of just the
 letter "o", applied to text field whose initial value is the
 string "Into The Woods", with the [replacementString] set to
 `*`.

 If [allow] is true, then the result will be "*o*oo*". Each
 sequence of characters not matching the pattern is replaced by
 its own single copy of the replacement string, regardless of how
 many characters are in that sequence.

 If [allow] is false, then the result will be "Int* the W**ds".
 Every matching sequence is replaced, and each "o" matches the
 pattern separately.

 If the pattern was the [RegExp] `o+`, the result would be the
 same in the case where [allow] is true, but in the case where
 [allow] is false, the result would be "Int* the W*ds" (with the
 two "o"s replaced by a single occurrence of the replacement
 string) because both of the "o"s would be matched simultaneously
 by the pattern.

 The filter may adjust the selection and the composing region of the text
 after applying the text replacement, such that they still cover the same
 text. For instance, if the pattern was `o+` and the last character "s" was
 selected: "Into The Wood|s|", then the result will be "Into The W*d|s|",
 with the selection still around the same character "s" despite that it is
 now the 12th character.

 In the case where one end point of the selection (or the composing region)
 is strictly inside the banned pattern (for example, "Into The |Wo|ods"),
 that endpoint will be moved to the end of the replacement string (it will
 become "Into The |W*|ds" if the pattern was `o+` and the original text and
 selection were "Into The |Wo|ods").

- **singleLineFormatter**: `TextInputFormatter`
  A [TextInputFormatter] that forces input to be a single line.

- **digitsOnly**: `TextInputFormatter`
  A [TextInputFormatter] that takes in digits `[0-9]` only.

## Constructors

### Unnamed Constructor
Creates a formatter that replaces banned patterns with the given
 [replacementString].

 If [allow] is true, then the filter pattern is an allow list,
 and characters must match the pattern to be accepted. See also
 the [FilteringTextInputFormatter.] constructor.

 If [allow] is false, then the filter pattern is a deny list,
 and characters that match the pattern are rejected. See also
 the [FilteringTextInputFormatter.deny] constructor.

### allow
Creates a formatter that only allows characters matching a pattern.

#### Parameters

- `filterPattern`: `Pattern`
- ``: `dynamic`
### deny
Creates a formatter that blocks characters matching a pattern.

#### Parameters

- `filterPattern`: `Pattern`
- ``: `dynamic`
