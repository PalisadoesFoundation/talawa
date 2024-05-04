


# saveCurrentOrgInHive method








void saveCurrentOrgInHive
([OrgInfo](../../models_organization_org_info/OrgInfo-class.md) saveOrgAsCurrent)








## Implementation

```dart
void saveCurrentOrgInHive(OrgInfo saveOrgAsCurrent) {
  _currentOrg = saveOrgAsCurrent;
  _currentOrgInfoController.add(_currentOrg!);
  final box = Hive.box<OrgInfo>('currentOrg');
  if (box.get('org') == null) {
    box.put('org', _currentOrg!);
  } else {
    box.put('org', _currentOrg!);
  }
}
```







