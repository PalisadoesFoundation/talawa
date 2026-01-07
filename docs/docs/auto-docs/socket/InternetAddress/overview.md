# Overview for `InternetAddress`

## Description

An internet address or a Unix domain address.

 This object holds an internet address. If this internet address
 is the result of a DNS lookup, the address also holds the hostname
 used to make the lookup.
 An Internet address combined with a port number represents an
 endpoint to which a socket can connect or a listening socket can
 bind.

## Constructors

### Unnamed Constructor
Creates a new [InternetAddress] from a numeric address or a file path.

 If [type] is [InternetAddressType.IPv4], [address] must be a numeric IPv4
 address (dotted-decimal notation).
 If [type] is [InternetAddressType.IPv6], [address] must be a numeric IPv6
 address (hexadecimal notation).
 If [type] is [InternetAddressType.unix], [address] must be a valid file
 path.
 If [type] is omitted, [address] must be either a numeric IPv4 or IPv6
 address and the type is inferred from the format.

### fromRawAddress
Creates a new [InternetAddress] from the provided raw address bytes.

 If the [type] is [InternetAddressType.IPv4], the [rawAddress] must have
 length 4.
 If the [type] is [InternetAddressType.IPv6], the [rawAddress] must have
 length 16.
 If the [type] is [InternetAddressType.unix], the [rawAddress] must be a
 valid UTF-8 encoded file path.

 If [type] is omitted, the [rawAddress] must have a length of either 4 or
 16, in which case the type defaults to [InternetAddressType.IPv4] or
 [InternetAddressType.IPv6] respectively.

#### Parameters

- `rawAddress`: `Uint8List`
- ``: `dynamic`
