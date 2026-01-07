# Method: `current`

## Description

An [Isolate] object representing the current isolate.

 The current isolate for code using [current]
 is the isolate running the code.

 The isolate object provides the capabilities required to inspect,
 pause or kill the isolate, and allows granting these capabilities
 to others.

 It is possible to pause the current isolate, but doing so *without*
 first passing the ability to resume it again to another isolate,
 is a sure way to hang your program.

## Return Type
`Isolate`

