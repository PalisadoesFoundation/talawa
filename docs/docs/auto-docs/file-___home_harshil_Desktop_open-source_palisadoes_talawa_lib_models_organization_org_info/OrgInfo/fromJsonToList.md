




fromJsonToList method - OrgInfo class - org\_info library - Dart API







menu

1. [talawa](../../index.html)
2. [models/organization/org\_info.dart](../../file-___home_harshil_Desktop_open-source_palisadoes_talawa_lib_models_organization_org_info/)
3. [OrgInfo](../../file-___home_harshil_Desktop_open-source_palisadoes_talawa_lib_models_organization_org_info/OrgInfo-class.html)
4. fromJsonToList method

fromJsonToList


dark\_mode

light\_mode




# fromJsonToList method


[List](https://api.flutter.dev/flutter/dart-core/List-class.html)<[OrgInfo](../../file-___home_harshil_Desktop_open-source_palisadoes_talawa_lib_models_organization_org_info/OrgInfo-class.html)>
fromJsonToList(

1. dynamic json

)

The conventional function to parse json, check flutter docs to know more.

**params**:

* `json`: Passing the json to be parsed.

**returns**:

* `List<OrgInfo>`: returning the OrgInfo object containing the json data

## Implementation

```
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

 


1. [talawa](../../index.html)
2. [org\_info](../../file-___home_harshil_Desktop_open-source_palisadoes_talawa_lib_models_organization_org_info/)
3. [OrgInfo](../../file-___home_harshil_Desktop_open-source_palisadoes_talawa_lib_models_organization_org_info/OrgInfo-class.html)
4. fromJsonToList method

##### OrgInfo class





talawa
1.0.0+1






