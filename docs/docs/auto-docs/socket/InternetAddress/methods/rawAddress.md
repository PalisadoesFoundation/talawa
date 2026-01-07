# Method: `rawAddress`

## Description

The raw address of this [InternetAddress].

 For an IP address, the result is either a 4 or 16 byte long list.
 For a Unix domain address, UTF-8 encoded byte sequences that represents
 [address] is returned.

 The returned list is a fresh copy, making it possible to change the list without
 modifying the [InternetAddress].

## Return Type
`Uint8List`

