




fetchJoinInOrgByName property - Queries class - queries library - Dart API







menu

1. [talawa](../../index.html)
2. [utils/queries.dart](../../file-___home_harshil_Desktop_open-source_palisadoes_talawa_lib_utils_queries/)
3. [Queries](../../file-___home_harshil_Desktop_open-source_palisadoes_talawa_lib_utils_queries/Queries-class.html)
4. fetchJoinInOrgByName property

fetchJoinInOrgByName


dark\_mode

light\_mode




# fetchJoinInOrgByName property


[String](https://api.flutter.dev/flutter/dart-core/String-class.html)
get
fetchJoinInOrgByName

getter for fetchJoinInOrgByName.


## Implementation

```
String get fetchJoinInOrgByName {
  return """
  query organizationsConnection(
    \$first: Int,
    \$skip: Int,
    \$nameStartsWith: String
  ){
    organizationsConnection(
      where:{
        name_starts_with: \$nameStartsWith,
        visibleInSearch: true,
        userRegistrationRequired: true,
      }
      first: \$first,
      skip: \$skip,
      orderBy: name_ASC
    ){
      image
      _id
      name
      image
      userRegistrationRequired
      creator{
        firstName
        lastName
      }
    }
  }
""";
}
```


 


1. [talawa](../../index.html)
2. [queries](../../file-___home_harshil_Desktop_open-source_palisadoes_talawa_lib_utils_queries/)
3. [Queries](../../file-___home_harshil_Desktop_open-source_palisadoes_talawa_lib_utils_queries/Queries-class.html)
4. fetchJoinInOrgByName property

##### Queries class





talawa
1.0.0+1






