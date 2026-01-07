# Overview for `JSString`

## Description

The interceptor class for [String]. The compiler recognizes this
 class as an interceptor, and changes references to [:this:] to
 actually use the receiver of the method, which is generated as an extra
 argument added to each member.

## Dependencies

- Interceptor, String, JSIndexable, TrustedGetRuntimeType

## Constructors

### Unnamed Constructor


