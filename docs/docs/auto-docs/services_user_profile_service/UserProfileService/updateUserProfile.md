




updateUserProfile method - UserProfileService class - user\_profile\_service library - Dart API







menu

1. [talawa](../../index.html)
2. [services/user\_profile\_service.dart](../../services_user_profile_service/services_user_profile_service-library.html)
3. [UserProfileService](../../services_user_profile_service/UserProfileService-class.html)
4. updateUserProfile method

updateUserProfile


dark\_mode

light\_mode




# updateUserProfile method


Future<[QueryResult](https://pub.dev/documentation/graphql/5.2.0-beta.9/graphql/QueryResult-class.html)<Object?>>
updateUserProfile(

1. Map<String, dynamic>? variables

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
2. [user\_profile\_service](../../services_user_profile_service/services_user_profile_service-library.html)
3. [UserProfileService](../../services_user_profile_service/UserProfileService-class.html)
4. updateUserProfile method

##### UserProfileService class





talawa
1.0.0+1






