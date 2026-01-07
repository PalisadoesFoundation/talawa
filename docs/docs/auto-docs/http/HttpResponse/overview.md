# Overview for `HttpResponse`

## Description

An HTTP response, which returns the headers and data
 from the server to the client in response to an HTTP request.

 Every HttpRequest object provides access to the associated [HttpResponse]
 object through the `response` property.
 The server sends its response to the client by writing to the
 HttpResponse object.

 ## Writing the response

 This class implements [IOSink].
 After the header has been set up, the methods
 from IOSink, such as ``, can be used to write
 the body of the HTTP response.
 Use the `` method to close the response and send it to the client.

     server.listen((HttpRequest request) );

 When one of the IOSink methods is used for the
 first time, the request header is sent. Calling any methods that
 change the header after it is sent throws an exception.

 If no "Content-Type" header is set then a default of
 "text/plain; charset=utf-8" is used and string data written to the IOSink
 will be encoded using UTF-8.

 ## Setting the headers

 The HttpResponse object has a number of properties for setting up
 the HTTP headers of the response.
 When writing string data through the IOSink, the encoding used
 is determined from the "charset" parameter of the
 "Content-Type" header.

     HttpResponse response = ...
     response.headers.contentType
         = ContentType("application", "json", charset: "utf-8");
     response.write(...);  // Strings written will be UTF-8 encoded.

 If no charset is provided the default of ISO-8859-1 (Latin 1) will
 be used.

     HttpResponse response = ...
     response.headers.add(HttpHeaders.contentTypeHeader, "text/plain");
     response.write(...);  // Strings written will be ISO-8859-1 encoded.

 If a charset is provided but it is not recognized, then the "Content-Type"
 header will include that charset but string data will be encoded using
 ISO-8859-1 (Latin 1).

## Dependencies

- IOSink

## Members

- **contentLength**: `int`
  Gets and sets the content length of the response. If the size of
 the response is not known in advance set the content length to
 -1, which is also the default if not set.

- **statusCode**: `int`
  The status code of the response.

 Any integer value is accepted. For
 the official HTTP status codes use the fields from
 [HttpStatus]. If no status code is explicitly set the default
 value [HttpStatus.ok] is used.

 The status code must be set before the body is written
 to. Setting the status code after writing to the response body or
 closing the response will throw a `StateError`.

- **reasonPhrase**: `String`
  The reason phrase for the response.

 If no reason phrase is explicitly set, a default reason phrase is provided.

 The reason phrase must be set before the body is written
 to. Setting the reason phrase after writing to the response body
 or closing the response will throw a [StateError].

- **persistentConnection**: `bool`
  Gets and sets the persistent connection state. The initial value
 of this property is the persistent connection state from the
 request.

- **deadline**: `Duration?`
  Set and get the [deadline] for the response. The deadline is timed from the
 time it's set. Setting a new deadline will override any previous deadline.
 When a deadline is exceeded, the response will be closed and any further
 data ignored.

 To disable a deadline, set the [deadline] to `null`.

 The [deadline] is `null` by default.

- **bufferOutput**: `bool`
  Gets or sets if the [HttpResponse] should buffer output.

 Default value is `true`.

 __Note__: Disabling buffering of the output can result in very poor
 performance, when writing many small chunks.

