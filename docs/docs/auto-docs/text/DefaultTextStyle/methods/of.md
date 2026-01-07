# Method: `of`

## Description

The closest instance of this class that encloses the given context.

 If no such instance exists, returns an instance created by
 [DefaultTextStyle.fallback], which contains fallback values.

 Typical usage is as follows:

 ```dart
 DefaultTextStyle style = DefaultTextStyle.of(context);
 ```

## Return Type
`DefaultTextStyle`

## Parameters

- `context`: `BuildContext`
