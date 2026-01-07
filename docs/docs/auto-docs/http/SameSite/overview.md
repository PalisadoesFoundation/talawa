# Overview for `SameSite`

## Description

Cookie cross-site availability configuration.

 The value of [Cookie.sameSite], which defines whether an
 HTTP cookie is available from other sites or not.

 Has three possible values: [lax], [strict] and [none].

## Members

- **lax**: `dynamic`
  Default value, cookie with this value will generally not be sent on
 cross-site requests, unless the user is navigated to the original site.

- **strict**: `dynamic`
  Cookie with this value will never be sent on cross-site requests.

- **none**: `dynamic`
  Cookie with this value will be sent in all requests.

 [Cookie.secure] must also be set to true, otherwise the `none` value
 will have no effect.

- **values**: `List&lt;SameSite&gt;`
- **name**: `String`
## Constructors

### _


#### Parameters

- `name`: `dynamic`
