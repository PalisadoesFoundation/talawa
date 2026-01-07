# Overview for `HttpClient`

## Description

An HTTP client for communicating with an HTTP server.

 > **Note:** You should avoid directly using `HttpClient` to make HTTP
 > requests. You can use `HttpClient` indirectly through the
 > [`IOClient`](https://pub.dev/documentation/http/latest/io_client/IOClient-class.html)
 > adapter in [`package:http`](https://pub.dev/packages/http).
 >
 > Using a higher-level library,
 > like [`package:http`](https://pub.dev/packages/http), allows you to
 > switch implementations with minimal changes to your code. For example,
 > `package:http`
 > [`Client`](https://pub.dev/documentation/http/latest/http/Client-class.html)
 > has implementations for the browser and implementations that use
 > platform native HTTP clients on Android and iOS. Unlike `HttpClient`,
 > these native implementations work with the proxies, VPNs, etc.

 Sends HTTP requests to an HTTP server and receives responses.
 Maintains state, including session cookies and other cookies,
 between multiple requests to the same server.

 HttpClient contains a number of methods to send an [HttpClientRequest]
 to an Http server and receive an [HttpClientResponse] back.
 For example, you can use the [get], [getUrl], [post], and [postUrl] methods
 for GET and POST requests, respectively.

 ## Making a simple GET request: an example

 A `getUrl` request is a two-step process, triggered by two [Future]s.
 When the first future completes with an [HttpClientRequest], the underlying
 network connection has been established, but no data has been sent.
 In the callback function for the first future, the HTTP headers and body
 can be set on the request. Either the first write to the request object
 or a call to [close] sends the request to the server.

 When the HTTP response is received from the server,
 the second future, which is returned by close,
 completes with an [HttpClientResponse] object.
 This object provides access to the headers and body of the response.
 The body is available as a stream implemented by `HttpClientResponse`.
 If a body is present, it must be read. Otherwise, it leads to resource
 leaks. Consider using [HttpClientResponse.drain] if the body is unused.

 ```dart import:convert
 var client = ;
 try  finally 
 ```

 The future for [HttpClientRequest] is created by methods such as
 [getUrl] and [open].

 ## HTTPS connections

 An `HttpClient` can make HTTPS requests, connecting to a server using
 the TLS (SSL) secure networking protocol. Calling [getUrl] with an
 https: scheme will work automatically, if the server's certificate is
 signed by a root CA (certificate authority) on the default list of
 well-known trusted CAs, compiled by Mozilla.

 To add a custom trusted certificate authority, or to send a client
 certificate to servers that request one, pass a [SecurityContext] object
 as the optional `context` argument to the `HttpClient` constructor.
 The desired security options can be set on the [SecurityContext] object.

 ## Headers

 All `HttpClient` requests set the following header by default:

     Accept-Encoding: gzip

 This allows the HTTP server to use gzip compression for the body if
 possible. If this behavior is not desired set the
 `Accept-Encoding` header to something else.
 To turn off gzip compression of the response, clear this header:

      request.headers.removeAll(HttpHeaders.acceptEncodingHeader)

 ## Closing the `HttpClient`

 `HttpClient` supports persistent connections and caches network
 connections to reuse them for multiple requests whenever
 possible. This means that network connections can be kept open for
 some time after a request has completed. Use [HttpClient.close]
 to force the `HttpClient` object to shut down and to close the idle
 network connections.

 ## Turning proxies on and off

 By default the `HttpClient` uses the proxy configuration available
 from the environment, see [findProxyFromEnvironment]. To turn off
 the use of proxies set the [findProxy] property to `null`.

     HttpClient client = ;
     client.findProxy = null;

## Members

- **defaultHttpPort**: `int`
- **defaultHttpsPort**: `int`
- **_enableTimelineLogging**: `bool`
- **idleTimeout**: `Duration`
  Gets and sets the idle timeout of non-active persistent (keep-alive)
 connections.

 The default value is 15 seconds.

- **connectionTimeout**: `Duration?`
  Gets and sets the connection timeout.

 When connecting to a new host exceeds this timeout, a [SocketException]
 is thrown. The timeout applies only to connections initiated after the
 timeout is set.

 When this is `null`, the OS default timeout is used. The default is
 `null`.

- **maxConnectionsPerHost**: `int?`
  Gets and sets the maximum number of live connections, to a single host.

 Increasing this number may lower performance and take up unwanted
 system resources.

 To disable, set to `null`.

 Default is `null`.

- **autoUncompress**: `bool`
  Gets and sets whether the body of a response will be automatically
 uncompressed.

 The body of an HTTP response can be compressed. In most
 situations providing the un-compressed body is most
 convenient. Therefore the default behavior is to un-compress the
 body. However in some situations (e.g. implementing a transparent
 proxy) keeping the uncompressed stream is required.

 NOTE: Headers in the response are never modified. This means
 that when automatic un-compression is turned on the value of the
 header `Content-Length` will reflect the length of the original
 compressed body. Likewise the header `Content-Encoding` will also
 have the original value indicating compression.

 NOTE: Automatic un-compression is only performed if the
 `Content-Encoding` header value is `gzip`.

 This value affects all responses produced by this client after the
 value is changed.

 To disable, set to `false`.

 Default is `true`.

- **userAgent**: `String?`
  Gets and sets the default value of the `User-Agent` header for all requests
 generated by this [HttpClient].

 The default value is `Dart/<version> (dart:io)`.

 If the userAgent is set to `null`, no default `User-Agent` header will be
 added to each request.

## Constructors

### Unnamed Constructor


