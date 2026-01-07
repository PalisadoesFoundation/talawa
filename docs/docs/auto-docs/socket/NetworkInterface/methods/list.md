# Method: `list`

## Description

Query the system for [NetworkInterface]s.

 If [includeLoopback] is `true`, the returned list will include the
 loopback device. Default is `false`.

 If [includeLinkLocal] is `true`, the list of addresses of the returned
 [NetworkInterface]s, may include link local addresses. Default is `false`.

 If [type] is either [InternetAddressType.IPv4] or
 [InternetAddressType.IPv6] it will only lookup addresses of the
 specified type. Default is [InternetAddressType.any].

## Return Type
`Future&lt;List&lt;NetworkInterface&gt;&gt;`

## Parameters

- ``: `dynamic`
- ``: `dynamic`
- ``: `dynamic`
