:::::::::: {#dartdoc-main-content .main-content above-sidebar="view_model_after_auth_view_models_feed_view_models_organization_feed_view_model/view_model_after_auth_view_models_feed_view_models_organization_feed_view_model-library-sidebar.html" below-sidebar="view_model_after_auth_view_models_feed_view_models_organization_feed_view_model/OrganizationFeedViewModel-class-sidebar.html"}
<div>

# [OrganizationFeedViewModel]{.kind-class} class

</div>

::: {.section .desc .markdown}
OrganizationFeedViewModel class helps to interact with model to serve
data to view for organization feed section.

Methods include:

-   `setCurrentOrganizationName` : to set current organization name.
-   `fetchNewPosts` : to fetch new posts in the organization.
-   `navigateToIndividualPage` : to navigate to individual page.
-   `navigateToPinnedPostPage` : to navigate to pinned post page.
-   `addNewPost` : to add new post in the organization.
-   `updatedPost` : to update a post in the organization.
:::

::: section

Inheritance

:   -   [Object](https://api.flutter.dev/flutter/dart-core/Object-class.html)
    -   [ChangeNotifier](https://api.flutter.dev/flutter/foundation/ChangeNotifier-class.html)
    -   [BaseModel](../view_model_base_view_model/BaseModel-class.html)
    -   OrganizationFeedViewModel
:::

::: {#constructors .section .summary .offset-anchor}
## Constructors

[[OrganizationFeedViewModel](../view_model_after_auth_view_models_feed_view_models_organization_feed_view_model/OrganizationFeedViewModel/OrganizationFeedViewModel.html)]{.name}[()]{.signature}

:   
:::

::: {#instance-properties .section .summary .offset-anchor}
## Properties

[[currentOrgName](../view_model_after_auth_view_models_feed_view_models_organization_feed_view_model/OrganizationFeedViewModel/currentOrgName.html)]{.name} [→ [String](https://api.flutter.dev/flutter/dart-core/String-class.html)]{.signature}
:   getter for the currentOrgName.
    ::: features
    [no setter]{.feature}
    :::

[[hashCode](https://api.flutter.dev/flutter/dart-core/Object/hashCode.html)]{.name} [→ [int](https://api.flutter.dev/flutter/dart-core/int-class.html)]{.signature}
:   The hash code for this object.
    ::: features
    [no setter]{.feature}[inherited]{.feature}
    :::

[[hasListeners](https://api.flutter.dev/flutter/foundation/ChangeNotifier/hasListeners.html)]{.name} [→ [bool](https://api.flutter.dev/flutter/dart-core/bool-class.html)]{.signature}
:   Whether any listeners are currently registered.
    ::: features
    [no setter]{.feature}[inherited]{.feature}
    :::

[[isBusy](../view_model_base_view_model/BaseModel/isBusy.html)]{.name} [→ [bool](https://api.flutter.dev/flutter/dart-core/bool-class.html)]{.signature}

:   ::: features
    [no setter]{.feature}[inherited]{.feature}
    :::

[[isFetchingPosts](../view_model_after_auth_view_models_feed_view_models_organization_feed_view_model/OrganizationFeedViewModel/isFetchingPosts.html)]{.name} [→ [bool](https://api.flutter.dev/flutter/dart-core/bool-class.html)]{.signature}
:   getter for isFetchingPosts to show loading indicator.
    ::: features
    [no setter]{.feature}
    :::

[[istest](../view_model_after_auth_view_models_feed_view_models_organization_feed_view_model/OrganizationFeedViewModel/istest.html)]{.name} [↔ [bool](https://api.flutter.dev/flutter/dart-core/bool-class.html)]{.signature}
:   flag for the test.
    ::: features
    [getter/setter pair]{.feature}
    :::

[[pinnedPosts](../view_model_after_auth_view_models_feed_view_models_organization_feed_view_model/OrganizationFeedViewModel/pinnedPosts.html)]{.name} [→ [List](https://api.flutter.dev/flutter/dart-core/List-class.html)[\<[[Post](../models_post_post_model/Post-class.html)]{.type-parameter}\>]{.signature}]{.signature}
:   getter for the pinned post.
    ::: features
    [no setter]{.feature}
    :::

[[posts](../view_model_after_auth_view_models_feed_view_models_organization_feed_view_model/OrganizationFeedViewModel/posts.html)]{.name} [→ [List](https://api.flutter.dev/flutter/dart-core/List-class.html)[\<[[Post](../models_post_post_model/Post-class.html)]{.type-parameter}\>]{.signature}]{.signature}
:   getter for the posts.
    ::: features
    [no setter]{.feature}
    :::

[[runtimeType](https://api.flutter.dev/flutter/dart-core/Object/runtimeType.html)]{.name} [→ [Type](https://api.flutter.dev/flutter/dart-core/Type-class.html)]{.signature}
:   A representation of the runtime type of the object.
    ::: features
    [no setter]{.feature}[inherited]{.feature}
    :::

[[state](../view_model_base_view_model/BaseModel/state.html)]{.name} [→ [ViewState](../enums_enums/ViewState.html)]{.signature}

:   ::: features
    [no setter]{.feature}[inherited]{.feature}
    :::

[[userPosts](../view_model_after_auth_view_models_feed_view_models_organization_feed_view_model/OrganizationFeedViewModel/userPosts.html)]{.name} [→ [List](https://api.flutter.dev/flutter/dart-core/List-class.html)[\<[[Post](../models_post_post_model/Post-class.html)]{.type-parameter}\>]{.signature}]{.signature}
:   Getter for User Posts.
    ::: features
    [no setter]{.feature}
    :::
:::

::: {#instance-methods .section .summary .offset-anchor}
## Methods

[[addListener](https://api.flutter.dev/flutter/foundation/ChangeNotifier/addListener.html)]{.name}[([[[VoidCallback](https://api.flutter.dev/flutter/dart-ui/VoidCallback.html)]{.type-annotation} [listener]{.parameter-name}]{#addListener-param-listener .parameter}) [→ void]{.returntype .parameter} ]{.signature}
:   Register a closure to be called when the object changes.
    ::: features
    [inherited]{.feature}
    :::

[[addNewPost](../view_model_after_auth_view_models_feed_view_models_organization_feed_view_model/OrganizationFeedViewModel/addNewPost.html)]{.name}[([[[Post](../models_post_post_model/Post-class.html)]{.type-annotation} [newPost]{.parameter-name}]{#addNewPost-param-newPost .parameter}) [→ void]{.returntype .parameter} ]{.signature}
:   This function adds new Post.

[[buildNewPosts](../view_model_after_auth_view_models_feed_view_models_organization_feed_view_model/OrganizationFeedViewModel/buildNewPosts.html)]{.name}[([[[List](https://api.flutter.dev/flutter/dart-core/List-class.html)[\<[[Post](../models_post_post_model/Post-class.html)]{.type-parameter}\>]{.signature}]{.type-annotation} [newPosts]{.parameter-name}]{#buildNewPosts-param-newPosts .parameter}) [→ void]{.returntype .parameter} ]{.signature}
:   This function initialise `_posts` with `newPosts`.

[[dispose](../view_model_after_auth_view_models_feed_view_models_organization_feed_view_model/OrganizationFeedViewModel/dispose.html)]{.name}[() [→ void]{.returntype .parameter} ]{.signature}
:   Discards any resources used by the object. After this is called, the
    object is not in a usable state and should be discarded (calls to
    [addListener](https://api.flutter.dev/flutter/foundation/ChangeNotifier/addListener.html)
    will throw after the object is disposed).
    ::: features
    [override]{.feature}
    :::

[[fetchNewPosts](../view_model_after_auth_view_models_feed_view_models_organization_feed_view_model/OrganizationFeedViewModel/fetchNewPosts.html)]{.name}[() [→ void]{.returntype .parameter} ]{.signature}
:   This function fetches new posts in the organization.

[[initialise](../view_model_after_auth_view_models_feed_view_models_organization_feed_view_model/OrganizationFeedViewModel/initialise.html)]{.name}[({[[[bool](https://api.flutter.dev/flutter/dart-core/bool-class.html)]{.type-annotation} [isTest]{.parameter-name} = [false]{.default-value}]{#initialise-param-isTest .parameter}}) [→ void]{.returntype .parameter} ]{.signature}
:   To initialize the view model.

[[navigateToIndividualPage](../view_model_after_auth_view_models_feed_view_models_organization_feed_view_model/OrganizationFeedViewModel/navigateToIndividualPage.html)]{.name}[([[[Post](../models_post_post_model/Post-class.html)]{.type-annotation} [post]{.parameter-name}]{#navigateToIndividualPage-param-post .parameter}) [→ void]{.returntype .parameter} ]{.signature}
:   This function navigate to individual post page..

[[navigateToPinnedPostPage](../view_model_after_auth_view_models_feed_view_models_organization_feed_view_model/OrganizationFeedViewModel/navigateToPinnedPostPage.html)]{.name}[() [→ void]{.returntype .parameter} ]{.signature}
:   This function navigate to pinned post page.

[[nextPage](../view_model_after_auth_view_models_feed_view_models_organization_feed_view_model/OrganizationFeedViewModel/nextPage.html)]{.name}[() [→ void]{.returntype .parameter} ]{.signature}
:   Method to fetch next posts.

[[noSuchMethod](https://api.flutter.dev/flutter/dart-core/Object/noSuchMethod.html)]{.name}[([[[Invocation](https://api.flutter.dev/flutter/dart-core/Invocation-class.html)]{.type-annotation} [invocation]{.parameter-name}]{#noSuchMethod-param-invocation .parameter}) [→ dynamic]{.returntype .parameter} ]{.signature}
:   Invoked when a nonexistent method or property is accessed.
    ::: features
    [inherited]{.feature}
    :::

[[notifyListeners](https://api.flutter.dev/flutter/foundation/ChangeNotifier/notifyListeners.html)]{.name}[() [→ void]{.returntype .parameter} ]{.signature}
:   Call all the registered listeners.
    ::: features
    [inherited]{.feature}
    :::

[[previousPage](../view_model_after_auth_view_models_feed_view_models_organization_feed_view_model/OrganizationFeedViewModel/previousPage.html)]{.name}[() [→ void]{.returntype .parameter} ]{.signature}
:   Method to fetch previous posts.

[[removeListener](https://api.flutter.dev/flutter/foundation/ChangeNotifier/removeListener.html)]{.name}[([[[VoidCallback](https://api.flutter.dev/flutter/dart-ui/VoidCallback.html)]{.type-annotation} [listener]{.parameter-name}]{#removeListener-param-listener .parameter}) [→ void]{.returntype .parameter} ]{.signature}
:   Remove a previously registered closure from the list of closures
    that are notified when the object changes.
    ::: features
    [inherited]{.feature}
    :::

[[removePost](../view_model_after_auth_view_models_feed_view_models_organization_feed_view_model/OrganizationFeedViewModel/removePost.html)]{.name}[([[[Post](../models_post_post_model/Post-class.html)]{.type-annotation} [post]{.parameter-name}]{#removePost-param-post .parameter}) [→ [Future](https://api.flutter.dev/flutter/dart-core/Future-class.html)[\<[void]{.type-parameter}\>]{.signature}]{.returntype .parameter} ]{.signature}
:   function to remove the post.

[[setCurrentOrganizationName](../view_model_after_auth_view_models_feed_view_models_organization_feed_view_model/OrganizationFeedViewModel/setCurrentOrganizationName.html)]{.name}[([[[String](https://api.flutter.dev/flutter/dart-core/String-class.html)]{.type-annotation} [updatedOrganization]{.parameter-name}]{#setCurrentOrganizationName-param-updatedOrganization .parameter}) [→ void]{.returntype .parameter} ]{.signature}
:   This function sets the organization name after update.

[[setState](../view_model_base_view_model/BaseModel/setState.html)]{.name}[([[[ViewState](../enums_enums/ViewState.html)]{.type-annotation} [viewState]{.parameter-name}]{#setState-param-viewState .parameter}) [→ void]{.returntype .parameter} ]{.signature}

:   ::: features
    [inherited]{.feature}
    :::

[[toString](https://api.flutter.dev/flutter/dart-core/Object/toString.html)]{.name}[() [→ [String](https://api.flutter.dev/flutter/dart-core/String-class.html)]{.returntype .parameter} ]{.signature}
:   A string representation of this object.
    ::: features
    [inherited]{.feature}
    :::

[[updatedPost](../view_model_after_auth_view_models_feed_view_models_organization_feed_view_model/OrganizationFeedViewModel/updatedPost.html)]{.name}[([[[Post](../models_post_post_model/Post-class.html)]{.type-annotation} [post]{.parameter-name}]{#updatedPost-param-post .parameter}) [→ void]{.returntype .parameter} ]{.signature}
:   This function updates the post.
:::

::: {#operators .section .summary .offset-anchor .inherited}
## Operators

[[operator ==](https://api.flutter.dev/flutter/dart-core/Object/operator_equals.html)]{.name}[([[[Object](https://api.flutter.dev/flutter/dart-core/Object-class.html)]{.type-annotation} [other]{.parameter-name}]{#==-param-other .parameter}) [→ [bool](https://api.flutter.dev/flutter/dart-core/bool-class.html)]{.returntype .parameter} ]{.signature}
:   The equality operator.
    ::: features
    [inherited]{.feature}
    :::
:::
::::::::::

::::: {#dartdoc-sidebar-left .sidebar .sidebar-offcanvas-left}
::: {#header-search-sidebar .hidden-l}
:::

1.  [talawa](../index.html)
2.  [organization_feed_view_model](../view_model_after_auth_view_models_feed_view_models_organization_feed_view_model/)
3.  OrganizationFeedViewModel class

##### organization_feed_view_model library

::: {#dartdoc-sidebar-left-content}
:::
:::::

::: {#dartdoc-sidebar-right .sidebar .sidebar-offcanvas-right}
:::
