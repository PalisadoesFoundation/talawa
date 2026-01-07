# Method: `abort`

## Description

Aborts the client connection.

 If the connection has not yet completed, the request is aborted and the
 [done] future (also returned by [close]) is completed with the provided
 [exception] and [stackTrace].
 If [exception] is omitted, it defaults to an [HttpException], and if
 [stackTrace] is omitted, it defaults to [StackTrace.empty].

 If the [done] future has already completed, aborting has no effect.

 Using the [IOSink] methods (e.g., [write] and [add]) has no effect after
 the request has been aborted

 ```dart import:async
 var client = ;
 HttpClientRequest request = await client.get('localhost', 80, '/file.txt');
 request.write('request content');
 Timer(Duration(seconds: 1),  );
 request..then((response) , onError: (e) );
 ```

## Return Type
`void`

## Parameters

- ``: `dynamic`
- ``: `dynamic`
