# Overview for `PlaceholderSpanIndexSemanticsTag`

## Description

Used by the [RenderParagraph] to map its rendering children to their
 corresponding semantics nodes.

 The [RichText] uses this to tag the relation between its placeholder spans
 and their semantics nodes.

## Dependencies

- SemanticsTag

## Members

- **index**: `int`
  The index of this tag.

## Constructors

### Unnamed Constructor
Creates a semantics tag with the input `index`.

 Different [PlaceholderSpanIndexSemanticsTag]s with the same `index` are
 consider the same.

