# Overview for `LengthLimitingTextInputFormatter`

## Description

A [TextInputFormatter] that prevents the insertion of more characters
 than allowed.

 Since this formatter only prevents new characters from being added to the
 text, it preserves the existing [TextEditingValue.selection].

 Characters are counted as user-perceived characters using the
 [characters](https://pub.dev/packages/characters) package, so even complex
 characters like extended grapheme clusters and surrogate pairs are counted
 as single characters.

 See also:
  * [maxLength], which discusses the precise meaning of "number of
    characters".

## Dependencies

- TextInputFormatter

## Members

- **maxLength**: `int?`
  The limit on the number of user-perceived characters that this formatter
 will allow.

 The value must be null or greater than zero. If it is null or -1, then no
 limit is enforced.

 
 ## Characters

 For a specific definition of what is considered a character, see the
 [characters](https://pub.dev/packages/characters) package on Pub, which is
 what Flutter uses to delineate characters. In general, even complex
 characters like surrogate pairs and extended grapheme clusters are
 correctly interpreted by Flutter as each being a single user-perceived
 character.

 For instance, the character "ö" can be represented as '\u\u',
 which is the letter "o" followed by a composed diaeresis "¨", or it can
 be represented as '\u', which is the Unicode scalar value "LATIN
 SMALL LETTER O WITH DIAERESIS". It will be counted as a single character
 in both cases.

 Similarly, some emoji are represented by multiple scalar values. The
 Unicode "THUMBS UP SIGN + MEDIUM SKIN TONE MODIFIER", "👍🏽"is counted as
 a single character, even though it is a combination of two Unicode scalar
 values, '\u\u'.
 

 ### Composing text behaviors

 There is no guarantee for the final value before the composing ends.
 So while the value is composing, the constraint of [maxLength] will be
 temporary lifted until the composing ends.

 In addition, if the current value already reached the [maxLength],
 composing is not allowed.

- **maxLengthEnforcement**: `MaxLengthEnforcement?`
  Determines how the [maxLength] limit should be enforced.

 Defaults to [MaxLengthEnforcement.enforced].

 

## Constructors

### Unnamed Constructor
Creates a formatter that prevents the insertion of more characters than a
 limit.

 The [maxLength] must be null, -1 or greater than zero. If it is null or -1
 then no limit is enforced.

