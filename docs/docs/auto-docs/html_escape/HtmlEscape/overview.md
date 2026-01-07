# Overview for `HtmlEscape`

## Description

Converter which escapes characters with special meaning in HTML.

 The converter finds characters that are significant in the HTML source and
 replaces them with corresponding HTML entities.

 The characters that need escaping in HTML are:

 * `&` (ampersand) always needs to be escaped.
 * `<` (less than) and `>` (greater than) when inside an element.
 * `"` (quote) when inside a double-quoted attribute value.
 * `'` (apostrophe) when inside a single-quoted attribute value.
       Apostrophe is escaped as `&#39;` instead of `&apos;` since
       not all browsers understand `&apos;`.
 * `/` (slash) is recommended to be escaped because it may be used
       to terminate an element in some HTML dialects.

 Escaping `>` (greater than) isn't necessary, but the result is often
 found to be easier to read if greater-than is also escaped whenever
 less-than is.

 Example:
 ```dart
 const HtmlEscape htmlEscape = ;
 String unescaped = 'Text & subject';
 String escaped = htmlEscape.convert(unescaped);
 print(escaped); // Text &amp; subject

 unescaped = '10 > 1 and 1 < 10';
 escaped = htmlEscape.convert(unescaped);
 print(escaped); // 10 &gt; 1 and 1 &lt; 10

 unescaped = "Single-quoted: 'text'";
 escaped = htmlEscape.convert(unescaped);
 print(escaped); // Single-quoted: &#39;text&#39;

 unescaped = 'Double-quoted: "text"';
 escaped = htmlEscape.convert(unescaped);
 print(escaped); // Double-quoted: &quot;text&quot;

 unescaped = 'Path: /system/';
 escaped = htmlEscape.convert(unescaped);
 print(escaped); // Path: &#47;system&#47;
 ```

## Dependencies

- Converter

## Members

- **mode**: `HtmlEscapeMode`
  The [HtmlEscapeMode] used by the converter.

## Constructors

### Unnamed Constructor
Create converter that escapes HTML characters.

 If [mode] is provided as either [HtmlEscapeMode.attribute] or
 [HtmlEscapeMode.element], only the corresponding subset of HTML
 characters is escaped.
 The default is to escape all HTML characters.

