# Method: `routeInformationUpdated`

## Description

Notifies the platform for a route information change.

 On web, this method behaves differently based on the single-entry or
 multiple-entries history mode. Use the [selectSingleEntryHistory] and
 [selectMultiEntryHistory] to toggle between modes.

 For single-entry mode, this method replaces the current URL and state in
 the current history entry. The flag `replace` is ignored.

 For multiple-entries mode, this method creates a new history entry on top
 of the current entry if the `replace` is false, thus the user will
 be on a new history entry as if the user has visited a new page, and the
 browser back button brings the user back to the previous entry. If
 `replace` is true, this method only updates the URL and the state in the
 current history entry without pushing a new one.

 This method is ignored on other platforms.

 The `replace` flag defaults to false.

## Return Type
`Future&lt;void&gt;`

## Parameters

- ``: `dynamic`
- ``: `dynamic`
- ``: `dynamic`
- ``: `dynamic`
