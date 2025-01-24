




loginUsingPrevCredentials method - DirectlyLogin class - directly\_login library - Dart API







menu

1. [talawa](../../index.html)
2. [widgets/directly\_login.dart](../../widgets_directly_login/widgets_directly_login-library.html)
3. [DirectlyLogin](../../widgets_directly_login/DirectlyLogin-class.html)
4. loginUsingPrevCredentials method

loginUsingPrevCredentials


dark\_mode

light\_mode




# loginUsingPrevCredentials method


Future<void>
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
2. [directly\_login](../../widgets_directly_login/widgets_directly_login-library.html)
3. [DirectlyLogin](../../widgets_directly_login/DirectlyLogin-class.html)
4. loginUsingPrevCredentials method

##### DirectlyLogin class





talawa
1.0.0+1






