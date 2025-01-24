




iconButton function - invite\_child library - Dart API







menu

1. [talawa](../index.html)
2. [widgets/invite\_child.dart](../widgets_invite_child/widgets_invite_child-library.html)
3. iconButton function

iconButton


dark\_mode

light\_mode




# iconButton function


[Widget](https://api.flutter.dev/flutter/widgets/Widget-class.html)
iconButton(

1. String key,
2. [Widget](https://api.flutter.dev/flutter/widgets/Widget-class.html) icon,
3. void onTap()

)

It prints "tapped" in the console for the developer to know that the button was tapped.

**params**:

* `key`: Key of the Widget
* `icon`: Icon to be displayed
* `onTap`: on tap function

**returns**:

* `Widget`: returns IconButton.

## Implementation

```
Widget iconButton(String key, Widget icon, void Function() onTap) {
  return Stack(
    children: [
      IconButton(
        key: Key(key),
        onPressed: () {
          print('tapped');
          onTap();
        },
        icon: icon,
      ),
    ],
  );
}
```

 


1. [talawa](../index.html)
2. [invite\_child](../widgets_invite_child/widgets_invite_child-library.html)
3. iconButton function

##### invite\_child library





talawa
1.0.0+1






