
<div>

# updateUserProfile method

</div>


[[Future](https://api.flutter.dev/flutter/dart-core/Future-class.html)[\<[[QueryResult](https://pub.dev/documentation/graphql/5.2.0-beta.9/graphql/QueryResult-class.html)[\<[[Object](https://api.flutter.dev/flutter/dart-core/Object-class.html)?]\>]]\>]]
updateUserProfile(

1.  [[[Map](https://api.flutter.dev/flutter/dart-core/Map-class.md)[\<[[String](https://api.flutter.dev/flutter/dart-core/String-class.html)],
    dynamic\>]?]
    variables]

)



Updates the user profile using a GraphQL mutation.

**params**:

-   `variables`: A map of key-value pairs representing the variables
    required for the GraphQL mutation. If `null`, the mutation is
    performed without additional variables.

**returns**:

-   `Future<QueryResult<Object?>>`: which contains the result of the
    GraphQL mutation.



## Implementation

``` language-dart
Future<QueryResult<Object?>> updateUserProfile(
  Map<String, dynamic>? variables,
) 
```







1.  [talawa](../../index.md)
2.  [user_profile_service](../../services_user_profile_service/)
3.  [UserProfileService](../../services_user_profile_service/UserProfileService-class.md)
4.  updateUserProfile method

##### UserProfileService class







