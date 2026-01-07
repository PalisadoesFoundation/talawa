# Method: `foregroundPainter`

## Description

Set a new foreground custom paint delegate.

 If the new delegate is the same as the previous one, this does nothing.

 If the new delegate is the same class as the previous one, then the new
 delegate has its [CustomPainter.shouldRepaint] called; if the result is
 true, then the delegate will be called.

 If the new delegate is a different class than the previous one, then the
 delegate will be called.

 If the new value is null, then there is no foreground custom painter.

## Parameters

- `value`: `CustomPainter?`
