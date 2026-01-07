# Method: `keyLog`

## Description

Sets a callback that will be called when new TLS keys are exchanged with
 the server. It will receive one line of text in
 [NSS Key Log Format](https://developer.mozilla.org/en-US/docs/Mozilla/Projects/NSS/Key_Log_Format)
 for each call. Writing these lines to a file will allow tools (such as
 [Wireshark](https://gitlab.com/wireshark/wireshark/-/wikis/TLS#tls-decryption))
 to decrypt communication between the this client and the server. This is
 meant to allow network-level debugging of secure sockets and should not
 be used in production code. For example:

     final log = File('keylog.txt');
     final client = ;
     client.keyLog = (line) => log.writeAsStringSync(line,
         mode: FileMode.append);

## Return Type
`void`

## Parameters

- `callback`: ` Function(String line)?`
