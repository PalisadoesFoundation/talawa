




createState method - ChatInputField class - chat\_input\_field library - Dart API







menu

1. [talawa](../../index.html)
2. [views/after\_auth\_screens/chat/widgets/chat\_input\_field.dart](../../views_after_auth_screens_chat_widgets_chat_input_field/views_after_auth_screens_chat_widgets_chat_input_field-library.html)
3. [ChatInputField](../../views_after_auth_screens_chat_widgets_chat_input_field/ChatInputField-class.html)
4. createState method

createState


dark\_mode

light\_mode




# createState method


1. @override

[State](https://api.flutter.dev/flutter/widgets/State-class.html)<[ChatInputField](../../views_after_auth_screens_chat_widgets_chat_input_field/ChatInputField-class.html)>
createState()
override

Creates the mutable state for this widget at a given location in the tree.

Subclasses should override this method to return a newly created
instance of their associated [State](https://api.flutter.dev/flutter/widgets/State-class.html) subclass:

```
@override
State<SomeWidget> createState() => _SomeWidgetState();

```

The framework can call this method multiple times over the lifetime of
a [StatefulWidget](https://api.flutter.dev/flutter/widgets/StatefulWidget-class.html). For example, if the widget is inserted into the tree
in multiple locations, the framework will create a separate [State](https://api.flutter.dev/flutter/widgets/State-class.html) object
for each location. Similarly, if the widget is removed from the tree and
later inserted into the tree again, the framework will call [createState](../../views_after_auth_screens_chat_widgets_chat_input_field/ChatInputField/createState.html)
again to create a fresh [State](https://api.flutter.dev/flutter/widgets/State-class.html) object, simplifying the lifecycle of
[State](https://api.flutter.dev/flutter/widgets/State-class.html) objects.


## Implementation

```
@override
State<ChatInputField> createState() => _ChatInputFieldState();
```

 


1. [talawa](../../index.html)
2. [chat\_input\_field](../../views_after_auth_screens_chat_widgets_chat_input_field/views_after_auth_screens_chat_widgets_chat_input_field-library.html)
3. [ChatInputField](../../views_after_auth_screens_chat_widgets_chat_input_field/ChatInputField-class.html)
4. createState method

##### ChatInputField class





talawa
1.0.0+1






