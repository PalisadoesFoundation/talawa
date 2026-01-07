# Method: `selectMultiEntryHistory`

## Description

Selects the multiple-entry history mode.

 On web, this switches the browser history model to one that tracks all
 updates to [routeInformationUpdated] to form a history stack. This is the
 default.

 Currently, this is ignored on other platforms.

 See also:

  * [selectSingleEntryHistory], which forces the history to only have one
    entry.

## Return Type
`Future&lt;void&gt;`

