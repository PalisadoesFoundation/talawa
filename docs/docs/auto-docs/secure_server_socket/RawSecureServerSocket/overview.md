# Overview for `RawSecureServerSocket`

## Description

A server socket providing a stream of low-level [RawSecureSocket]s.

 See [RawSecureSocket] for more info.

## Dependencies

- Stream

## Members

- **_socket**: `RawServerSocket`
- **_controller**: `StreamController&lt;RawSecureSocket&gt;`
- **_subscription**: `StreamSubscription&lt;RawSocket&gt;?`
- **_context**: `SecurityContext?`
- **requestClientCertificate**: `bool`
- **requireClientCertificate**: `bool`
- **supportedProtocols**: `List&lt;String&gt;?`
- **_closed**: `bool`
## Constructors

### _


#### Parameters

- `_socket`: `dynamic`
- `_context`: `dynamic`
- `requestClientCertificate`: `dynamic`
- `requireClientCertificate`: `dynamic`
- `supportedProtocols`: `dynamic`
