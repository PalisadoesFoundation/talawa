# Method: `secure`

## Description

Initiates TLS on an existing connection.

 Takes an already connected [socket] and starts client side TLS
 handshake to make the communication secure. When the returned
 future completes the [RawSecureSocket] has completed the TLS
 handshake. Using this function requires that the other end of the
 connection is prepared for TLS handshake.

 If the [socket] already has a subscription, pass the existing
 subscription in the [subscription] parameter. The [secure]
 operation will take over the subscription by replacing the
 handlers with it own secure processing. The caller must not touch
 this subscription anymore. Passing a paused subscription is an
 error.

 If the [host] argument is passed it will be used as the host name
 for the TLS handshake. If [host] is not passed the host name from
 the [socket] will be used. The [host] can be either a [String] or
 an [InternetAddress].

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
 can be obtained via [SecureSocket.selectedProtocol].

 Calling this function will _not_ cause a DNS host lookup. If the
 [host] passed is a [String] the [InternetAddress] for the
 resulting [SecureSocket] will have this passed in [host] as its
 host value and the internet address of the already connected
 socket as its address value.

 See [connect] for more information on the arguments.

## Return Type
`Future&lt;RawSecureSocket&gt;`

## Parameters

- `socket`: `RawSocket`
- ``: `dynamic`
- ``: `dynamic`
- ``: `dynamic`
- ``: `dynamic`
- ``: `dynamic`
- ``: `dynamic`
