# Method: `extractHandles`

## Description

Extracts the list of handles embedded in this message.

 This method must only be used to extract handles from messages
 received on a socket. It must not be used on a socket control
 message that is created locally, and has not been sent using
 [RawSocket.sendMessage].

 This method must only be called once.
 Calling it multiple times may cause duplicated handles with unspecified
 behavior.

## Return Type
`List&lt;ResourceHandle&gt;`

