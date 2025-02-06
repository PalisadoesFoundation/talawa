


# initialize method








void initialize
()








## Implementation

```dart
void initialize() \{
  setState(ViewState.busy);
  currentOrg = _userConfig.currentOrg;
  currentUser = _userConfig.currentUser;
  setState(ViewState.idle);
\}
```







