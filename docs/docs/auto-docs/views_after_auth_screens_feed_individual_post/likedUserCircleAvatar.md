
<div>

# likedUserCircleAvatar function

</div>


[[Widget](https://api.flutter.dev/flutter/widgets/Widget-class.html)]
likedUserCircleAvatar(

1.  [[[LikedBy](../models_post_post_model/LikedBy-class.md)]
    user]

)



Generates a Circle Avatar representing a user who liked the post.

**params**:

-   `user`: The user who liked the post, represented by the `LikedBy`
    class.

**returns**:

-   `Widget`: Circle Avatar of the user who liked the post.



## Implementation

``` language-dart
Widget likedUserCircleAvatar(LikedBy user) {
  return const Padding(
    padding: EdgeInsets.only(right: 10.0, bottom: 16.0),
    child: Stack(
      clipBehavior: Clip.none,
      alignment: Alignment.center,
      children: [
        CircleAvatar(
          backgroundColor: Color(0xfff2f2f2),
          radius: 20,
        ),
        Positioned(
          top: 30,
          right: 0,
          bottom: 20,
          left: 20,
          child: Icon(
            Icons.thumb_up,
            color: Colors.blue,
            size: 20,
          ),
        ),
      ],
    ),
  );
}
```







1.  [talawa](../index.md)
2.  [individual_post](../views_after_auth_screens_feed_individual_post/)
3.  likedUserCircleAvatar function

##### individual_post library







