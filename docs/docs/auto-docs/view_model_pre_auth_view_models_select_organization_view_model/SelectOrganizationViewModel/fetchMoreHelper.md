
<div>

# fetchMoreHelper method

</div>


void fetchMoreHelper(

1.  [[[FetchMore](https://pub.dev/documentation/graphql_flutter/5.2.0-beta.7/graphql_flutter/FetchMore.md)[\<[[Object](https://api.flutter.dev/flutter/dart-core/Object-class.html)?]\>]]
    fetchMore, ]
2.  [[[List](https://api.flutter.dev/flutter/dart-core/List-class.html)]
    organizations]

)



This function fetch more option.

**params**:

-   `fetchMore`: client function
-   `organizations`: org list

**returns**: None



## Implementation

``` language-dart
void fetchMoreHelper(FetchMore fetchMore, List organizations) {
  fetchMore(
    FetchMoreOptions(
      variables: {
        "first": organizations.length + 15,
        "skip": organizations.length,
      },
      updateQuery: (existingOrganizations, newOrganizations) {
        return {
          'organizationsConnection':
              (existingOrganizations!["organizationsConnection"]
                      as List<Object?>) +
                  (newOrganizations!['organizationsConnection']
                      as List<dynamic>),
        };
      },
    ),
  );
}
```







1.  [talawa](../../index.md)
2.  [select_organization_view_model](../../view_model_pre_auth_view_models_select_organization_view_model/)
3.  [SelectOrganizationViewModel](../../view_model_pre_auth_view_models_select_organization_view_model/SelectOrganizationViewModel-class.md)
4.  fetchMoreHelper method

##### SelectOrganizationViewModel class







