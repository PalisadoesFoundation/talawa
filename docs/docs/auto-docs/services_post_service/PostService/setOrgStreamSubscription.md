
<div>

# setOrgStreamSubscription method

</div>


void 



This method sets up a stream that constantly listens to change in
current org.

**params**: None

**returns**: None



## Implementation

``` language-dart
void  {
  _userConfig.currentOrgInfoStream.listen((updatedOrganization) {
    if (updatedOrganization != _currentOrg) {
      _renderedPostID.;
      _currentOrg = updatedOrganization;
      ;
    }
  });
}
```







1.  [talawa](../../index.html)
2.  [post_service](../../services_post_service/)
3.  [PostService](../../services_post_service/PostService-class.html)
4.  setOrgStreamSubscription method

##### PostService class







