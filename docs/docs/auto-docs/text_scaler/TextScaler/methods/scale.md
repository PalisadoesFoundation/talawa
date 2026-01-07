# Method: `scale`

## Description

Computes the scaled font size (in logical pixels) with the given unscaled
 `fontSize` (in logical pixels).

 The input `fontSize` must be finite and non-negative.

 When given the same `fontSize` input, this method returns the same value.
 The output of a larger input `fontSize` is typically larger than that of a
 smaller input, but on unusual occasions they may produce the same output.
 For example, some platforms use single-precision floats to represent font
 sizes, as a result of truncation two different unscaled font sizes can be
 scaled to the same value.

## Return Type
`double`

## Parameters

- `fontSize`: `double`
