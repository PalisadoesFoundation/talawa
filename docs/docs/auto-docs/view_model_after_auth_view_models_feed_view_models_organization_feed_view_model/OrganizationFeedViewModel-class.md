
<div>

# OrganizationFeedViewModel class

</div>


OrganizationFeedViewModel class helps to interact with model to serve
data to view for organization feed section.

Methods include:

-   `setCurrentOrganizationName` : to set current organization name.
-   `fetchNewPosts` : to fetch new posts in the organization.
-   `navigateToIndividualPage` : to navigate to individual page.
-   `navigateToPinnedPostPage` : to navigate to pinned post page.
-   `addNewPost` : to add new post in the organization.
-   `updatedPost` : to update a post in the organization.




Inheritance

:   -   [Object](https://api.flutter.dev/flutter/dart-core/Object-class.html)
    -   [ChangeNotifier](https://api.flutter.dev/flutter/foundation/ChangeNotifier-class.html)
    -   [BaseModel](../view_model_base_view_model/BaseModel-class.md)
    -   OrganizationFeedViewModel



## Constructors

[OrganizationFeedViewModel](../view_model_after_auth_view_models_feed_view_models_organization_feed_view_model/OrganizationFeedViewModel/OrganizationFeedViewModel.md)

:   



## Properties

[[currentOrgName](../view_model_after_auth_view_models_feed_view_models_organization_feed_view_model/OrganizationFeedViewModel/currentOrgName.md)] [→ [String](https://api.flutter.dev/flutter/dart-core/String-class.html)]
:   getter for the currentOrgName.
    ::: features
    no setter
    :::

[[hashCode](https://api.flutter.dev/flutter/dart-core/Object/hashCode.html)] [→ [int](https://api.flutter.dev/flutter/dart-core/int-class.html)]
:   The hash code for this object.
    ::: features
    no setterinherited
    :::

[[hasListeners](https://api.flutter.dev/flutter/foundation/ChangeNotifier/hasListeners.html)] [→ [bool](https://api.flutter.dev/flutter/dart-core/bool-class.html)]
:   Whether any listeners are currently registered.
    ::: features
    no setterinherited
    :::

[[isBusy](../view_model_base_view_model/BaseModel/isBusy.md)] [→ [bool](https://api.flutter.dev/flutter/dart-core/bool-class.html)]

:   ::: features
    no setterinherited
    :::

[[isFetchingPosts](../view_model_after_auth_view_models_feed_view_models_organization_feed_view_model/OrganizationFeedViewModel/isFetchingPosts.md)] [→ [bool](https://api.flutter.dev/flutter/dart-core/bool-class.html)]
:   getter for isFetchingPosts to show loading indicator.
    ::: features
    no setter
    :::

[[istest](../view_model_after_auth_view_models_feed_view_models_organization_feed_view_model/OrganizationFeedViewModel/istest.md)] [↔ [bool](https://api.flutter.dev/flutter/dart-core/bool-class.html)]
:   flag for the test.
    ::: features
    getter/setter pair
    :::

[[pinnedPosts](../view_model_after_auth_view_models_feed_view_models_organization_feed_view_model/OrganizationFeedViewModel/pinnedPosts.md)] [→ [List](https://api.flutter.dev/flutter/dart-core/List-class.html)[\<[[Post](../models_post_post_model/Post-class.md)]\>]]
:   getter for the pinned post.
    ::: features
    no setter
    :::

[[posts](../view_model_after_auth_view_models_feed_view_models_organization_feed_view_model/OrganizationFeedViewModel/posts.md)] [→ [List](https://api.flutter.dev/flutter/dart-core/List-class.html)[\<[[Post](../models_post_post_model/Post-class.md)]\>]]
:   getter for the posts.
    ::: features
    no setter
    :::

[[runtimeType](https://api.flutter.dev/flutter/dart-core/Object/runtimeType.html)] [→ [Type](https://api.flutter.dev/flutter/dart-core/Type-class.html)]
:   A representation of the runtime type of the object.
    ::: features
    no setterinherited
    :::

[[state](../view_model_base_view_model/BaseModel/state.md)] [→ [ViewState](../enums_enums/ViewState.md)]

:   ::: features
    no setterinherited
    :::

[[userPosts](../view_model_after_auth_view_models_feed_view_models_organization_feed_view_model/OrganizationFeedViewModel/userPosts.md)] [→ [List](https://api.flutter.dev/flutter/dart-core/List-class.html)[\<[[Post](../models_post_post_model/Post-class.md)]\>]]
:   Getter for User Posts.
    ::: features
    no setter
    :::



## Methods

[[addListener](https://api.flutter.dev/flutter/foundation/ChangeNotifier/addListener.html)][([[[VoidCallback](https://api.flutter.dev/flutter/dart-ui/VoidCallback.md)] listener]) → void ]
:   Register a closure to be called when the object changes.
    ::: features
    inherited
    :::

[[addNewPost](../view_model_after_auth_view_models_feed_view_models_organization_feed_view_model/OrganizationFeedViewModel/addNewPost.md)][([[[Post](../models_post_post_model/Post-class.md)] newPost]) → void ]
:   This function adds new Post.

[[buildNewPosts](../view_model_after_auth_view_models_feed_view_models_organization_feed_view_model/OrganizationFeedViewModel/buildNewPosts.md)][([[[List](https://api.flutter.dev/flutter/dart-core/List-class.md)[\<[[Post](../models_post_post_model/Post-class.md)]\>]] newPosts]) → void ]
:   This function initialise `_posts` with `newPosts`.

[dispose](../view_model_after_auth_view_models_feed_view_models_organization_feed_view_model/OrganizationFeedViewModel/dispose.md) [→ void ]
:   Discards any resources used by the object. After this is called, the
    object is not in a usable state and should be discarded (calls to
    [addListener](https://api.flutter.dev/flutter/foundation/ChangeNotifier/addListener.md)
    will throw after the object is disposed).
    ::: features
    override
    :::

[fetchNewPosts](../view_model_after_auth_view_models_feed_view_models_organization_feed_view_model/OrganizationFeedViewModel/fetchNewPosts.md) [→ void ]
:   This function fetches new posts in the organization.

[[initialise](../view_model_after_auth_view_models_feed_view_models_organization_feed_view_model/OrganizationFeedViewModel/initialise.md)][({[[[bool](https://api.flutter.dev/flutter/dart-core/bool-class.md)] isTest = false]}) → void ]
:   To initialize the view model.

[[navigateToIndividualPage](../view_model_after_auth_view_models_feed_view_models_organization_feed_view_model/OrganizationFeedViewModel/navigateToIndividualPage.md)][([[[Post](../models_post_post_model/Post-class.md)] post]) → void ]
:   This function navigate to individual post page..

[navigateToPinnedPostPage](../view_model_after_auth_view_models_feed_view_models_organization_feed_view_model/OrganizationFeedViewModel/navigateToPinnedPostPage.md) [→ void ]
:   This function navigate to pinned post page.

[nextPage](../view_model_after_auth_view_models_feed_view_models_organization_feed_view_model/OrganizationFeedViewModel/nextPage.md) [→ void ]
:   Method to fetch next posts.

[[noSuchMethod](https://api.flutter.dev/flutter/dart-core/Object/noSuchMethod.html)][([[[Invocation](https://api.flutter.dev/flutter/dart-core/Invocation-class.md)] invocation]) → dynamic ]
:   Invoked when a nonexistent method or property is accessed.
    ::: features
    inherited
    :::

[notifyListeners](https://api.flutter.dev/flutter/foundation/ChangeNotifier/notifyListeners.html) [→ void ]
:   Call all the registered listeners.
    ::: features
    inherited
    :::

[previousPage](../view_model_after_auth_view_models_feed_view_models_organization_feed_view_model/OrganizationFeedViewModel/previousPage.md) [→ void ]
:   Method to fetch previous posts.

[[removeListener](https://api.flutter.dev/flutter/foundation/ChangeNotifier/removeListener.html)][([[[VoidCallback](https://api.flutter.dev/flutter/dart-ui/VoidCallback.md)] listener]) → void ]
:   Remove a previously registered closure from the list of closures
    that are notified when the object changes.
    ::: features
    inherited
    :::

[[removePost](../view_model_after_auth_view_models_feed_view_models_organization_feed_view_model/OrganizationFeedViewModel/removePost.md)][([[[Post](../models_post_post_model/Post-class.md)] post]) [→ [Future](https://api.flutter.dev/flutter/dart-core/Future-class.html)\<[void\>]] ]
:   function to remove the post.

[[setCurrentOrganizationName](../view_model_after_auth_view_models_feed_view_models_organization_feed_view_model/OrganizationFeedViewModel/setCurrentOrganizationName.md)][([[[String](https://api.flutter.dev/flutter/dart-core/String-class.md)] updatedOrganization]) → void ]
:   This function sets the organization name after update.

[[setState](../view_model_base_view_model/BaseModel/setState.md)][([[[ViewState](../enums_enums/ViewState.md)] viewState]) → void ]

:   ::: features
    inherited
    :::

[[toString](https://api.flutter.dev/flutter/dart-core/Object/toString.html)][() [→ [String](https://api.flutter.dev/flutter/dart-core/String-class.html)] ]
:   A string representation of this object.
    ::: features
    inherited
    :::

[[updatedPost](../view_model_after_auth_view_models_feed_view_models_organization_feed_view_model/OrganizationFeedViewModel/updatedPost.md)][([[[Post](../models_post_post_model/Post-class.md)] post]) → void ]
:   This function updates the post.



## Operators

[[operator ==](https://api.flutter.dev/flutter/dart-core/Object/operator_equals.html)][([[[Object](https://api.flutter.dev/flutter/dart-core/Object-class.md)] other]) [→ [bool](https://api.flutter.dev/flutter/dart-core/bool-class.html)] ]
:   The equality operator.
    ::: features
    inherited
    :::







1.  [talawa](../index.md)
2.  [organization_feed_view_model](../view_model_after_auth_view_models_feed_view_models_organization_feed_view_model/)
3.  OrganizationFeedViewModel class

##### organization_feed_view_model library







