<div id="overlay-under-drawer">

</div>

<div id="title">

<span id="sidenav-left-toggle" class="material-symbols-outlined"
role="button" tabindex="0">menu</span>

1.  [talawa](../../index.md)
2.  [utils/chat_utils.dart](../../utils_chat_utils/utils_chat_utils-library.md)
3.  [ChatUtils](../../utils_chat_utils/ChatUtils-class.md)
4.  validateAdminAction static method

<div class="self-name">

validateAdminAction

</div>

<div id="theme-button" class="toggle" title="Toggle brightness">

<span id="dark-theme-button" class="material-symbols-outlined">
dark_mode </span> <span id="light-theme-button"
class="material-symbols-outlined"> light_mode </span>

</div>

</div>

<div role="main">

<div id="dartdoc-main-content" class="main-content"
above-sidebar="utils_chat_utils/ChatUtils-class-sidebar.html"
below-sidebar="">

<div>

# <span class="kind-method">validateAdminAction</span> static method

</div>

<div class="section multi-line-signature">

<span class="returntype">[Map](https://api.flutter.dev/flutter/dart-core/Map-class.html)<span class="signature">\<<span class="type-parameter">[String](https://api.flutter.dev/flutter/dart-core/String-class.html)</span>,
<span class="type-parameter">dynamic</span>\></span></span>
<span class="name">validateAdminAction</span>

</div>

<div class="section desc markdown">

Checks if a user can perform admin actions on a chat.

**params**:

- `chat`: The chat to check
- `currentUserId`: The ID of the current user
- `action`: The action to validate ('rename', 'add_member',
  'remove_member', 'delete')

**returns**:

- `Map<String, dynamic>`: Map with 'isValid' boolean and 'error' string
  if invalid

</div>

<div id="source" class="section summary source-code">

## Implementation

``` language-dart
static Map<String, dynamic>  
```

</div>

</div>

<div id="dartdoc-sidebar-left" class="sidebar sidebar-offcanvas-left">

<div id="header-search-sidebar" class="hidden-l">

</div>

1.  [talawa](../../index.md)
2.  [chat_utils](../../utils_chat_utils/utils_chat_utils-library.md)
3.  [ChatUtils](../../utils_chat_utils/ChatUtils-class.md)
4.  validateAdminAction static method

##### ChatUtils class

<div id="dartdoc-sidebar-left-content">

</div>

</div>

<div id="dartdoc-sidebar-right" class="sidebar sidebar-offcanvas-right">

</div>

</div>

<span class="no-break"> talawa 1.0.0+1 </span>
