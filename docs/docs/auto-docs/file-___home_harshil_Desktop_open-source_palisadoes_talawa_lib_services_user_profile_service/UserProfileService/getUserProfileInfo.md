




getUserProfileInfo method - UserProfileService class - user\_profile\_service library - Dart API







menu

1. [talawa](../../index.html)
2. [services/user\_profile\_service.dart](../../file-___home_harshil_Desktop_open-source_palisadoes_talawa_lib_services_user_profile_service/)
3. [UserProfileService](../../file-___home_harshil_Desktop_open-source_palisadoes_talawa_lib_services_user_profile_service/UserProfileService-class.html)
4. getUserProfileInfo method

getUserProfileInfo


dark\_mode

light\_mode




# getUserProfileInfo method


[Future](https://api.flutter.dev/flutter/dart-core/Future-class.html)
getUserProfileInfo(

1. dynamic user

)

Retrieves user profile information using a GraphQL query.

**params**:

* `user`: An instance of `User` representing the user whose profile information is to be fetched.
  The user's ID is used as a variable for the GraphQL query.

**returns**:

* `Future<QueryResult<Object?>>`: which contains the result of the GraphQL query.

## Implementation

```
Future<QueryResult<Object?>> getUserProfileInfo(User user) async {
  final QueryResult result = await databaseFunctions.gqlAuthQuery(
    queries.fetchUserInfo,
    variables: {'id': user.id},
  );
  return result;
}
```

 


1. [talawa](../../index.html)
2. [user\_profile\_service](../../file-___home_harshil_Desktop_open-source_palisadoes_talawa_lib_services_user_profile_service/)
3. [UserProfileService](../../file-___home_harshil_Desktop_open-source_palisadoes_talawa_lib_services_user_profile_service/UserProfileService-class.html)
4. getUserProfileInfo method

##### UserProfileService class





talawa
1.0.0+1






