




OrganizationFeedViewModel class - organization\_feed\_view\_model library - Dart API







menu

1. [talawa](../index.html)
2. [view\_model/after\_auth\_view\_models/feed\_view\_models/organization\_feed\_view\_model.dart](../file-___home_harshil_Desktop_open-source_palisadoes_talawa_lib_view_model_after_auth_view_models_feed_view_models_organization_feed_view_model/)
3. OrganizationFeedViewModel class

OrganizationFeedViewModel


dark\_mode

light\_mode




# OrganizationFeedViewModel class


OrganizationFeedViewModel class helps to interact with model to serve data to view for organization feed section.

Methods include:

* `setCurrentOrganizationName` : to set current organization name.
* `fetchNewPosts` : to fetch new posts in the organization.
* `navigateToIndividualPage` : to navigate to individual page.
* `navigateToPinnedPostPage` : to navigate to pinned post page.
* `addNewPost` : to add new post in the organization.
* `updatedPost` : to update a post in the organization.

## Constructors

[OrganizationFeedViewModel](../file-___home_harshil_Desktop_open-source_palisadoes_talawa_lib_view_model_after_auth_view_models_feed_view_models_organization_feed_view_model/OrganizationFeedViewModel/OrganizationFeedViewModel.html)()




## Properties

[currentOrgName](../file-___home_harshil_Desktop_open-source_palisadoes_talawa_lib_view_model_after_auth_view_models_feed_view_models_organization_feed_view_model/OrganizationFeedViewModel/currentOrgName.html)
→ [String](https://api.flutter.dev/flutter/dart-core/String-class.html)

getter for the currentOrgName.
no setter

[hashCode](https://api.flutter.dev/flutter/dart-core/Object/hashCode.html)
→ [int](https://api.flutter.dev/flutter/dart-core/int-class.html)

The hash code for this object.
no setterinherited

[isFetchingPosts](../file-___home_harshil_Desktop_open-source_palisadoes_talawa_lib_view_model_after_auth_view_models_feed_view_models_organization_feed_view_model/OrganizationFeedViewModel/isFetchingPosts.html)
→ [bool](https://api.flutter.dev/flutter/dart-core/bool-class.html)

getter for isFetchingPosts to show loading indicator.
no setter

[istest](../file-___home_harshil_Desktop_open-source_palisadoes_talawa_lib_view_model_after_auth_view_models_feed_view_models_organization_feed_view_model/OrganizationFeedViewModel/istest.html)
↔ [bool](https://api.flutter.dev/flutter/dart-core/bool-class.html)

flag for the test.
getter/setter pair

[pinnedPosts](../file-___home_harshil_Desktop_open-source_palisadoes_talawa_lib_view_model_after_auth_view_models_feed_view_models_organization_feed_view_model/OrganizationFeedViewModel/pinnedPosts.html)
→ [List](https://api.flutter.dev/flutter/dart-core/List-class.html)

getter for the pinned post.
no setter

[posts](../file-___home_harshil_Desktop_open-source_palisadoes_talawa_lib_view_model_after_auth_view_models_feed_view_models_organization_feed_view_model/OrganizationFeedViewModel/posts.html)
→ [List](https://api.flutter.dev/flutter/dart-core/List-class.html)

getter for the posts.
no setter

[runtimeType](https://api.flutter.dev/flutter/dart-core/Object/runtimeType.html)
→ [Type](https://api.flutter.dev/flutter/dart-core/Type-class.html)

A representation of the runtime type of the object.
no setterinherited

[userPosts](../file-___home_harshil_Desktop_open-source_palisadoes_talawa_lib_view_model_after_auth_view_models_feed_view_models_organization_feed_view_model/OrganizationFeedViewModel/userPosts.html)
→ [List](https://api.flutter.dev/flutter/dart-core/List-class.html)

Getter for User Posts.
no setter



## Methods

[addNewPost](../file-___home_harshil_Desktop_open-source_palisadoes_talawa_lib_view_model_after_auth_view_models_feed_view_models_organization_feed_view_model/OrganizationFeedViewModel/addNewPost.html)(dynamic newPost)
→ void


This function adds new Post.

[buildNewPosts](../file-___home_harshil_Desktop_open-source_palisadoes_talawa_lib_view_model_after_auth_view_models_feed_view_models_organization_feed_view_model/OrganizationFeedViewModel/buildNewPosts.html)([List](https://api.flutter.dev/flutter/dart-core/List-class.html) newPosts)
→ void


This function initialise `_posts` with `newPosts`.

[dispose](../file-___home_harshil_Desktop_open-source_palisadoes_talawa_lib_view_model_after_auth_view_models_feed_view_models_organization_feed_view_model/OrganizationFeedViewModel/dispose.html)()
→ void



[fetchNewPosts](../file-___home_harshil_Desktop_open-source_palisadoes_talawa_lib_view_model_after_auth_view_models_feed_view_models_organization_feed_view_model/OrganizationFeedViewModel/fetchNewPosts.html)()
→ void


This function fetches new posts in the organization.

[initialise](../file-___home_harshil_Desktop_open-source_palisadoes_talawa_lib_view_model_after_auth_view_models_feed_view_models_organization_feed_view_model/OrganizationFeedViewModel/initialise.html)({[bool](https://api.flutter.dev/flutter/dart-core/bool-class.html) isTest = false})
→ void


To initialize the view model.

[navigateToIndividualPage](../file-___home_harshil_Desktop_open-source_palisadoes_talawa_lib_view_model_after_auth_view_models_feed_view_models_organization_feed_view_model/OrganizationFeedViewModel/navigateToIndividualPage.html)(dynamic post)
→ void


This function navigate to individual post page..

[navigateToPinnedPostPage](../file-___home_harshil_Desktop_open-source_palisadoes_talawa_lib_view_model_after_auth_view_models_feed_view_models_organization_feed_view_model/OrganizationFeedViewModel/navigateToPinnedPostPage.html)()
→ void


This function navigate to pinned post page.

[nextPage](../file-___home_harshil_Desktop_open-source_palisadoes_talawa_lib_view_model_after_auth_view_models_feed_view_models_organization_feed_view_model/OrganizationFeedViewModel/nextPage.html)()
→ void


Method to fetch next posts.

[noSuchMethod](https://api.flutter.dev/flutter/dart-core/Object/noSuchMethod.html)([Invocation](https://api.flutter.dev/flutter/dart-core/Invocation-class.html) invocation)
→ dynamic


Invoked when a nonexistent method or property is accessed.
inherited

[previousPage](../file-___home_harshil_Desktop_open-source_palisadoes_talawa_lib_view_model_after_auth_view_models_feed_view_models_organization_feed_view_model/OrganizationFeedViewModel/previousPage.html)()
→ void


Method to fetch previous posts.

[removePost](../file-___home_harshil_Desktop_open-source_palisadoes_talawa_lib_view_model_after_auth_view_models_feed_view_models_organization_feed_view_model/OrganizationFeedViewModel/removePost.html)(dynamic post)
→ [Future](https://api.flutter.dev/flutter/dart-core/Future-class.html)<void>


function to remove the post.

[setCurrentOrganizationName](../file-___home_harshil_Desktop_open-source_palisadoes_talawa_lib_view_model_after_auth_view_models_feed_view_models_organization_feed_view_model/OrganizationFeedViewModel/setCurrentOrganizationName.html)([String](https://api.flutter.dev/flutter/dart-core/String-class.html) updatedOrganization)
→ void


This function sets the organization name after update.

[toString](https://api.flutter.dev/flutter/dart-core/Object/toString.html)()
→ [String](https://api.flutter.dev/flutter/dart-core/String-class.html)


A string representation of this object.
inherited

[updatedPost](../file-___home_harshil_Desktop_open-source_palisadoes_talawa_lib_view_model_after_auth_view_models_feed_view_models_organization_feed_view_model/OrganizationFeedViewModel/updatedPost.html)(dynamic post)
→ void


This function updates the post.



## Operators

[operator ==](https://api.flutter.dev/flutter/dart-core/Object/operator_equals.html)([Object](https://api.flutter.dev/flutter/dart-core/Object-class.html) other)
→ [bool](https://api.flutter.dev/flutter/dart-core/bool-class.html)


The equality operator.
inherited



 


1. [talawa](../index.html)
2. [organization\_feed\_view\_model](../file-___home_harshil_Desktop_open-source_palisadoes_talawa_lib_view_model_after_auth_view_models_feed_view_models_organization_feed_view_model/)
3. OrganizationFeedViewModel class

##### organization\_feed\_view\_model library





talawa
1.0.0+1






