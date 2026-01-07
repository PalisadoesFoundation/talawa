# Method: `fromSocket`

## Description

Create a `ConnectionTask` from an existing `Future&lt;Socket&gt;`.

 You can use this method to return existing socket connections in
 [HttpClient.connectionFactory].

 For example:

 ```dart
 final clientSocketFuture = Socket.connect(
     serverUri.host, serverUri.port);
 final client = 
  ..connectionFactory = (uri, proxyHost, proxyPort) {
    return Future.value(
        ConnectionTask.fromSocket(clientSocketFuture,  ));
 final response = await client.getUrl(serverUri);
 ```

## Return Type
`ConnectionTask&lt;T&gt;`

## Parameters

- `socket`: `Future&lt;T&gt;`
- `onCancel`: `void `
