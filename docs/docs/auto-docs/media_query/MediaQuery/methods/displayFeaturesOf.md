# Method: `displayFeaturesOf`

## Description

Returns [MediaQueryData.displayFeatures] for the nearest [MediaQuery]
 ancestor or throws an exception, if no such ancestor exists.

 Use of this method will cause the given [context] to rebuild any time that
 the [MediaQueryData.displayFeatures] property of the ancestor [MediaQuery]
 changes.

 

## Return Type
`List<ui.DisplayFeature>`

## Parameters

- `context`: `BuildContext`
