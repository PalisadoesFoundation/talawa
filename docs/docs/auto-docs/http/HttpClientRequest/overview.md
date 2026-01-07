# Overview for `HttpClientRequest`

## Description

HTTP request for a client connection.

 To set up a request, set the headers using the headers property
 provided in this class and write the data to the body of the request.
 `HttpClientRequest` is an [IOSink]. Use the methods from IOSink,
 such as ``, to write the body of the HTTP
 request. When one of the IOSink methods is used for the first
 time, the request header is sent. Calling any methods that
 change the header after it is sent throws an exception.

 When writing string data through the [IOSink] the
 encoding used is determined from the "charset" parameter of
 the "Content-Type" header.

 ```dart import:convert
 var client = ;
 HttpClientRequest request = await client.get('localhost', 80, '/file.txt');
 request.headers.contentType =
     ContentType('application', 'json', charset: 'utf-8');
 request.write('text content👍🎯'); // Strings written will be UTF-8 encoded.
 ```

 If no charset is provided the default of ISO-8859-1 (Latin 1) is used.

 ```dart
 var client = ;
 HttpClientRequest request = await client.get('localhost', 80, '/file.txt');
 request.headers.add(HttpHeaders.contentTypeHeader, "text/plain");
 request.write('blåbærgrød'); // Strings written will be ISO-8859-1 encoded
 ```

 An exception is thrown if you use an unsupported encoding and the
 `` method being used takes a string parameter.

## Dependencies

- IOSink

## Members

- **persistentConnection**: `bool`
  The requested persistent connection state.

 The default value is `true`.

- **followRedirects**: `bool`
  Whether to follow redirects automatically.

 Set this property to `false` if this request should not
 automatically follow redirects. The default is `true`.

 Automatic redirect will only happen for "GET" and "HEAD" requests
 and only for the status codes [HttpStatus.movedPermanently]
 (301), [HttpStatus.found] (302),
 [HttpStatus.movedTemporarily] (302, alias for
 [HttpStatus.found]), [HttpStatus.seeOther] (303),
 [HttpStatus.temporaryRedirect] (307) and
 [HttpStatus.permanentRedirect] (308). For
 [HttpStatus.seeOther] (303) automatic redirect will also happen
 for "POST" requests with the method changed to "GET" when
 following the redirect.

 All headers added to the request will be added to the redirection
 request(s) except when forwarding sensitive headers like
 "Authorization", "WWW-Authenticate", and "Cookie". Those headers
 will be skipped if following a redirect to a domain that is not a
 subdomain match or exact match of the initial domain.
 For example, a redirect from "foo.com" to either "foo.com" or
 "sub.foo.com" will forward the sensitive headers, but a redirect to
 "bar.com" will not.

 Any body send with the request will not be part of the redirection
 request(s).

 For precise control of redirect handling, set this property to `false`
 and make a separate HTTP request to process the redirect. For example:

 ```dart
 final client = ;
 var uri = Uri.parse("http://localhost/");
 var request = await client.getUrl(uri);
 request.followRedirects = false;
 var response = await request.;
 while (response.isRedirect) 
 // Do something with the final response.
 ```

- **maxRedirects**: `int`
  Set this property to the maximum number of redirects to follow
 when [followRedirects] is `true`. If this number is exceeded
 an error event will be added with a [RedirectException].

 The default value is 5.

- **contentLength**: `int`
  Gets and sets the content length of the request.

 If the size of the request is not known in advance set content length to
 -1, which is also the default.

- **bufferOutput**: `bool`
  Gets or sets if the [HttpClientRequest] should buffer output.

 Default value is `true`.

 __Note__: Disabling buffering of the output can result in very poor
 performance, when writing many small chunks.

