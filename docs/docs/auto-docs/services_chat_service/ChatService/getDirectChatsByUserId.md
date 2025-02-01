::: {#overlay-under-drawer}
:::

::: {#title}
[menu]{#sidenav-left-toggle .material-symbols-outlined role="button"
tabindex="0"}

1.  [talawa](../../index.html)
2.  [services/chat_service.dart](../../services_chat_service/)
3.  [ChatService](../../services_chat_service/ChatService-class.html)
4.  getDirectChatsByUserId method

::: self-name
getDirectChatsByUserId
:::

::: {#theme-button .toggle title="Toggle brightness"}
[ dark_mode ]{#dark-theme-button .material-symbols-outlined} [
light_mode ]{#light-theme-button .material-symbols-outlined}
:::
:::

::: {role="main"}
::: {#dartdoc-main-content .main-content above-sidebar="services_chat_service/ChatService-class-sidebar.html" below-sidebar=""}
<div>

# [getDirectChatsByUserId]{.kind-method} method

</div>

::: {.section .multi-line-signature}
[[Future](https://api.flutter.dev/flutter/dart-core/Future-class.html)[\<[void]{.type-parameter}\>]{.signature}]{.returntype}
[getDirectChatsByUserId]{.name}()
:::

::: {.section .desc .markdown}
Retrieves direct chats by user ID.

**params**: None

**returns**: None
:::

::: {#source .section .summary .source-code}
## Implementation

``` language-dart
Future<void> getDirectChatsByUserId() async {
  final userId = _userConfig.currentUser.id;

  // trigger graphQL query to get all the chats
  // of the user using [userId].
  final String query = ChatQueries().fetchDirectChatsByUserId(userId!);

  final result = await _dbFunctions.gqlAuthQuery(query);

  final directMessageList = result.data?['directChatsByUserID'] as List;

  // loop through the result [directMessageList]
  // and append the element to the directChat.
  directMessageList.forEach((chat) {
    final directChat =
        ChatListTileDataModel.fromJson(chat as Map<String, dynamic>);

    directChat.users!.forEach((element) {
      if (element.id != userId) _chatController.add(directChat);
    });
  });
}
```
:::
:::

::: {#dartdoc-sidebar-left .sidebar .sidebar-offcanvas-left}
::: {#header-search-sidebar .hidden-l}
:::

1.  [talawa](../../index.html)
2.  [chat_service](../../services_chat_service/)
3.  [ChatService](../../services_chat_service/ChatService-class.html)
4.  getDirectChatsByUserId method

##### ChatService class

::: {#dartdoc-sidebar-left-content}
:::
:::

::: {#dartdoc-sidebar-right .sidebar .sidebar-offcanvas-right}
:::
:::

[ talawa 1.0.0+1 ]{.no-break}
