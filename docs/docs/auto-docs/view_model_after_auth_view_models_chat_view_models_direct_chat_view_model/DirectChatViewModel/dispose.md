




dispose method - DirectChatViewModel class - direct\_chat\_view\_model library - Dart API







menu

1. [talawa](../../index.html)
2. [view\_model/after\_auth\_view\_models/chat\_view\_models/direct\_chat\_view\_model.dart](../../view_model_after_auth_view_models_chat_view_models_direct_chat_view_model/view_model_after_auth_view_models_chat_view_models_direct_chat_view_model-library.html)
3. [DirectChatViewModel](../../view_model_after_auth_view_models_chat_view_models_direct_chat_view_model/DirectChatViewModel-class.html)
4. dispose method

dispose


dark\_mode

light\_mode




# dispose method


1. @override

void
dispose()
override

Discards any resources used by the object. After this is called, the
object is not in a usable state and should be discarded (calls to
[addListener](https://api.flutter.dev/flutter/foundation/ChangeNotifier/addListener.html) will throw after the object is disposed).

This method should only be called by the object's owner.

This method does not notify listeners, and clears the listener list once
it is called. Consumers of this class must decide on whether to notify
listeners or not immediately before disposal.


## Implementation

```
@override
void dispose() {
  _chatMessageSubscription?.cancel();
  _chatListSubscription.cancel();
  super.dispose();
}
```

 


1. [talawa](../../index.html)
2. [direct\_chat\_view\_model](../../view_model_after_auth_view_models_chat_view_models_direct_chat_view_model/view_model_after_auth_view_models_chat_view_models_direct_chat_view_model-library.html)
3. [DirectChatViewModel](../../view_model_after_auth_view_models_chat_view_models_direct_chat_view_model/DirectChatViewModel-class.html)
4. dispose method

##### DirectChatViewModel class





talawa
1.0.0+1






