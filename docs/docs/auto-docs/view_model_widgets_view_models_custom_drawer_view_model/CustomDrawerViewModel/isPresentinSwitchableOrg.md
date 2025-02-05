


# isPresentinSwitchableOrg method








[bool](https://api.flutter.dev/flutter/dart-core/bool-class.html) isPresentinSwitchableOrg
([OrgInfo](../../models_organization_org_info/OrgInfo-class.md) switchToOrg)





<p>This function checks <code>switchOrg</code> is present in the <code>switchAbleOrg</code>.</p>
<p>params:</p>
<ul>
<li><code>switchToOrg</code> : <code>OrgInfo</code> type of organization want to switch into.</li>
</ul>



## Implementation

```dart
bool isPresentinSwitchableOrg(OrgInfo switchToOrg) {
  var isPresent = false;
  for (final OrgInfo orgs in switchAbleOrg) {
    if (orgs.id == switchToOrg.id) {
      isPresent = true;
    }
  }
  return isPresent;
}
```







