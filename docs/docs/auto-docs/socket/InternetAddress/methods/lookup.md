# Method: `lookup`

## Description

Looks up the addresses of a host.

 If [type] is [InternetAddressType.any], it will lookup both
 IP version 4 (IPv4) and IP version 6 (IPv6) addresses.
 If [type] is either [InternetAddressType.IPv4] or
 [InternetAddressType.IPv6] it will only lookup addresses of the
 specified type. The order of the list can, and most likely will,
 change over time.

## Return Type
`Future&lt;List&lt;InternetAddress&gt;&gt;`

## Parameters

- `host`: `String`
- ``: `dynamic`
