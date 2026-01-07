# Overview for `FileMode`

## Description

The modes in which a [File] can be opened.

## Members

- **read**: `dynamic`
  The mode for opening a file only for reading.

- **write**: `dynamic`
  Mode for opening a file for reading and writing. The file is
 overwritten if it already exists. The file is created if it does not
 already exist.

- **append**: `dynamic`
  Mode for opening a file for reading and writing to the
 end of it. The file is created if it does not already exist.

- **writeOnly**: `dynamic`
  Mode for opening a file for writing *only*. The file is
 overwritten if it already exists. The file is created if it does not
 already exist.

- **writeOnlyAppend**: `dynamic`
  Mode for opening a file for writing *only* to the
 end of it. The file is created if it does not already exist.

- **_mode**: `int`
## Constructors

### _internal


#### Parameters

- `_mode`: `dynamic`
