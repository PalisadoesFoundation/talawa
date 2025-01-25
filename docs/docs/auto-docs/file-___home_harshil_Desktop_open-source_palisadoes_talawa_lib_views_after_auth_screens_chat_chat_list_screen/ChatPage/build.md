




build method - ChatPage class - chat\_list\_screen library - Dart API







menu

1. [talawa](../../index.html)
2. [views/after\_auth\_screens/chat/chat\_list\_screen.dart](../../file-___home_harshil_Desktop_open-source_palisadoes_talawa_lib_views_after_auth_screens_chat_chat_list_screen/)
3. [ChatPage](../../file-___home_harshil_Desktop_open-source_palisadoes_talawa_lib_views_after_auth_screens_chat_chat_list_screen/ChatPage-class.html)
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
  return DefaultTabController(
    length: 1,
    child: Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).primaryColor,
        elevation: 0.0,
        centerTitle: true,
        title: Text(
          "Chats",
          style: Theme.of(context).textTheme.titleLarge!.copyWith(
                fontWeight: FontWeight.w600,
                fontSize: 20,
              ),
        ),
        bottom: const TabBar(
          tabs: [
            Tab(
              text: "Direct",
            ),
          ],
        ),
      ),
      // returns a tabs on the top for current user to switch between DirectChats and EventChats.
      body: const TabBarView(
        children: [
          DirectChats(),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        // onPressed to FloatingActionButton renders SelectContact Widget to chat with other users in the connection.
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const SelectContact()),
          );
        },
        child: const Icon(Icons.add),
      ),
    ),
  );
}
```

 


1. [talawa](../../index.html)
2. [chat\_list\_screen](../../file-___home_harshil_Desktop_open-source_palisadoes_talawa_lib_views_after_auth_screens_chat_chat_list_screen/)
3. [ChatPage](../../file-___home_harshil_Desktop_open-source_palisadoes_talawa_lib_views_after_auth_screens_chat_chat_list_screen/ChatPage-class.html)
4. build method

##### ChatPage class





talawa
1.0.0+1






