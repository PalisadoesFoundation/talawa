


# setOrgStreamSubscription method








void setOrgStreamSubscription
()








## Implementation

```dart
void setOrgStreamSubscription() \{
  _userConfig.currentOrgInfoStream.listen((updatedOrganization) \{
    if (updatedOrganization != _currentOrg) \{
      print("org changes from post service");
      _renderedPostID.clear();
      _currentOrg = updatedOrganization;
      getPosts();
    \}
  \});
\}
```







