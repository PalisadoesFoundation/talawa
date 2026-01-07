# Method: `enabled`

## Description

Whether the object currently returned by [toPrimitives] should be included
 in the restoration state.

 When this returns false, no information is included in the restoration
 data for this property and the property will be initialized to its default
 value (obtained from [createDefaultValue]) the next time that restoration
 data is used for state restoration.

 Whenever the value returned by this getter changes, [notifyListeners] must
 be called. When the value changes from true to false, the information last
 retrieved from [toPrimitives] is removed from the restoration data. When
 it changes from false to true, [toPrimitives] is invoked to add the latest
 restoration information provided by this property to the restoration data.

## Return Type
`bool`

