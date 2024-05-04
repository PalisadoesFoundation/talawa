


# setCurrentOrganizationName method








void setCurrentOrganizationName
([String](https://api.flutter.dev/flutter/dart-core/String-class.html) updatedOrganization)





<p>This function sets the organization name after update.</p>
<p>params:</p>
<ul>
<li><code>updatedOrganization</code> : updated organization name.</li>
</ul>



## Implementation

```dart
void setCurrentOrganizationName(String updatedOrganization) {
  // if `updatedOrganization` is not same to `_currentOrgName`.
  if (updatedOrganization != _currentOrgName) {
    _posts.clear();
    _renderedPostID.clear();
    _currentOrgName = updatedOrganization;
    notifyListeners();
  }
  // _postService.getPosts();
}
```







