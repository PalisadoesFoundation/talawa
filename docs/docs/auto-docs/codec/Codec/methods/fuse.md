# Method: `fuse`

## Description

Fuses `this` with `other`.

 When encoding, the resulting codec encodes with `this` before
 encoding with [other].

 When decoding, the resulting codec decodes with [other] before decoding
 with `this`.

 In some cases one needs to use the [inverted] codecs to be able to fuse
 them correctly. That is, the output type of `this` ([T]) must match the
 input type of the second codec [other].

 Examples:
 ```dart
 final jsonToBytes = json.fuse(utf8);
 List&lt;int&gt; bytes = jsonToBytes.encode(["json-object"]);
 var decoded = jsonToBytes.decode(bytes);
 assert(decoded is List && decoded[0] == "json-object");

 var inverted = json.inverted;
 var jsonIdentity = json.fuse(inverted);
 var jsonObject = jsonIdentity.encode(["1", 2]);
 assert(jsonObject is List && jsonObject[0] == "1" && jsonObject[1] == 2);
 ```

## Return Type
`Codec&lt;S, R&gt;`

## Parameters

- `other`: `Codec&lt;T, R&gt;`
