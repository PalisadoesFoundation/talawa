


# OrganizationFeedViewModel class









<p>OrganizationFeedViewModel class helps to interact with model to serve data to view for organization feed section.</p>
<p>Methods include:</p>
<ul>
<li><code>setCurrentOrganizationName</code> : to set current organization name.</li>
<li><code>fetchNewPosts</code> : to fetch new posts in the organization.</li>
<li><code>navigateToIndividualPage</code> : to navigate to individual page.</li>
<li><code>navigateToPinnedPostPage</code> : to navigate to pinned post page.</li>
<li><code>addNewPost</code> : to add new post in the organization.</li>
<li><code>updatedPost</code> : to update a post in the organization.</li>
</ul>



**Inheritance**

- [Object](https://api.flutter.dev/flutter/dart-core/Object-class.html)
- [ChangeNotifier](https://api.flutter.dev/flutter/foundation/ChangeNotifier-class.html)
- [BaseModel](../view_model_base_view_model/BaseModel-class.md)
- OrganizationFeedViewModel








## Constructors

[OrganizationFeedViewModel](../view_model_after_auth_view_models_feed_view_models_organization_feed_view_model/OrganizationFeedViewModel/OrganizationFeedViewModel.md) ()

   


## Properties

##### [currentOrgName](../view_model_after_auth_view_models_feed_view_models_organization_feed_view_model/OrganizationFeedViewModel/currentOrgName.md) &#8594; [String](https://api.flutter.dev/flutter/dart-core/String-class.html)



  
_<span class="feature">read-only</span>_



##### [hashCode](https://api.flutter.dev/flutter/dart-core/Object/hashCode.html) &#8594; [int](https://api.flutter.dev/flutter/dart-core/int-class.html)



The hash code for this object.  
_<span class="feature">read-only</span><span class="feature">inherited</span>_



##### [hasListeners](https://api.flutter.dev/flutter/foundation/ChangeNotifier/hasListeners.html) &#8594; [bool](https://api.flutter.dev/flutter/dart-core/bool-class.html)



Whether any listeners are currently registered.  
_<span class="feature">read-only</span><span class="feature">inherited</span>_



##### [isBusy](../view_model_base_view_model/BaseModel/isBusy.md) &#8594; [bool](https://api.flutter.dev/flutter/dart-core/bool-class.html)



  
_<span class="feature">read-only</span><span class="feature">inherited</span>_



##### [istest](../view_model_after_auth_view_models_feed_view_models_organization_feed_view_model/OrganizationFeedViewModel/istest.md) &#8596; [bool](https://api.flutter.dev/flutter/dart-core/bool-class.html)



  
_<span class="feature">read / write</span>_



##### [pinnedPosts](../view_model_after_auth_view_models_feed_view_models_organization_feed_view_model/OrganizationFeedViewModel/pinnedPosts.md) &#8594; [List](https://api.flutter.dev/flutter/dart-core/List-class.html)&lt;[Post](../models_post_post_model/Post-class.md)>



  
_<span class="feature">read-only</span>_



##### [posts](../view_model_after_auth_view_models_feed_view_models_organization_feed_view_model/OrganizationFeedViewModel/posts.md) &#8594; [List](https://api.flutter.dev/flutter/dart-core/List-class.html)&lt;[Post](../models_post_post_model/Post-class.md)>



  
_<span class="feature">read-only</span>_



##### [runtimeType](https://api.flutter.dev/flutter/dart-core/Object/runtimeType.html) &#8594; [Type](https://api.flutter.dev/flutter/dart-core/Type-class.html)



A representation of the runtime type of the object.  
_<span class="feature">read-only</span><span class="feature">inherited</span>_



##### [state](../view_model_base_view_model/BaseModel/state.md) &#8594; [ViewState](../enums_enums/ViewState.md)



  
_<span class="feature">read-only</span><span class="feature">inherited</span>_





## Methods

##### [addListener](https://api.flutter.dev/flutter/foundation/ChangeNotifier/addListener.html)([VoidCallback](https://api.flutter.dev/flutter/dart-ui/VoidCallback.html) listener) void



Register a closure to be called when the object changes.  
_<span class="feature">inherited</span>_



##### [addNewPost](../view_model_after_auth_view_models_feed_view_models_organization_feed_view_model/OrganizationFeedViewModel/addNewPost.md)([Post](../models_post_post_model/Post-class.md) newPost) void



This function adds new Post.  




##### [buildNewPosts](../view_model_after_auth_view_models_feed_view_models_organization_feed_view_model/OrganizationFeedViewModel/buildNewPosts.md)([List](https://api.flutter.dev/flutter/dart-core/List-class.html)&lt;[Post](../models_post_post_model/Post-class.md)> newPosts) void



This function initialise <code>_posts</code> with <code>newPosts</code>.  




##### [dispose](../view_model_after_auth_view_models_feed_view_models_organization_feed_view_model/OrganizationFeedViewModel/dispose.md)() void



Discards any resources used by the object. After this is called, the
object is not in a usable state and should be discarded (calls to
<a href="https://api.flutter.dev/flutter/foundation/ChangeNotifier/addListener.html">addListener</a> will throw after the object is disposed).  
_<span class="feature">override</span>_



##### [fetchNewPosts](../view_model_after_auth_view_models_feed_view_models_organization_feed_view_model/OrganizationFeedViewModel/fetchNewPosts.md)() void



This function fetches new posts in the organization.  




##### [initialise](../view_model_after_auth_view_models_feed_view_models_organization_feed_view_model/OrganizationFeedViewModel/initialise.md)({[bool](https://api.flutter.dev/flutter/dart-core/bool-class.html) isTest = false}) void



  




##### [initializeWithDemoData](../view_model_after_auth_view_models_feed_view_models_organization_feed_view_model/OrganizationFeedViewModel/initializeWithDemoData.md)() void



  




##### [navigateToIndividualPage](../view_model_after_auth_view_models_feed_view_models_organization_feed_view_model/OrganizationFeedViewModel/navigateToIndividualPage.md)([Post](../models_post_post_model/Post-class.md) post) void



This function navigate to individual post page.  




##### [navigateToPinnedPostPage](../view_model_after_auth_view_models_feed_view_models_organization_feed_view_model/OrganizationFeedViewModel/navigateToPinnedPostPage.md)() void



This function navigate to pinned post page.  




##### [noSuchMethod](https://api.flutter.dev/flutter/dart-core/Object/noSuchMethod.html)([Invocation](https://api.flutter.dev/flutter/dart-core/Invocation-class.html) invocation) dynamic



Invoked when a non-existent method or property is accessed.  
_<span class="feature">inherited</span>_



##### [notifyListeners](https://api.flutter.dev/flutter/foundation/ChangeNotifier/notifyListeners.html)() void



Call all the registered listeners.  
_<span class="feature">inherited</span>_



##### [removeListener](https://api.flutter.dev/flutter/foundation/ChangeNotifier/removeListener.html)([VoidCallback](https://api.flutter.dev/flutter/dart-ui/VoidCallback.html) listener) void



Remove a previously registered closure from the list of closures that are
notified when the object changes.  
_<span class="feature">inherited</span>_



##### [setCurrentOrganizationName](../view_model_after_auth_view_models_feed_view_models_organization_feed_view_model/OrganizationFeedViewModel/setCurrentOrganizationName.md)([String](https://api.flutter.dev/flutter/dart-core/String-class.html) updatedOrganization) void



This function sets the organization name after update.  




##### [setState](../view_model_base_view_model/BaseModel/setState.md)([ViewState](../enums_enums/ViewState.md) viewState) void



  
_<span class="feature">inherited</span>_



##### [toString](https://api.flutter.dev/flutter/dart-core/Object/toString.html)() [String](https://api.flutter.dev/flutter/dart-core/String-class.html)



A string representation of this object.  
_<span class="feature">inherited</span>_



##### [updatedPost](../view_model_after_auth_view_models_feed_view_models_organization_feed_view_model/OrganizationFeedViewModel/updatedPost.md)([Post](../models_post_post_model/Post-class.md) post) void



This function updates the post.  






## Operators

##### [operator ==](https://api.flutter.dev/flutter/dart-core/Object/operator_equals.html)([Object](https://api.flutter.dev/flutter/dart-core/Object-class.html) other) [bool](https://api.flutter.dev/flutter/dart-core/bool-class.html)



The equality operator.  
_<span class="feature">inherited</span>_















