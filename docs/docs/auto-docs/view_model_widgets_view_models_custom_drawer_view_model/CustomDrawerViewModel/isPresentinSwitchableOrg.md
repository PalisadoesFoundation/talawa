


# isPresentinSwitchableOrg method








[bool](https://api.flutter.dev/flutter/dart-core/bool-class.html) isPresentinSwitchableOrg
([OrgInfo](../../models_organization_org_info/OrgInfo-class.md) switchToOrg)





<p>This function checks ```dartswitchOrg``` is present in the ```dartswitchAbleOrg```.</p>
<p>params:</p>
<ul>
<li>```dartswitchToOrg``` : ```dartOrgInfo``` type of organization want to switch into.</li>
</ul>



## Implementation

```dart
bool isPresentinSwitchableOrg(OrgInfo switchToOrg) \{
  var isPresent = false;
  for (final OrgInfo orgs in switchAbleOrg) \{
    if (orgs.id == switchToOrg.id) \{
      isPresent = true;
    \}
  \}
  return isPresent;
\}
```







