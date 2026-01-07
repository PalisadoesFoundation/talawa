# Method: `of`

## Description

The closest instance of this class that encloses the given context.

 If no such instance exists, returns an instance created by
 [DefaultSelectionStyle.fallback], which contains fallback values.

 Typical usage is as follows:

 ```dart
 DefaultSelectionStyle style = DefaultSelectionStyle.of(context);
 ```

## Return Type
`DefaultSelectionStyle`

## Parameters

- `context`: `BuildContext`
