
<div>

# iconButton function

</div>


[[Widget](https://api.flutter.dev/flutter/widgets/Widget-class.html)]
iconButton(

1.  [[[String](https://api.flutter.dev/flutter/dart-core/String-class.html)]
    key, ]
2.  [[[Widget](https://api.flutter.dev/flutter/widgets/Widget-class.html)]
    icon, ]
3.  [void
    ]

)



It prints \"tapped\" in the console for the developer to know that the
button was tapped.

**params**:

-   `key`: Key of the Widget
-   `icon`: Icon to be displayed
-   `onTap`: on tap function

**returns**:

-   `Widget`: returns IconButton.



## Implementation

``` language-dart
Widget iconButton(String key, Widget icon, void  onTap) {
  return Stack(
    children: [
      IconButton(
        key: Key(key),
        onPressed: () {
          print('tapped');
          ;
        },
        icon: icon,
      ),
    ],
  );
}
```







1.  [talawa](../index.html)
2.  [invite_child](../widgets_invite_child/)
3.  iconButton function

##### invite_child library







