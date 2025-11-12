



menu

1.  [talawa](../../index.md)
2.  [views/after_auth_screens/chat/widgets/group_chat_app_bar.dart](../../views_after_auth_screens_chat_widgets_group_chat_app_bar/)
3.  [GroupChatAppBar](../../views_after_auth_screens_chat_widgets_group_chat_app_bar/GroupChatAppBar-class.md)
4.  preferredSize property


preferredSize


 dark_mode   light_mode 




<div>

# preferredSize property

</div>



<div>

1.  @[override](https://api.flutter.dev/flutter/dart-core/override-constant.html)

</div>

[[Size](https://api.flutter.dev/flutter/dart-ui/Size-class.html)]
get preferredSize


override




The size this widget would prefer if it were otherwise unconstrained.

In many cases it\'s only necessary to define one preferred dimension.
For example the
[Scaffold](https://api.flutter.dev/flutter/material/Scaffold-class.html)
only depends on its app bar\'s preferred height. In that case
implementations of this method can just return
`Size.fromHeight(myAppBarHeight)`.



## Implementation

``` language-dart
@override
Size get preferredSize => const Size.fromHeight(kToolbarHeight);
```








1.  [talawa](../../index.md)
2.  [group_chat_app_bar](../../views_after_auth_screens_chat_widgets_group_chat_app_bar/)
3.  [GroupChatAppBar](../../views_after_auth_screens_chat_widgets_group_chat_app_bar/GroupChatAppBar-class.md)
4.  preferredSize property

##### GroupChatAppBar class









 talawa 1.0.0+1 
