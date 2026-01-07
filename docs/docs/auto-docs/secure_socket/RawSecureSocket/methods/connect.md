# Method: `connect`

## Description

Constructs a new secure client socket and connect it to the given
 host on the given port.

 The returned [Future] is completed with the
 [RawSecureSocket] when it is connected and ready for subscription.

 The certificate provided by the server is checked using the trusted
 certificates set in the SecurityContext object If a certificate and key are
 set on the client, using [SecurityContext.useCertificateChain] and
 [SecurityContext.usePrivateKey], and the server asks for a client
 certificate, then that client certificate is sent to the server.

 [onBadCertificate] is an optional handler for unverifiable certificates.
 The handler receives the [X509Certificate], and can inspect it and
 decide (or let the user decide) whether to accept
 the connection or not.  The handler should return true
 to continue the [RawSecureSocket] connection.

 [onBadCertificate] is an optional handler for unverifiable certificates.
 The handler receives the [X509Certificate], and can inspect it and
 decide (or let the user decide) whether to accept
 the connection or not.  The handler should return true
 to continue the [SecureSocket] connection.

 [keyLog] is an optional callback that will be called when new TLS keys
 are exchanged with the server. [keyLog] will receive one line of text in
 [NSS Key Log Format](https://developer.mozilla.org/en-US/docs/Mozilla/Projects/NSS/Key_Log_Format)
 for each call. Writing these lines to a file will allow tools (such as
 [Wireshark](https://gitlab.com/wireshark/wireshark/-/wikis/TLS#tls-decryption))
 to decrypt content sent through this socket. This is meant to allow
 network-level debugging of secure sockets and should not be used in
 production code. For example:
 ```dart
 final log = File('keylog.txt');
 final socket = await SecureSocket.connect('www.example.com', 443,
     keyLog: (line) => log.writeAsStringSync(line, mode: FileMode.append));
 ```

 [supportedProtocols] is an optional list of protocols (in decreasing
 order of preference) to use during the ALPN protocol negotiation with the
 server.  Example values are "http/1.1" or "h2".  The selected protocol
 can be obtained via [RawSecureSocket.selectedProtocol].

## Return Type
`Future&lt;RawSecureSocket&gt;`

## Parameters

- `host`: `dynamic`
- `port`: `int`
- ``: `dynamic`
- ``: `dynamic`
- ``: `dynamic`
- ``: `dynamic`
- ``: `dynamic`
