




build method - DirectChats class - direct\_chats library - Dart API







menu

1. [talawa](../../index.html)
2. [views/after\_auth\_screens/chat/direct\_chats.dart](../../file-___home_harshil_Desktop_open-source_palisadoes_talawa_lib_views_after_auth_screens_chat_direct_chats/)
3. [DirectChats](../../file-___home_harshil_Desktop_open-source_palisadoes_talawa_lib_views_after_auth_screens_chat_direct_chats/DirectChats-class.html)
4. build method

build


dark\_mode

light\_mode




# build method


1. @[override](https://api.flutter.dev/flutter/dart-core/override-constant.html)

dynamic
build(

1. dynamic context

)

## Implementation

```
@override
Widget build(BuildContext context) {
  return BaseView<DirectChatViewModel>(
    onModelReady: (model) => model.initialise(),
    builder: (context, model, child) {
      return ListView.builder(
        // key: model.listKey,
        itemCount: model.chats.length,
        itemBuilder: (context, index) {
          return ChatTile(
            chat: model.chats[index],
            model: model,
          );
        },
      );
    },
  );
}
```

 


1. [talawa](../../index.html)
2. [direct\_chats](../../file-___home_harshil_Desktop_open-source_palisadoes_talawa_lib_views_after_auth_screens_chat_direct_chats/)
3. [DirectChats](../../file-___home_harshil_Desktop_open-source_palisadoes_talawa_lib_views_after_auth_screens_chat_direct_chats/DirectChats-class.html)
4. build method

##### DirectChats class





talawa
1.0.0+1






