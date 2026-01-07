# Overview for `MessageGrouper`

## Description

Collects messages from an input stream of bytes.

 Each message should start with a 32 bit big endian uint indicating its size,
 followed by that many bytes.

## Members

- **_inputStreamSubscription**: `StreamSubscription`
  The input bytes stream subscription.

- **_lengthBuffer**: `_FixedBuffer`
  The buffer to store the length bytes in.

- **_messageBuffer**: `_FixedBuffer?`
  If reading raw data, buffer for the data.

- **_messageStreamController**: `StreamController&lt;Uint8List&gt;`
## Constructors

### Unnamed Constructor


