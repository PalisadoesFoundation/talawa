# Method: `send`

## Description

Asynchronously sends a datagram.

 Returns the number of bytes written. This will always be either
 the size of [buffer] or `0`.

 A return value of `0` indicates that sending the datagram would block and
 that the [send] call can be tried again.

 A return value of the size of [buffer] indicates that a request to
 transmit the datagram was made to the operating system. It does not
 indicate that the operating system successfully sent the datagram. If a
 local failure to send the datagram occurs then an error event will be
 added to the [Stream]. If a networking or remote failure occurs then it
 will not be reported.

 The maximum size of a IPv4 UDP datagram is 65535 bytes (including both
 data and headers) but the practical maximum size is likely to be much
 lower due to operating system limits and the network's maximum
 transmission unit (MTU).

 Some IPv6 implementations may support payloads up to 4GB (see RFC-2675)
 but that support is limited (see RFC-6434) and has been removed in later
 standards (see RFC-8504).

 [Emperical testing by the Chromium team](https://groups.google.com/a/chromium.org/g/proto-quic/c/uKWLRh9JPCo)
 suggests that payloads later than 1350 cannot be reliably received.

## Return Type
`int`

## Parameters

- `buffer`: `List&lt;int&gt;`
- `address`: `InternetAddress`
- `port`: `int`
