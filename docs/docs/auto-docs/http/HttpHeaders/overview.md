# Overview for `HttpHeaders`

## Description

Headers for HTTP requests and responses.

 In some situations, headers are immutable:

 * [HttpRequest] and [HttpClientResponse] always have immutable headers.

 * [HttpResponse] and [HttpClientRequest] have immutable headers
   from the moment the body is written to.

 In these situations, the mutating methods throw exceptions.

 For all operations on HTTP headers the header name is
 case-insensitive.

 To set the value of a header use the `` method:

     request.headers.set(HttpHeaders.cacheControlHeader,
                         'max-age=3600, must-revalidate');

 To retrieve the value of a header use the `` method:

     print(request.headers.value(HttpHeaders.userAgentHeader));

 An `HttpHeaders` object holds a list of values for each name
 as the standard allows. In most cases a name holds only a single value,
 The most common mode of operation is to use `` for setting a value,
 and `` for retrieving a value.

## Members

- **acceptHeader**: `dynamic`
- **acceptCharsetHeader**: `dynamic`
- **acceptEncodingHeader**: `dynamic`
- **acceptLanguageHeader**: `dynamic`
- **acceptRangesHeader**: `dynamic`
- **accessControlAllowCredentialsHeader**: `dynamic`
- **accessControlAllowHeadersHeader**: `dynamic`
- **accessControlAllowMethodsHeader**: `dynamic`
- **accessControlAllowOriginHeader**: `dynamic`
- **accessControlExposeHeadersHeader**: `dynamic`
- **accessControlMaxAgeHeader**: `dynamic`
- **accessControlRequestHeadersHeader**: `dynamic`
- **accessControlRequestMethodHeader**: `dynamic`
- **ageHeader**: `dynamic`
- **allowHeader**: `dynamic`
- **authorizationHeader**: `dynamic`
- **cacheControlHeader**: `dynamic`
- **connectionHeader**: `dynamic`
- **contentEncodingHeader**: `dynamic`
- **contentLanguageHeader**: `dynamic`
- **contentLengthHeader**: `dynamic`
- **contentLocationHeader**: `dynamic`
- **contentMD5Header**: `dynamic`
- **contentRangeHeader**: `dynamic`
- **contentTypeHeader**: `dynamic`
- **dateHeader**: `dynamic`
- **etagHeader**: `dynamic`
- **expectHeader**: `dynamic`
- **expiresHeader**: `dynamic`
- **fromHeader**: `dynamic`
- **hostHeader**: `dynamic`
- **ifMatchHeader**: `dynamic`
- **ifModifiedSinceHeader**: `dynamic`
- **ifNoneMatchHeader**: `dynamic`
- **ifRangeHeader**: `dynamic`
- **ifUnmodifiedSinceHeader**: `dynamic`
- **lastModifiedHeader**: `dynamic`
- **locationHeader**: `dynamic`
- **maxForwardsHeader**: `dynamic`
- **pragmaHeader**: `dynamic`
- **proxyAuthenticateHeader**: `dynamic`
- **proxyAuthorizationHeader**: `dynamic`
- **rangeHeader**: `dynamic`
- **refererHeader**: `dynamic`
- **retryAfterHeader**: `dynamic`
- **serverHeader**: `dynamic`
- **teHeader**: `dynamic`
- **trailerHeader**: `dynamic`
- **transferEncodingHeader**: `dynamic`
- **upgradeHeader**: `dynamic`
- **userAgentHeader**: `dynamic`
- **varyHeader**: `dynamic`
- **viaHeader**: `dynamic`
- **warningHeader**: `dynamic`
- **wwwAuthenticateHeader**: `dynamic`
- **contentDisposition**: `dynamic`
- **cookieHeader**: `dynamic`
- **setCookieHeader**: `dynamic`
- **generalHeaders**: `dynamic`
- **entityHeaders**: `dynamic`
- **responseHeaders**: `dynamic`
- **requestHeaders**: `dynamic`
- **date**: `DateTime?`
  The date specified by the [dateHeader] header, if any.

- **expires**: `DateTime?`
  The date and time specified by the [expiresHeader] header, if any.

- **ifModifiedSince**: `DateTime?`
  The date and time specified by the [ifModifiedSinceHeader] header, if any.

- **host**: `String?`
  The value of the [hostHeader] header, if any.

- **port**: `int?`
  The value of the port part of the [hostHeader] header, if any.

- **contentType**: `ContentType?`
  The [ContentType] of the [contentTypeHeader] header, if any.

- **contentLength**: `int`
  The value of the [contentLengthHeader] header, if any.

 The value is negative if there is no content length set.

- **persistentConnection**: `bool`
  Whether the connection is persistent (keep-alive).

- **chunkedTransferEncoding**: `bool`
  Whether the connection uses chunked transfer encoding.

 Reflects and modifies the value of the [transferEncodingHeader] header.

