# Overview for `Unicode`

## Description

Constants for useful Unicode characters.

 Currently, these characters are all related to bidirectional text.

 See also:

  * <http://unicode.org/reports/tr9/>, which describes the Unicode
    bidirectional text algorithm.

## Members

- **LRE**: `String`
  `U+202A LEFT-TO-RIGHT EMBEDDING`

 Treat the following text as embedded left-to-right.

 Use [PDF] to end the embedding.

- **RLE**: `String`
  `U+202B RIGHT-TO-LEFT EMBEDDING`

 Treat the following text as embedded right-to-left.

 Use [PDF] to end the embedding.

- **PDF**: `String`
  `U+202C POP DIRECTIONAL FORMATTING`

 End the scope of the last [LRE], [RLE], [RLO], or [LRO].

- **LRO**: `String`
  `U+202A LEFT-TO-RIGHT OVERRIDE`

 Force following characters to be treated as strong left-to-right characters.

 For example, this causes Hebrew text to render backwards.

 Use [PDF] to end the override.

- **RLO**: `String`
  `U+202B RIGHT-TO-LEFT OVERRIDE`

 Force following characters to be treated as strong right-to-left characters.

 For example, this causes English text to render backwards.

 Use [PDF] to end the override.

- **LRI**: `String`
  `U+2066 LEFT-TO-RIGHT ISOLATE`

 Treat the following text as isolated and left-to-right.

 Use [PDI] to end the isolated scope.

- **RLI**: `String`
  `U+2067 RIGHT-TO-LEFT ISOLATE`

 Treat the following text as isolated and right-to-left.

 Use [PDI] to end the isolated scope.

- **FSI**: `String`
  `U+2068 FIRST STRONG ISOLATE`

 Treat the following text as isolated and in the direction of its first
 strong directional character that is not inside a nested isolate.

 This essentially "auto-detects" the directionality of the text. It is not
 100% reliable. For example, Arabic text that starts with an English quote
 will be detected as LTR, not RTL, which will lead to the text being in a
 weird order.

 Use [PDI] to end the isolated scope.

- **PDI**: `String`
  `U+2069 POP DIRECTIONAL ISOLATE`

 End the scope of the last [LRI], [RLI], or [FSI].

- **LRM**: `String`
  `U+200E LEFT-TO-RIGHT MARK`

 Left-to-right zero-width character.

- **RLM**: `String`
  `U+200F RIGHT-TO-LEFT MARK`

 Right-to-left zero-width non-Arabic character.

- **ALM**: `String`
  `U+061C ARABIC LETTER MARK`

 Right-to-left zero-width Arabic character.

