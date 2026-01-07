# Method: `addLicense`

## Description

Adds licenses to the registry.

 To avoid actually manipulating the licenses unless strictly necessary,
 licenses are added by adding a closure that returns a list of
 [LicenseEntry] objects. The closure is only called if [licenses] is itself
 called; in normal operation, if the user does not request to see the
 licenses, the closure will not be called.

## Return Type
`void`

## Parameters

- `collector`: `LicenseEntryCollector`
