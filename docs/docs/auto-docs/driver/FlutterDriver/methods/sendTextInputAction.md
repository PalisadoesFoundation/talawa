# Method: `sendTextInputAction`

## Description

Simulate the user posting a text input action.

 The available action types can be found in [TextInputAction]. The [sendTextInputAction]
 does not check whether the [TextInputAction] performed is acceptable
 based on the client arguments of the text input.

 This can be called even if the [TestTextInput] has not been [TestTextInput.register]ed.

 Example:
 

 ```dart
 test('submit text in a text field',  async );
 ```
 

## Return Type
`Future&lt;void&gt;`

## Parameters

- `action`: `TextInputAction`
- ``: `dynamic`
