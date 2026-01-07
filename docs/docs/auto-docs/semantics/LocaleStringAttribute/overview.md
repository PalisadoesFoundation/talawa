# Overview for `LocaleStringAttribute`

## Description

A string attribute that causes the assistive technologies, e.g. VoiceOver,
 to treat string as a certain language.

 See also:

  * [AttributedString], where the string attributes are used.
  * [SpellOutStringAttribute], which causes the assistive technologies to
    spell out the string character by character when announcing the string.

## Dependencies

- StringAttribute

## Members

- **locale**: `Locale`
  The language of this attribute.

## Constructors

### Unnamed Constructor
Creates a string attribute that denotes the text in [range] must be
 treated as the language specified by the [locale] when the assistive
 technologies announce the string.

