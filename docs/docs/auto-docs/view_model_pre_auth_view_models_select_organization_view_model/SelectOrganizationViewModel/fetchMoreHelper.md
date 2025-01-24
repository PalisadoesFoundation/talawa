




fetchMoreHelper method - SelectOrganizationViewModel class - select\_organization\_view\_model library - Dart API







menu

1. [talawa](../../index.html)
2. [view\_model/pre\_auth\_view\_models/select\_organization\_view\_model.dart](../../view_model_pre_auth_view_models_select_organization_view_model/view_model_pre_auth_view_models_select_organization_view_model-library.html)
3. [SelectOrganizationViewModel](../../view_model_pre_auth_view_models_select_organization_view_model/SelectOrganizationViewModel-class.html)
4. fetchMoreHelper method

fetchMoreHelper


dark\_mode

light\_mode




# fetchMoreHelper method


void
fetchMoreHelper(

1. [FetchMore](https://pub.dev/documentation/graphql_flutter/5.2.0-beta.7/graphql_flutter/FetchMore.html)<Object?> fetchMore,
2. List organizations

)

This function fetch more option.

**params**:

* `fetchMore`: client function
* `organizations`: org list

**returns**:
None


## Implementation

```
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

 


1. [talawa](../../index.html)
2. [select\_organization\_view\_model](../../view_model_pre_auth_view_models_select_organization_view_model/view_model_pre_auth_view_models_select_organization_view_model-library.html)
3. [SelectOrganizationViewModel](../../view_model_pre_auth_view_models_select_organization_view_model/SelectOrganizationViewModel-class.html)
4. fetchMoreHelper method

##### SelectOrganizationViewModel class





talawa
1.0.0+1






