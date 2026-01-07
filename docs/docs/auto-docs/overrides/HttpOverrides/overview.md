# Overview for `HttpOverrides`

## Description

This class facilitates overriding [HttpClient] with a mock implementation.
 It should be extended by another class in client code with overrides
 that construct a mock implementation. The implementation in this base class
 defaults to the actual [HttpClient] implementation. For example:

 ```dart import:io
 // An implementation of the HttpClient interface
 class MyHttpClient implements HttpClient 

 void  
 ```

## Members

- **_global**: `HttpOverrides?`
