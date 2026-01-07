# Method: `selectedProtocol`

## Description

The protocol which was selected during protocol negotiation.

 Returns null if one of the peers does not have support for ALPN, did not
 specify a list of supported ALPN protocols or there was no common
 protocol between client and server.

## Return Type
`String?`

