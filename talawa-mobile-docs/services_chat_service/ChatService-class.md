


# ChatService class









<p>ChatService class provides different services for direct chats of the user.</p>
<p>Services include:</p>
<ul>
<li><code>sendMessageToDirectChat</code> - used to send messages.</li>
<li><code>getDirectChatsByUserId</code> - used to get all chats by the user.</li>
<li><code>getDirectChatMessagesByChatId</code> - used to get all chats of a user with another user.</li>
</ul>




## Constructors

[ChatService](../services_chat_service/ChatService/ChatService.md) ()

   


## Properties

##### [chatListStream](../services_chat_service/ChatService/chatListStream.md) &#8594; [Stream](https://api.flutter.dev/flutter/dart-async/Stream-class.html)&lt;[ChatListTileDataModel](../models_chats_chat_list_tile_data_model/ChatListTileDataModel-class.md)>



  
_<span class="feature">read-only</span>_



##### [chatMessagesStream](../services_chat_service/ChatService/chatMessagesStream.md) &#8594; [Stream](https://api.flutter.dev/flutter/dart-async/Stream-class.html)&lt;[ChatMessage](../models_chats_chat_message/ChatMessage-class.md)>



  
_<span class="feature">read-only</span>_



##### [chatStream](../services_chat_service/ChatService/chatStream.md) &#8596; [Stream](https://api.flutter.dev/flutter/dart-async/Stream-class.html)&lt;[QueryResult](https://pub.dev/documentation/graphql/5.2.0-beta.4/graphql/QueryResult-class.html)&lt;[Object](https://api.flutter.dev/flutter/dart-core/Object-class.html)?>>



  
_<span class="feature">read / write</span>_



##### [hashCode](https://api.flutter.dev/flutter/dart-core/Object/hashCode.html) &#8594; [int](https://api.flutter.dev/flutter/dart-core/int-class.html)



The hash code for this object.  
_<span class="feature">read-only</span><span class="feature">inherited</span>_



##### [runtimeType](https://api.flutter.dev/flutter/dart-core/Object/runtimeType.html) &#8594; [Type](https://api.flutter.dev/flutter/dart-core/Type-class.html)



A representation of the runtime type of the object.  
_<span class="feature">read-only</span><span class="feature">inherited</span>_





## Methods

##### [getDirectChatMessagesByChatId](../services_chat_service/ChatService/getDirectChatMessagesByChatId.md)(dynamic chatId) [Future](https://api.flutter.dev/flutter/dart-async/Future-class.html)&lt;void>



This function is used to get all the chat messages of a particular chat by the user.  




##### [getDirectChatsByUserId](../services_chat_service/ChatService/getDirectChatsByUserId.md)() [Future](https://api.flutter.dev/flutter/dart-async/Future-class.html)&lt;void>



This function is used to get all the chats by the user.  




##### [noSuchMethod](https://api.flutter.dev/flutter/dart-core/Object/noSuchMethod.html)([Invocation](https://api.flutter.dev/flutter/dart-core/Invocation-class.html) invocation) dynamic



Invoked when a non-existent method or property is accessed.  
_<span class="feature">inherited</span>_



##### [sendMessageToDirectChat](../services_chat_service/ChatService/sendMessageToDirectChat.md)([String](https://api.flutter.dev/flutter/dart-core/String-class.html) chatId, [String](https://api.flutter.dev/flutter/dart-core/String-class.html) messageContent) [Future](https://api.flutter.dev/flutter/dart-async/Future-class.html)&lt;void>



This function is used to send the message in the direct chats.  




##### [toString](https://api.flutter.dev/flutter/dart-core/Object/toString.html)() [String](https://api.flutter.dev/flutter/dart-core/String-class.html)



A string representation of this object.  
_<span class="feature">inherited</span>_





## Operators

##### [operator ==](https://api.flutter.dev/flutter/dart-core/Object/operator_equals.html)([Object](https://api.flutter.dev/flutter/dart-core/Object-class.html) other) [bool](https://api.flutter.dev/flutter/dart-core/bool-class.html)



The equality operator.  
_<span class="feature">inherited</span>_















