# Method: `reverse`

## Description

Performs a reverse DNS lookup on this [address]

 Returns a new [InternetAddress] with the same address, but where the [host]
 field set to the result of the lookup.

 If this address is Unix domain addresses, no lookup is performed and this
 address is returned directly.

## Return Type
`Future&lt;InternetAddress&gt;`

