


# exitButton method








void exitButton
()





<p>Button to exit the organization.</p>
<p><strong>params</strong>:
  None</p>
<p><strong>returns</strong>:
  None</p>



## Implementation

```dart
void exitButton() {
  return navigationService.pushDialog(
    CustomAlertDialog(
      key: const Key("Exit?"),
      reverse: true,
      dialogSubTitle: 'Are you sure you want to exit this organization?',
      successText: 'Exit',
      success: () {
        //Exit org
      },
    ),
  );
}
```







