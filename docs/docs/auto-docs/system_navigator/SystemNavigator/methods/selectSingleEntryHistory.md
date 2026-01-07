# Method: `selectSingleEntryHistory`

## Description

Selects the single-entry history mode.

 On web, this switches the browser history model to one that only tracks a
 single entry, so that calling [routeInformationUpdated] replaces the
 current entry.

 Currently, this is ignored on other platforms.

 See also:

  * [selectMultiEntryHistory], which enables the browser history to have
    multiple entries.

## Return Type
`Future&lt;void&gt;`

