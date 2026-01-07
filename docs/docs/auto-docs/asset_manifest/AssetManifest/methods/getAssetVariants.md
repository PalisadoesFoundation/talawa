# Method: `getAssetVariants`

## Description

Retrieves metadata about an asset and its variants. Returns null if the
 key was not found in the asset manifest.

 This method considers a main asset to be a variant of itself. The returned
 list will include it if it exists.

## Return Type
`List&lt;AssetMetadata&gt;?`

## Parameters

- `key`: `String`
