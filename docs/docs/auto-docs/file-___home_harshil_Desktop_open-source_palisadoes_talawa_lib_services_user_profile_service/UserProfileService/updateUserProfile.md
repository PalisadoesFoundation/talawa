




updateUserProfile method - UserProfileService class - user\_profile\_service library - Dart API







menu

1. [talawa](../../index.html)
2. [services/user\_profile\_service.dart](../../file-___home_harshil_Desktop_open-source_palisadoes_talawa_lib_services_user_profile_service/)
3. [UserProfileService](../../file-___home_harshil_Desktop_open-source_palisadoes_talawa_lib_services_user_profile_service/UserProfileService-class.html)
4. updateUserProfile method

updateUserProfile


dark\_mode

light\_mode




# updateUserProfile method


[Future](https://api.flutter.dev/flutter/dart-core/Future-class.html)
updateUserProfile(

1. [Map](https://api.flutter.dev/flutter/dart-core/Map-class.html)<[String](https://api.flutter.dev/flutter/dart-core/String-class.html), dynamic>? variables

)

Updates the user profile using a GraphQL mutation.

**params**:

* `variables`: A map of key-value pairs representing the variables required for the GraphQL mutation.
  If `null`, the mutation is performed without additional variables.

**returns**:

* `Future<QueryResult<Object?>>`: which contains the result of the GraphQL mutation.

## Implementation

```
Future<QueryResult<Object?>> updateUserProfile(
  Map<String, dynamic>? variables,
) {
  return databaseFunctions.gqlAuthMutation(
    queries.updateUserProfile(),
    variables: variables,
  );
}
```

 


1. [talawa](../../index.html)
2. [user\_profile\_service](../../file-___home_harshil_Desktop_open-source_palisadoes_talawa_lib_services_user_profile_service/)
3. [UserProfileService](../../file-___home_harshil_Desktop_open-source_palisadoes_talawa_lib_services_user_profile_service/UserProfileService-class.html)
4. updateUserProfile method

##### UserProfileService class





talawa
1.0.0+1






