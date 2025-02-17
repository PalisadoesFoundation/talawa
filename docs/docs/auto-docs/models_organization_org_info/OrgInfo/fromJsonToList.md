
<div>

# fromJsonToList method

</div>


[[List](https://api.flutter.dev/flutter/dart-core/List-class.html)[\<[[OrgInfo](../../models_organization_org_info/OrgInfo-class.html)]\>]]
fromJsonToList(

1.  [dynamic
    json]

)



The conventional function to parse json, check flutter docs to know
more.

**params**:

-   `json`: Passing the json to be parsed.

**returns**:

-   `List<OrgInfo>`: returning the OrgInfo object containing the json
    data



## Implementation

``` language-dart
List<OrgInfo> fromJsonToList(dynamic json) {
  final List<OrgInfo> orgList = [];

  if (json is List) {
    for (final dynamic outerElement in json) {
      if (outerElement is List) {
        for (final dynamic innerElement in outerElement) {
          if (innerElement is Map<String, dynamic>) {
            final OrgInfo org = OrgInfo.fromJson(innerElement);
            orgList.add(org);
          }
        }
      } else if (outerElement is Map<String, dynamic>) {
        final OrgInfo org = OrgInfo.fromJson(outerElement);
        orgList.add(org);
      }
    }
  }

  return orgList;
}
```







1.  [talawa](../../index.html)
2.  [org_info](../../models_organization_org_info/)
3.  [OrgInfo](../../models_organization_org_info/OrgInfo-class.html)
4.  fromJsonToList method

##### OrgInfo class







