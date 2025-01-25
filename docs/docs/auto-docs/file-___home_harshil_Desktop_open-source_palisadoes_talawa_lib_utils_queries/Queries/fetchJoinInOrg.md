




fetchJoinInOrg property - Queries class - queries library - Dart API







menu

1. [talawa](../../index.html)
2. [utils/queries.dart](../../file-___home_harshil_Desktop_open-source_palisadoes_talawa_lib_utils_queries/)
3. [Queries](../../file-___home_harshil_Desktop_open-source_palisadoes_talawa_lib_utils_queries/Queries-class.html)
4. fetchJoinInOrg property

fetchJoinInOrg


dark\_mode

light\_mode




# fetchJoinInOrg property


[String](https://api.flutter.dev/flutter/dart-core/String-class.html)
get
fetchJoinInOrg

getter for joined org.


## Implementation

```
String get fetchJoinInOrg {
  return """
  query organizationsConnection(\$first: Int, \$skip: Int){
    organizationsConnection(
      first: \$first,
      skip: \$skip,
      orderBy: name_ASC
    ){
      image
      _id
      name
      image
      description
      address{
      city
      countryCode
      state
    }
      userRegistrationRequired
      creator{
        firstName
        lastName
      }
      members{
            firstName
            lastName
            image
            }
            admins{
            firstName
            lastName
            image
            }
    }
  }
""";
}
```


 


1. [talawa](../../index.html)
2. [queries](../../file-___home_harshil_Desktop_open-source_palisadoes_talawa_lib_utils_queries/)
3. [Queries](../../file-___home_harshil_Desktop_open-source_palisadoes_talawa_lib_utils_queries/Queries-class.html)
4. fetchJoinInOrg property

##### Queries class





talawa
1.0.0+1






