# Overview for `StringAttribute`

## Description

An abstract interface for string attributes that affects how assistive
 technologies, e.g. VoiceOver or TalkBack, treat the text.

 See also:

  * [AttributedString], where the string attributes are used.
  * [SpellOutStringAttribute], which causes the assistive technologies to
    spell out the string character by character when announcing the string.
  * [LocaleStringAttribute], which causes the assistive technologies to
    treat the string in the specific language.

## Dependencies

- NativeFieldWrapperClass1

## Members

- **range**: `TextRange`
  The range of the text to which this attribute applies.

## Constructors

### _


#### Parameters

- ``: `dynamic`
