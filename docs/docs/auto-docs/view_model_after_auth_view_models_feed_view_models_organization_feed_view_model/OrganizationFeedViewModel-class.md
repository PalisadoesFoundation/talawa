




OrganizationFeedViewModel class - organization\_feed\_view\_model library - Dart API







menu

1. [talawa](../index.html)
2. [view\_model/after\_auth\_view\_models/feed\_view\_models/organization\_feed\_view\_model.dart](../view_model_after_auth_view_models_feed_view_models_organization_feed_view_model/view_model_after_auth_view_models_feed_view_models_organization_feed_view_model-library.html)
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

Inheritance

* Object
* [ChangeNotifier](https://api.flutter.dev/flutter/foundation/ChangeNotifier-class.html)
* [BaseModel](../view_model_base_view_model/BaseModel-class.html)
* OrganizationFeedViewModel



## Constructors

[OrganizationFeedViewModel](../view_model_after_auth_view_models_feed_view_models_organization_feed_view_model/OrganizationFeedViewModel/OrganizationFeedViewModel.html)()




## Properties

[currentOrgName](../view_model_after_auth_view_models_feed_view_models_organization_feed_view_model/OrganizationFeedViewModel/currentOrgName.html)
→ String

getter for the currentOrgName.
no setter

[hashCode](https://api.flutter.dev/flutter/foundation/Listenable/hashCode.html)
→ int

The hash code for this object.
no setterinherited

[hasListeners](https://api.flutter.dev/flutter/foundation/ChangeNotifier/hasListeners.html)
→ bool

Whether any listeners are currently registered.
no setterinherited

[isBusy](../view_model_base_view_model/BaseModel/isBusy.html)
→ bool

no setterinherited

[isFetchingPosts](../view_model_after_auth_view_models_feed_view_models_organization_feed_view_model/OrganizationFeedViewModel/isFetchingPosts.html)
→ bool

getter for isFetchingPosts to show loading indicator.
no setter

[istest](../view_model_after_auth_view_models_feed_view_models_organization_feed_view_model/OrganizationFeedViewModel/istest.html)
↔ bool

flag for the test.
getter/setter pair

[pinnedPosts](../view_model_after_auth_view_models_feed_view_models_organization_feed_view_model/OrganizationFeedViewModel/pinnedPosts.html)
→ List<[Post](../models_post_post_model/Post-class.html)>

getter for the pinned post.
no setter

[posts](../view_model_after_auth_view_models_feed_view_models_organization_feed_view_model/OrganizationFeedViewModel/posts.html)
→ List<[Post](../models_post_post_model/Post-class.html)>

getter for the posts.
no setter

[runtimeType](https://api.flutter.dev/flutter/foundation/Listenable/runtimeType.html)
→ Type

A representation of the runtime type of the object.
no setterinherited

[state](../view_model_base_view_model/BaseModel/state.html)
→ [ViewState](../enums_enums/ViewState.html)

no setterinherited

[userPosts](../view_model_after_auth_view_models_feed_view_models_organization_feed_view_model/OrganizationFeedViewModel/userPosts.html)
→ List<[Post](../models_post_post_model/Post-class.html)>

Getter for User Posts.
no setter



## Methods

[addListener](https://api.flutter.dev/flutter/foundation/ChangeNotifier/addListener.html)([VoidCallback](https://api.flutter.dev/flutter/dart-ui/VoidCallback.html) listener)
→ void


Register a closure to be called when the object changes.
inherited

[addNewPost](../view_model_after_auth_view_models_feed_view_models_organization_feed_view_model/OrganizationFeedViewModel/addNewPost.html)([Post](../models_post_post_model/Post-class.html) newPost)
→ void


This function adds new Post.

[buildNewPosts](../view_model_after_auth_view_models_feed_view_models_organization_feed_view_model/OrganizationFeedViewModel/buildNewPosts.html)(List<[Post](../models_post_post_model/Post-class.html)> newPosts)
→ void


This function initialise `_posts` with `newPosts`.

[dispose](../view_model_after_auth_view_models_feed_view_models_organization_feed_view_model/OrganizationFeedViewModel/dispose.html)()
→ void


Discards any resources used by the object. After this is called, the
object is not in a usable state and should be discarded (calls to
[addListener](https://api.flutter.dev/flutter/foundation/ChangeNotifier/addListener.html) will throw after the object is disposed).
override

[fetchNewPosts](../view_model_after_auth_view_models_feed_view_models_organization_feed_view_model/OrganizationFeedViewModel/fetchNewPosts.html)()
→ void


This function fetches new posts in the organization.

[initialise](../view_model_after_auth_view_models_feed_view_models_organization_feed_view_model/OrganizationFeedViewModel/initialise.html)({bool isTest = false})
→ void


To initialize the view model.

[navigateToIndividualPage](../view_model_after_auth_view_models_feed_view_models_organization_feed_view_model/OrganizationFeedViewModel/navigateToIndividualPage.html)([Post](../models_post_post_model/Post-class.html) post)
→ void


This function navigate to individual post page..

[navigateToPinnedPostPage](../view_model_after_auth_view_models_feed_view_models_organization_feed_view_model/OrganizationFeedViewModel/navigateToPinnedPostPage.html)()
→ void


This function navigate to pinned post page.

[nextPage](../view_model_after_auth_view_models_feed_view_models_organization_feed_view_model/OrganizationFeedViewModel/nextPage.html)()
→ void


Method to fetch next posts.

[noSuchMethod](https://api.flutter.dev/flutter/foundation/Listenable/noSuchMethod.html)(Invocation invocation)
→ dynamic


Invoked when a nonexistent method or property is accessed.
inherited

[notifyListeners](https://api.flutter.dev/flutter/foundation/ChangeNotifier/notifyListeners.html)()
→ void


Call all the registered listeners.
inherited

[previousPage](../view_model_after_auth_view_models_feed_view_models_organization_feed_view_model/OrganizationFeedViewModel/previousPage.html)()
→ void


Method to fetch previous posts.

[removeListener](https://api.flutter.dev/flutter/foundation/ChangeNotifier/removeListener.html)([VoidCallback](https://api.flutter.dev/flutter/dart-ui/VoidCallback.html) listener)
→ void


Remove a previously registered closure from the list of closures that are
notified when the object changes.
inherited

[removePost](../view_model_after_auth_view_models_feed_view_models_organization_feed_view_model/OrganizationFeedViewModel/removePost.html)([Post](../models_post_post_model/Post-class.html) post)
→ Future<void>


function to remove the post.

[setCurrentOrganizationName](../view_model_after_auth_view_models_feed_view_models_organization_feed_view_model/OrganizationFeedViewModel/setCurrentOrganizationName.html)(String updatedOrganization)
→ void


This function sets the organization name after update.

[setState](../view_model_base_view_model/BaseModel/setState.html)([ViewState](../enums_enums/ViewState.html) viewState)
→ void


inherited

[toString](https://api.flutter.dev/flutter/foundation/Listenable/toString.html)()
→ String


A string representation of this object.
inherited

[updatedPost](../view_model_after_auth_view_models_feed_view_models_organization_feed_view_model/OrganizationFeedViewModel/updatedPost.html)([Post](../models_post_post_model/Post-class.html) post)
→ void


This function updates the post.



## Operators

[operator ==](https://api.flutter.dev/flutter/foundation/Listenable/operator_equals.html)(Object other)
→ bool


The equality operator.
inherited



 


1. [talawa](../index.html)
2. [organization\_feed\_view\_model](../view_model_after_auth_view_models_feed_view_models_organization_feed_view_model/view_model_after_auth_view_models_feed_view_models_organization_feed_view_model-library.html)
3. OrganizationFeedViewModel class

##### organization\_feed\_view\_model library





talawa
1.0.0+1






