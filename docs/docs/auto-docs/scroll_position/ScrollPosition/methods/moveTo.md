# Method: `moveTo`

## Description

Calls [jumpTo] if duration is null or [Duration.zero], otherwise
 [animateTo] is called.

 If [clamp] is true (the default) then [to] is adjusted to prevent over or
 underscroll.

 If [animateTo] is called then [curve] defaults to [Curves.ease].

## Return Type
`Future&lt;void&gt;`

## Parameters

- `to`: `double`
- ``: `dynamic`
- ``: `dynamic`
- ``: `dynamic`
