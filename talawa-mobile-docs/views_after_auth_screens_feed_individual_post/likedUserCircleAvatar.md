


# likedUserCircleAvatar function










[Widget](https://api.flutter.dev/flutter/widgets/Widget-class.html) likedUserCircleAvatar
([LikedBy](../models_post_post_model/LikedBy-class.md) user)





<p>likedUserCircleAvatar returns a widget of the individual user liked the post.</p>



## Implementation

```dart
Widget likedUserCircleAvatar(LikedBy user) {
  return Padding(
    padding: const EdgeInsets.only(right: 10.0, bottom: 16.0),
    child: Stack(
      clipBehavior: Clip.none,
      alignment: Alignment.center,
      children: [
        const CircleAvatar(
          backgroundColor: Color(0xfff2f2f2),
          radius: 20,
        ),
        const Positioned(
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







