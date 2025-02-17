::::::: {#dartdoc-main-content .main-content above-sidebar="services_org_service/OrganizationService-class-sidebar.html" below-sidebar=""}
<div>

# [getOrgMembersList]{.kind-method} method

</div>

::: {.section .multi-line-signature}
[[Future](https://api.flutter.dev/flutter/dart-core/Future-class.html)[\<[[List](https://api.flutter.dev/flutter/dart-core/List-class.html)[\<[[User](../../models_user_user_info/User-class.html)]{.type-parameter}\>]{.signature}]{.type-parameter}\>]{.signature}]{.returntype}
[getOrgMembersList]{.name}(

1.  [[[String](https://api.flutter.dev/flutter/dart-core/String-class.html)]{.type-annotation}
    [orgId]{.parameter-name}]{#getOrgMembersList-param-orgId .parameter}

)
:::

::: {.section .desc .markdown}
Retrieves a list of organization members.

**params**:

-   `orgId`: The ID of the organization to fetch members from.

**returns**:

-   `Future<List<User>>`: A promise that will be fulfilled with the list
    of organization members.
:::

::: {#source .section .summary .source-code}
## Implementation

``` language-dart
Future<List<User>> getOrgMembersList(String orgId) async {
  final String query = Queries().fetchOrgDetailsById(orgId);
  // fetching from database using graphQL mutations.
  final result = await _dbFunctions.gqlAuthMutation(query);
  final organizations = result.data?['organizations'] as List;
  final List orgMembersResult =
      (organizations[0] as Map<String, dynamic>)['members'] as List;
  final List<User> orgMembersList = [];
  orgMembersResult.forEach((jsonElement) {
    final User member =
        User.fromJson(jsonElement as Map<String, dynamic>, fromOrg: true);
    orgMembersList.add(member);
  });

  // return list
  return orgMembersList;
}
```
:::
:::::::

::::: {#dartdoc-sidebar-left .sidebar .sidebar-offcanvas-left}
::: {#header-search-sidebar .hidden-l}
:::

1.  [talawa](../../index.html)
2.  [org_service](../../services_org_service/)
3.  [OrganizationService](../../services_org_service/OrganizationService-class.html)
4.  getOrgMembersList method

##### OrganizationService class

::: {#dartdoc-sidebar-left-content}
:::
:::::

::: {#dartdoc-sidebar-right .sidebar .sidebar-offcanvas-right}
:::
