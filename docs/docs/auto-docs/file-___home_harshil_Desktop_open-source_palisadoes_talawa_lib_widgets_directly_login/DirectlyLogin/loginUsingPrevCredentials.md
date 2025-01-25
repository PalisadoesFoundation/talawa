




loginUsingPrevCredentials method - DirectlyLogin class - directly\_login library - Dart API







menu

1. [talawa](../../index.html)
2. [widgets/directly\_login.dart](../../file-___home_harshil_Desktop_open-source_palisadoes_talawa_lib_widgets_directly_login/)
3. [DirectlyLogin](../../file-___home_harshil_Desktop_open-source_palisadoes_talawa_lib_widgets_directly_login/DirectlyLogin-class.html)
4. loginUsingPrevCredentials method

loginUsingPrevCredentials


dark\_mode

light\_mode




# loginUsingPrevCredentials method


[Future](https://api.flutter.dev/flutter/dart-core/Future-class.html)<void>
loginUsingPrevCredentials()

This method is used to login useing saved detials.

**params**:
None

**returns**:
None


## Implementation

```
Future<void> loginUsingPrevCredentials() async {
  model.email.text = model.prevUserEmail ?? '';
  model.password.text = model.prevUserPassword ?? '';
  await model.login();
}
```

 


1. [talawa](../../index.html)
2. [directly\_login](../../file-___home_harshil_Desktop_open-source_palisadoes_talawa_lib_widgets_directly_login/)
3. [DirectlyLogin](../../file-___home_harshil_Desktop_open-source_palisadoes_talawa_lib_widgets_directly_login/DirectlyLogin-class.html)
4. loginUsingPrevCredentials method

##### DirectlyLogin class





talawa
1.0.0+1






