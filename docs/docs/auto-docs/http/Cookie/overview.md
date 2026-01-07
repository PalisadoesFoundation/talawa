# Overview for `Cookie`

## Description

Representation of a cookie. For cookies received by the server as Cookie
 header values only [name] and [value] properties will be set. When building a
 cookie for the 'set-cookie' header in the server and when receiving cookies
 in the client as 'set-cookie' headers all fields can be used.

## Members

- **name**: `String`
  The name of the cookie.

 Must be a `token` as specified in RFC 6265.

 The allowed characters in a `token` are the visible ASCII characters,
 U+0021 (`!`) through U+007E (`~`), except the separator characters:
 `(`, `)`, `<`, `>`, `@`, `,`, `;`, `:`, `\`, `"`, `/`, `[`, `]`, `?`, `=`,
 ``.

- **value**: `String`
  The value of the cookie.

 Must be a `cookie-value` as specified in RFC 6265.

 The allowed characters in a cookie value are the visible ASCII characters,
 U+0021 (`!`) through U+007E (`~`) except the characters:
 `"`, `,`, `;` and `\`.
 Cookie values may be wrapped in a single pair of double quotes
 (U+0022, `"`).

- **expires**: `DateTime?`
  The time at which the cookie expires.

- **maxAge**: `int?`
  The number of seconds until the cookie expires. A zero or negative value
 means the cookie has expired.

- **domain**: `String?`
  The domain that the cookie applies to.

- **path**: `String?`
  The path within the [domain] that the cookie applies to.

- **secure**: `bool`
  Whether to only send this cookie on secure connections.

- **httpOnly**: `bool`
  Whether the cookie is only sent in the HTTP request and is not made
 available to client side scripts.

- **sameSite**: `SameSite?`
  Whether the cookie is available from other sites.

 This value is `null` if the SameSite attribute is not present.

 See [SameSite] for more information.

## Constructors

### Unnamed Constructor
Creates a new cookie setting the name and value.

 [name] and [value] must be composed of valid characters according to RFC
 6265.

 By default the value of `httpOnly` will be set to `true`.

### fromSetCookieValue
Creates a new cookie by parsing a header value from a 'set-cookie'
 header.

#### Parameters

- `value`: `String`
