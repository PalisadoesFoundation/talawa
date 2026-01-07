# Overview for `Encoding`

## Description

Open-ended set of encodings.

 An encoding is a [Codec] encoding strings to lists of byte.

 This class provides a default implementation of [decodeStream],
 which is not incremental. It collects the entire input before
 decoding. Subclasses can choose to use that implementation,
 or implement a more efficient stream decoding.

## Dependencies

- Codec

## Members

- **_nameToEncoding**: `Map&lt;String, Encoding&gt;`
## Constructors

### Unnamed Constructor


