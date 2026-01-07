# Overview for `ButtonSegment`

## Description

Data describing a segment of a [SegmentedButton].

## Members

- **value**: `T`
  Value used to identify the segment.

 This value must be unique across all segments in a [SegmentedButton].

- **icon**: `Widget?`
  Optional icon displayed in the segment.

- **label**: `Widget?`
  Optional label displayed in the segment.

- **tooltip**: `String?`
  Optional tooltip for the segment

- **enabled**: `bool`
  Determines if the segment is available for selection.

## Constructors

### Unnamed Constructor
Construct a [ButtonSegment].

 One of [icon] or [label] must be non-null.

