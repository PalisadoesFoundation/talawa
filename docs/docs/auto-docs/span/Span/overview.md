# Overview for `Span`

## Description

Meta information for a span of text in a generated augmentation library.

 These are collected during generation of augmentation libraries and are used
 to compute relation between offsets in the intermediate augmentation
 libraries and the merged augmented library.

## Members

- **key**: `Key`
  Key that defines the semantics of the content of this span.

 This must be unique within the spans generated from a single
 augmentation library.

- **offset**: `int`
  The offset in the generated augmentation library source code where this
 span occurs.

- **text**: `String`
  The source code of this span.

## Constructors

### Unnamed Constructor


