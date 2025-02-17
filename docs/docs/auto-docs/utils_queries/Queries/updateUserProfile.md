
<div>

# updateUserProfile method

</div>


[[String](https://api.flutter.dev/flutter/dart-core/String-class.html)]




to update user profile.

**params**: None

**returns**:

-   `String`: return a mutation



## Implementation

``` language-dart
String  {
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







1.  [talawa](../../index.md)
2.  [queries](../../utils_queries/)
3.  [Queries](../../utils_queries/Queries-class.md)
4.  updateUserProfile method

##### Queries class







