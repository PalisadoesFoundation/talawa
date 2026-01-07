# Overview for `HeaderValue`

## Description

Representation of a header value in the form:
 ```plaintext
 value; parameter1=value1; parameter2=value2
 ```

 [HeaderValue] can be used to conveniently build and parse header
 values on this form.

 Parameter values can be omitted, in which case the value is parsed as `null`.
 Values can be doubled quoted to allow characters outside of the RFC 7230
 token characters and backslash sequences can be used to represent the double
 quote and backslash characters themselves.

 To build an "accepts" header with the value

     text/plain; q=0.3, text/html

 use code like this:

     HttpClientRequest request = ...;
     var v = HeaderValue("text/plain", );
     request.headers.add(HttpHeaders.acceptHeader, v);
     request.headers.add(HttpHeaders.acceptHeader, "text/html");

 To parse the header values use the [parse] static method.

     HttpRequest request = ...;
     List&lt;String&gt; values = request.headers[HttpHeaders.acceptHeader];
     values.forEach((value) );

 An instance of [HeaderValue] is immutable.

## Constructors

### Unnamed Constructor
Creates a new header value object setting the value and parameters.

