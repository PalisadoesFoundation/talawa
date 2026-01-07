# Method: `connectionFactory`

## Description

Sets the function used to create socket connections.

 The URL requested (e.g. through [getUrl]) and proxy configuration
 (`f.proxyHost` and `f.proxyPort`) are passed as arguments. `f.proxyHost`
 and `f.proxyPort` will be `null` if the connection is not made through
 a proxy.

 Since connections may be reused based on host and port, it is important
 that the function not ignore `f.proxyHost` and `f.proxyPort` if they are
 not `null`. If proxies are not meaningful for the returned [Socket], you
 can set [findProxy] to use a direct connection.

 For example:

 ```dart
 import "dart:io";

 void  async 
 ```

## Return Type
`void`

## Parameters

- `f`: `Future&lt;ConnectionTask&lt;Socket&gt;&gt; Function(Uri url, String? proxyHost, int? proxyPort)?`
