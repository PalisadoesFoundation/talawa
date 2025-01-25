




likedUserCircleAvatar function - individual\_post library - Dart API







menu

1. [talawa](../index.html)
2. [views/after\_auth\_screens/feed/individual\_post.dart](../file-___home_harshil_Desktop_open-source_palisadoes_talawa_lib_views_after_auth_screens_feed_individual_post/)
3. likedUserCircleAvatar function

likedUserCircleAvatar


dark\_mode

light\_mode




# likedUserCircleAvatar function


dynamic
likedUserCircleAvatar(

1. dynamic user

)

Generates a Circle Avatar representing a user who liked the post.

**params**:

* `user`: The user who liked the post, represented by the `LikedBy` class.

**returns**:

* `Widget`: Circle Avatar of the user who liked the post.

## Implementation

```
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

 


1. [talawa](../index.html)
2. [individual\_post](../file-___home_harshil_Desktop_open-source_palisadoes_talawa_lib_views_after_auth_screens_feed_individual_post/)
3. likedUserCircleAvatar function

##### individual\_post library





talawa
1.0.0+1






