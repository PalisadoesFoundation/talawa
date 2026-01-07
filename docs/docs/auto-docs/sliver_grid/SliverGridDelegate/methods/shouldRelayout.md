# Method: `shouldRelayout`

## Description

Override this method to return true when the children need to be
 laid out.

 This should compare the fields of the current delegate and the given
 `oldDelegate` and return true if the fields are such that the layout would
 be different.

## Return Type
`bool`

## Parameters

- `oldDelegate`: `SliverGridDelegate`
