# Overview for `HtmlEscapeMode`

## Description

HTML escape modes.

 Allows specifying a mode for HTML escaping that depends on the context
 where the escaped result is going to be used.
 The relevant contexts are:

 * as text content of an HTML element.
 * as value of a (single- or double-) quoted attribute value.

 All modes require escaping of `&` (ampersand) characters, and may
 enable escaping of more characters.

 Custom escape modes can be created using the [HtmlEscapeMode.new]
 constructor.

 Example:
 ```dart
 const htmlEscapeMode = HtmlEscapeMode(
   name: 'custom',
   escapeLtGt: true,
   escapeQuot: false,
   escapeApos: false,
   escapeSlash: false,
  );

 const HtmlEscape htmlEscape = HtmlEscape(htmlEscapeMode);
 String unescaped = 'Text & subject';
 String escaped = htmlEscape.convert(unescaped);
 print(escaped); // Text &amp; subject

 unescaped = '10 > 1 and 1 < 10';
 escaped = htmlEscape.convert(unescaped);
 print(escaped); // 10 &gt; 1 and 1 &lt; 10

 unescaped = "Single-quoted: 'text'";
 escaped = htmlEscape.convert(unescaped);
 print(escaped); // Single-quoted: 'text'

 unescaped = 'Double-quoted: "text"';
 escaped = htmlEscape.convert(unescaped);
 print(escaped); // Double-quoted: "text"

 unescaped = 'Path: /system/';
 escaped = htmlEscape.convert(unescaped);
 print(escaped); // Path: /system/
 ```

## Members

- **_name**: `String`
- **escapeLtGt**: `bool`
  Whether to escape '<' and '>'.

- **escapeQuot**: `bool`
  Whether to escape '"' (quote).

- **escapeApos**: `bool`
  Whether to escape "'" (apostrophe).

- **escapeSlash**: `bool`
  Whether to escape "/" (forward slash, solidus).

 Escaping a slash is recommended to avoid cross-site scripting attacks by
 [the Open Web Application Security Project](https://www.owasp.org/index.php/XSS_(Cross_Site_Scripting)_Prevention_Cheat_Sheet#RULE_.231_-_HTML_Escape_Before_Inserting_Untrusted_Data_into_HTML_Element_Content)

- **unknown**: `HtmlEscapeMode`
  Default escaping mode, which escapes all characters.

 The result of such an escaping is usable both in element content and
 in any attribute value.

 The escaping only works for elements with normal HTML content,
 and not, for example, for script or style element content,
 which require escapes matching their particular content syntax.

- **attribute**: `HtmlEscapeMode`
  Escaping mode for text going into double-quoted HTML attribute values.

 The result should not be used as the content of an unquoted
 or single-quoted attribute value.

 Escapes double quotes (`"`) but not single quotes (`'`),
 and escapes `<` and `>` characters because they are not allowed
 in strict XHTML attributes

- **sqAttribute**: `HtmlEscapeMode`
  Escaping mode for text going into single-quoted HTML attribute values.

 The result should not be used as the content of an unquoted
 or double-quoted attribute value.

 Escapes single quotes (`'`) but not double quotes (`"`),
 and escapes `<` and `>` characters because they are not allowed
 in strict XHTML attributes.

- **element**: `HtmlEscapeMode`
  Escaping mode for text going into HTML element content.

 The escaping only works for elements with normal HTML content,
 and not, for example, for script or style element content,
 which require escapes matching their particular content syntax.

 Escapes `<` and `>` characters.

## Constructors

### _


#### Parameters

- `_name`: `dynamic`
- `escapeLtGt`: `dynamic`
- `escapeQuot`: `dynamic`
- `escapeApos`: `dynamic`
- `escapeSlash`: `dynamic`
### Unnamed Constructor
Create a custom escaping mode.

 All modes escape `&`.
 The mode can further be set to escape `<` and `>` ([escapeLtGt]),
 `"` ([escapeQuot]), `'` ([escapeApos]), and/or `/` ([escapeSlash]).

