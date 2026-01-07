# Overview for `TearOffParametersPropertyNames`

## Description

Names of fields of collected tear-off parameters object.

 Tear-off getters are created before the Dart classes are initialized, so a
 plain JavaScript object is used to group the parameters. The object has a
 fixed shape, with the following properties. The names are short since there
 is no minifier for these property names.

## Members

- **container**: `String`
- **isStatic**: `String`
- **isIntercepted**: `String`
- **requiredParameterCount**: `String`
- **optionalParameterDefaultValues**: `String`
- **callNames**: `String`
- **funsOrNames**: `String`
- **funType**: `String`
- **applyIndex**: `String`
- **needsDirectAccess**: `String`
