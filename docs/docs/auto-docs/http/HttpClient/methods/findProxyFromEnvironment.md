# Method: `findProxyFromEnvironment`

## Description

Function for resolving the proxy server to be used for an HTTP
 connection from the proxy configuration specified through
 environment variables.

 The following environment variables are taken into account:

     http_proxy
     https_proxy
     no_proxy
     HTTP_PROXY
     HTTPS_PROXY
     NO_PROXY

 [:http_proxy:] and [:HTTP_PROXY:] specify the proxy server to use for
 http:// urls. Use the format [:hostname:port:]. If no port is used a
 default of 1080 will be used. If both are set the lower case one takes
 precedence.

 [:https_proxy:] and [:HTTPS_PROXY:] specify the proxy server to use for
 https:// urls. Use the format [:hostname:port:]. If no port is used a
 default of 1080 will be used. If both are set the lower case one takes
 precedence.

 [:no_proxy:] and [:NO_PROXY:] specify a comma separated list of
 postfixes of hostnames for which not to use the proxy
 server. E.g. the value "localhost,127.0.0.1" will make requests
 to both "localhost" and "127.0.0.1" not use a proxy. If both are set
 the lower case one takes precedence.

 To activate this way of resolving proxies assign this function to
 the [findProxy] property on the [HttpClient].

     HttpClient client = ;
     client.findProxy = HttpClient.findProxyFromEnvironment;

 If you don't want to use the system environment you can use a
 different one by wrapping the function.

     HttpClient client = ;
     client.findProxy = (url) 

 If a proxy requires authentication it is possible to configure
 the username and password as well. Use the format
 [:username:password@hostname:port:] to include the username and
 password. Alternatively the API [addProxyCredentials] can be used
 to set credentials for proxies which require authentication.

## Return Type
`String`

## Parameters

- `url`: `Uri`
- ``: `dynamic`
