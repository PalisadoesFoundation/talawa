# Overview for `BufferView`

## Description

A reference to a byte range within a GPU-resident [Buffer].

## Members

- **buffer**: `DeviceBuffer`
  The device buffer of this view.

- **offsetInBytes**: `int`
  The start of the view, in bytes starting from the beginning of the
 [buffer].

- **lengthInBytes**: `int`
  The length of the view.

## Constructors

### Unnamed Constructor
Create a new view into a buffer on the GPU.

