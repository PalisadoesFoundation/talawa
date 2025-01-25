




updateUserProfile method - Queries class - queries library - Dart API







menu

1. [talawa](../../index.html)
2. [utils/queries.dart](../../file-___home_harshil_Desktop_open-source_palisadoes_talawa_lib_utils_queries/)
3. [Queries](../../file-___home_harshil_Desktop_open-source_palisadoes_talawa_lib_utils_queries/Queries-class.html)
4. updateUserProfile method

updateUserProfile


dark\_mode

light\_mode




# updateUserProfile method


[String](https://api.flutter.dev/flutter/dart-core/String-class.html)
updateUserProfile()

to update user profile.

**params**:
None

**returns**:

* `String`: return a mutation

## Implementation

```
String updateUserProfile() {
  return """
    mutation UpdateUserProfile(
      \$firstName: String
      \$lastName: String
      \$email: EmailAddress
      \$file: String
    ) {
    updateUserProfile(
      data: { firstName: \$firstName, lastName: \$lastName, email: \$email }
      file: \$file
    ) {
      _id
      }
    }
  """;
}
```

 


1. [talawa](../../index.html)
2. [queries](../../file-___home_harshil_Desktop_open-source_palisadoes_talawa_lib_utils_queries/)
3. [Queries](../../file-___home_harshil_Desktop_open-source_palisadoes_talawa_lib_utils_queries/Queries-class.html)
4. updateUserProfile method

##### Queries class





talawa
1.0.0+1






