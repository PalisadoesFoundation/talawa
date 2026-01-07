# Method: `getVmFlags`

## Description

Returns the Flags set in the Dart VM as JSON.

 See the complete documentation for [the `getFlagList` Dart VM service
 method][getFlagList].

 Example return value:

     [
       ,
       ...
     ]

 [getFlagList]: https://github.com/dart-lang/sdk/blob/main/runtime/vm/service/service.md#getflaglist

 Throws [UnimplementedError] on [WebFlutterDriver] instances.

## Return Type
`Future&lt;List&lt;Map&lt;String, dynamic&gt;&gt;&gt;`

