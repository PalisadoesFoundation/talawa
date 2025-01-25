




PostService class - post\_service library - Dart API







menu

1. [talawa](../index.html)
2. [services/post\_service.dart](../file-___home_harshil_Desktop_open-source_palisadoes_talawa_lib_services_post_service/)
3. PostService class

PostService


dark\_mode

light\_mode




# PostService class


PostService class provides functions in the context of a Post.

Services include:

* `getPosts` : to get all posts of the organization.
* `addLike` : to add like to the post.
* `removeLike` : to remove the like from the post.

## Constructors

[PostService](../file-___home_harshil_Desktop_open-source_palisadoes_talawa_lib_services_post_service/PostService/PostService.html)()




## Properties

[after](../file-___home_harshil_Desktop_open-source_palisadoes_talawa_lib_services_post_service/PostService/after.html)
↔ [String](https://api.flutter.dev/flutter/dart-core/String-class.html)?

getter/setter pair

[before](../file-___home_harshil_Desktop_open-source_palisadoes_talawa_lib_services_post_service/PostService/before.html)
↔ [String](https://api.flutter.dev/flutter/dart-core/String-class.html)?

getter/setter pair

[first](../file-___home_harshil_Desktop_open-source_palisadoes_talawa_lib_services_post_service/PostService/first.html)
↔ [int](https://api.flutter.dev/flutter/dart-core/int-class.html)?

getter/setter pair

[hashCode](https://api.flutter.dev/flutter/dart-core/Object/hashCode.html)
→ [int](https://api.flutter.dev/flutter/dart-core/int-class.html)

The hash code for this object.
no setterinherited

[last](../file-___home_harshil_Desktop_open-source_palisadoes_talawa_lib_services_post_service/PostService/last.html)
↔ [int](https://api.flutter.dev/flutter/dart-core/int-class.html)?

getter/setter pair

[postInfo](../file-___home_harshil_Desktop_open-source_palisadoes_talawa_lib_services_post_service/PostService/postInfo.html)
↔ [Map](https://api.flutter.dev/flutter/dart-core/Map-class.html)<[String](https://api.flutter.dev/flutter/dart-core/String-class.html), dynamic>?

getter/setter pair

[postStream](../file-___home_harshil_Desktop_open-source_palisadoes_talawa_lib_services_post_service/PostService/postStream.html)
→ [Stream](https://api.flutter.dev/flutter/dart-core/Stream-class.html)<[List](https://api.flutter.dev/flutter/dart-core/List-class.html)>

Getter for Stream of posts.
no setter

[runtimeType](https://api.flutter.dev/flutter/dart-core/Object/runtimeType.html)
→ [Type](https://api.flutter.dev/flutter/dart-core/Type-class.html)

A representation of the runtime type of the object.
no setterinherited

[updatedPostStream](../file-___home_harshil_Desktop_open-source_palisadoes_talawa_lib_services_post_service/PostService/updatedPostStream.html)
→ [Stream](https://api.flutter.dev/flutter/dart-core/Stream-class.html)

Getter for Stream of update in any post.
no setter



## Methods

[addCommentLocally](../file-___home_harshil_Desktop_open-source_palisadoes_talawa_lib_services_post_service/PostService/addCommentLocally.html)([String](https://api.flutter.dev/flutter/dart-core/String-class.html) postID)
→ void


Method to add comment of a user and update comments using updated Post Stream.

[addLike](../file-___home_harshil_Desktop_open-source_palisadoes_talawa_lib_services_post_service/PostService/addLike.html)([String](https://api.flutter.dev/flutter/dart-core/String-class.html) postID)
→ [Future](https://api.flutter.dev/flutter/dart-core/Future-class.html)<[bool](https://api.flutter.dev/flutter/dart-core/bool-class.html)>


Method to add like on a Post.

[addNewpost](../file-___home_harshil_Desktop_open-source_palisadoes_talawa_lib_services_post_service/PostService/addNewpost.html)(dynamic newPost)
→ void


Method to add newly created post at the very top of the feed.

[deletePost](../file-___home_harshil_Desktop_open-source_palisadoes_talawa_lib_services_post_service/PostService/deletePost.html)(dynamic post)
→ [Future](https://api.flutter.dev/flutter/dart-core/Future-class.html)



[fetchDataFromApi](../file-___home_harshil_Desktop_open-source_palisadoes_talawa_lib_services_post_service/PostService/fetchDataFromApi.html)()
→ [Future](https://api.flutter.dev/flutter/dart-core/Future-class.html)<[List](https://api.flutter.dev/flutter/dart-core/List-class.html)>



[fetchPostsInitial](../file-___home_harshil_Desktop_open-source_palisadoes_talawa_lib_services_post_service/PostService/fetchPostsInitial.html)()
→ [Future](https://api.flutter.dev/flutter/dart-core/Future-class.html)<void>



[getPosts](../file-___home_harshil_Desktop_open-source_palisadoes_talawa_lib_services_post_service/PostService/getPosts.html)()
→ [Future](https://api.flutter.dev/flutter/dart-core/Future-class.html)<void>


Method used to fetch all posts of the current organisation.

[nextPage](../file-___home_harshil_Desktop_open-source_palisadoes_talawa_lib_services_post_service/PostService/nextPage.html)()
→ [Future](https://api.flutter.dev/flutter/dart-core/Future-class.html)<void>


Method to handle pagination by fetching next page of posts.

[noSuchMethod](https://api.flutter.dev/flutter/dart-core/Object/noSuchMethod.html)([Invocation](https://api.flutter.dev/flutter/dart-core/Invocation-class.html) invocation)
→ dynamic


Invoked when a nonexistent method or property is accessed.
inherited

[previousPage](../file-___home_harshil_Desktop_open-source_palisadoes_talawa_lib_services_post_service/PostService/previousPage.html)()
→ [Future](https://api.flutter.dev/flutter/dart-core/Future-class.html)<void>


Method to handle pagination by fetching previous page of posts.

[refreshFeed](../file-___home_harshil_Desktop_open-source_palisadoes_talawa_lib_services_post_service/PostService/refreshFeed.html)()
→ [Future](https://api.flutter.dev/flutter/dart-core/Future-class.html)<void>


Method to refresh feed of current selected organisation.

[removeLike](../file-___home_harshil_Desktop_open-source_palisadoes_talawa_lib_services_post_service/PostService/removeLike.html)([String](https://api.flutter.dev/flutter/dart-core/String-class.html) postID)
→ [Future](https://api.flutter.dev/flutter/dart-core/Future-class.html)<[bool](https://api.flutter.dev/flutter/dart-core/bool-class.html)>


Method to remove like in a Post.

[setOrgStreamSubscription](../file-___home_harshil_Desktop_open-source_palisadoes_talawa_lib_services_post_service/PostService/setOrgStreamSubscription.html)()
→ void


This method sets up a stream that constantly listens to change in current org.

[toString](https://api.flutter.dev/flutter/dart-core/Object/toString.html)()
→ [String](https://api.flutter.dev/flutter/dart-core/String-class.html)


A string representation of this object.
inherited



## Operators

[operator ==](https://api.flutter.dev/flutter/dart-core/Object/operator_equals.html)([Object](https://api.flutter.dev/flutter/dart-core/Object-class.html) other)
→ [bool](https://api.flutter.dev/flutter/dart-core/bool-class.html)


The equality operator.
inherited



 


1. [talawa](../index.html)
2. [post\_service](../file-___home_harshil_Desktop_open-source_palisadoes_talawa_lib_services_post_service/)
3. PostService class

##### post\_service library





talawa
1.0.0+1






