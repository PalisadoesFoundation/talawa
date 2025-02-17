
<div>

# fetchJoinInOrgByName property

</div>



[[String](https://api.flutter.dev/flutter/dart-core/String-class.html)]
get fetchJoinInOrgByName



getter for fetchJoinInOrgByName.



## Implementation

``` language-dart
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








1.  [talawa](../../index.md)
2.  [queries](../../utils_queries/)
3.  [Queries](../../utils_queries/Queries-class.md)
4.  fetchJoinInOrgByName property

##### Queries class







