# Method: `parse`

## Description

Creates a new content type object from parsing a Content-Type
 header value. As primary type, sub type and parameter names and
 values are not case sensitive all these values will be converted
 to lower case. Parsing this string

     text/html; charset=utf-8

 will create a content type object with primary type "text",
 subtype "html" and parameter "charset" with value "utf-8".
 There may be more parameters supplied, but they are not recognized
 by this class.

## Return Type
`ContentType`

## Parameters

- `value`: `String`
