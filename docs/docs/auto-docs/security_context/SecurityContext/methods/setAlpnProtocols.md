# Method: `setAlpnProtocols`

## Description

Sets the list of application-level protocols supported by a client
 connection or server connection. The ALPN (application level protocol
 negotiation) extension to TLS allows a client to send a list of
 protocols in the TLS client hello message, and the server to pick
 one and send the selected one back in its server hello message.

 Separate lists of protocols can be sent for client connections and
 for server connections, using the same SecurityContext.  The [isServer]
 boolean argument specifies whether to set the list for server connections
 or client connections.

## Return Type
`void`

## Parameters

- `protocols`: `List&lt;String&gt;`
- `isServer`: `bool`
