<div id="overlay-under-drawer">

</div>

<div id="title">

<span id="sidenav-left-toggle" class="material-symbols-outlined"
role="button" tabindex="0">menu</span>

1.  [talawa](../index.md)
2.  [services/chat_membership_service.dart](../services_chat_membership_service/services_chat_membership_service-library.md)
3.  ChatMembershipService class

<div class="self-name">

ChatMembershipService

</div>

<div id="theme-button" class="toggle" title="Toggle brightness">

<span id="dark-theme-button" class="material-symbols-outlined">
dark_mode </span> <span id="light-theme-button"
class="material-symbols-outlined"> light_mode </span>

</div>

</div>

<div role="main">

<div id="dartdoc-main-content" class="main-content"
above-sidebar="services_chat_membership_service/services_chat_membership_service-library-sidebar.html"
below-sidebar="services_chat_membership_service/ChatMembershipService-class-sidebar.html">

<div>

# <span class="kind-class">ChatMembershipService</span> class

</div>

<div class="section desc markdown">

Provides chat membership management services for the PostgreSQL-based
chat system.

Services include:

- `createChatMembership` - adds a user to a chat
- `addChatMember` - alias for createChatMembership
- `removeChatMember` - removes a user from a chat
- `fetchChatMembers` - gets chat members with pagination

</div>

<div id="constructors" class="section summary offset-anchor">

## Constructors

<span class="name">[ChatMembershipService](../services_chat_membership_service/ChatMembershipService/ChatMembershipService.md)</span><span class="signature"></span>  

</div>

<div id="instance-properties" class="section summary offset-anchor">

## Properties

<span class="name">[hashCode](https://api.flutter.dev/flutter/dart-core/Object/hashCode.html)</span> <span class="signature">→ [int](https://api.flutter.dev/flutter/dart-core/int-class.html)</span>  
The hash code for this object.

<div class="features">

<span class="feature">no
setter</span><span class="feature">inherited</span>

</div>

<span class="name">[navigationService](../services_chat_membership_service/ChatMembershipService/navigationService.md)</span> <span class="signature">→ [NavigationService](../services_navigation_service/NavigationService-class.md)</span>  
Navigation service instance.

<div class="features">

<span class="feature">final</span>

</div>

<span class="name">[runtimeType](https://api.flutter.dev/flutter/dart-core/Object/runtimeType.html)</span> <span class="signature">→ [Type](https://api.flutter.dev/flutter/dart-core/Type-class.html)</span>  
A representation of the runtime type of the object.

<div class="features">

<span class="feature">no
setter</span><span class="feature">inherited</span>

</div>

</div>

<div id="instance-methods" class="section summary offset-anchor">

## Methods

<span class="name">[addChatMember](../services_chat_membership_service/ChatMembershipService/addChatMember.md)</span><span class="signature"> <span class="returntype parameter">→ [Future](https://api.flutter.dev/flutter/dart-async/Future-class.html)<span class="signature">\<<span class="type-parameter">[bool](https://api.flutter.dev/flutter/dart-core/bool-class.html)</span>\></span></span> </span>  
Adds a member to an existing chat.

<span class="name">[createChatMembership](../services_chat_membership_service/ChatMembershipService/createChatMembership.md)</span><span class="signature"> <span class="returntype parameter">→ [Future](https://api.flutter.dev/flutter/dart-async/Future-class.html)<span class="signature">\<<span class="type-parameter">[bool](https://api.flutter.dev/flutter/dart-core/bool-class.html)</span>\></span></span> </span>  
Creates a chat membership (adds a user to a chat).

<span class="name">[fetchChatMembers](../services_chat_membership_service/ChatMembershipService/fetchChatMembers.md)</span><span class="signature"> <span class="returntype parameter">→ [Future](https://api.flutter.dev/flutter/dart-async/Future-class.html)<span class="signature">\<<span class="type-parameter">[Map](https://api.flutter.dev/flutter/dart-core/Map-class.html)<span class="signature">\<<span class="type-parameter">[String](https://api.flutter.dev/flutter/dart-core/String-class.html)</span>, <span class="type-parameter">dynamic</span>\></span>?</span>\></span></span> </span>  
Fetches members of a specific chat with pagination support.

<span class="name">[noSuchMethod](https://api.flutter.dev/flutter/dart-core/Object/noSuchMethod.html)</span><span class="signature">(<span id="noSuchMethod-param-invocation" class="parameter"><span class="type-annotation">[Invocation](https://api.flutter.dev/flutter/dart-core/Invocation-class.md)</span> <span class="parameter-name">invocation</span></span>) <span class="returntype parameter">→ dynamic</span> </span>  
Invoked when a nonexistent method or property is accessed.

<div class="features">

<span class="feature">inherited</span>

</div>

<span class="name">[removeChatMember](../services_chat_membership_service/ChatMembershipService/removeChatMember.md)</span><span class="signature"> <span class="returntype parameter">→ [Future](https://api.flutter.dev/flutter/dart-async/Future-class.html)<span class="signature">\<<span class="type-parameter">[bool](https://api.flutter.dev/flutter/dart-core/bool-class.html)</span>\></span></span> </span>  
Removes a member from a chat.

<span class="name">[toString](https://api.flutter.dev/flutter/dart-core/Object/toString.html)</span><span class="signature"> <span class="returntype parameter">→ [String](https://api.flutter.dev/flutter/dart-core/String-class.html)</span> </span>  
A string representation of this object.

<div class="features">

<span class="feature">inherited</span>

</div>

</div>

<div id="operators" class="section summary offset-anchor inherited">

## Operators

<span class="name">[operator ==](https://api.flutter.dev/flutter/dart-core/Object/operator_equals.html)</span><span class="signature">(<span id="==-param-other" class="parameter"><span class="type-annotation">[Object](https://api.flutter.dev/flutter/dart-core/Object-class.md)</span> <span class="parameter-name">other</span></span>) <span class="returntype parameter">→ [bool](https://api.flutter.dev/flutter/dart-core/bool-class.html)</span> </span>  
The equality operator.

<div class="features">

<span class="feature">inherited</span>

</div>

</div>

</div>

<div id="dartdoc-sidebar-left" class="sidebar sidebar-offcanvas-left">

<div id="header-search-sidebar" class="hidden-l">

</div>

1.  [talawa](../index.md)
2.  [chat_membership_service](../services_chat_membership_service/services_chat_membership_service-library.md)
3.  ChatMembershipService class

##### chat_membership_service library

<div id="dartdoc-sidebar-left-content">

</div>

</div>

<div id="dartdoc-sidebar-right" class="sidebar sidebar-offcanvas-right">

</div>

</div>

<span class="no-break"> talawa 1.0.0+1 </span>
