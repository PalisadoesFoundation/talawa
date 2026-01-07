# Overview for `Codec`

## Description

A [Codec] encodes and (if supported) decodes data.

 Codecs can be fused. For example fusing [json] and [utf8] produces
 an encoder that can convert Json objects directly to bytes, or can decode
 bytes directly to json objects.

 Fused codecs generally attempt to optimize the operations and can be faster
 than executing each step of an encoding separately.

 The [Codec] class provides a default implementation of
 [encode], [decode], [fuse] and [inverted].
 Subclasses can choose to provide more efficient implementations of these.

## Constructors

### Unnamed Constructor


