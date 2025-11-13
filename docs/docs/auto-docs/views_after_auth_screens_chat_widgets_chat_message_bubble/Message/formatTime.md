<div id="overlay-under-drawer">

</div>

<div id="title">

<span id="sidenav-left-toggle" class="material-symbols-outlined"
role="button" tabindex="0">menu</span>

1.  [talawa](../../index.md)
2.  [views/after_auth_screens/chat/widgets/chat_message_bubble.dart](../../views_after_auth_screens_chat_widgets_chat_message_bubble/)
3.  [Message](../../views_after_auth_screens_chat_widgets_chat_message_bubble/Message-class.md)
4.  formatTime method

<div class="self-name">

formatTime

</div>

<span id="dark-theme-button" class="material-symbols-outlined"
aria-hidden="true"> dark_mode </span> <span id="light-theme-button"
class="material-symbols-outlined" aria-hidden="true"> light_mode </span>

</div>

<div role="main">

<div id="dartdoc-main-content" class="main-content"
above-sidebar="views_after_auth_screens_chat_widgets_chat_message_bubble/Message-class-sidebar.html"
below-sidebar="">

<div>

# <span class="kind-method">formatTime</span> method

</div>

<div class="section multi-line-signature">

<span class="returntype">[String](https://api.flutter.dev/flutter/dart-core/String-class.html)</span>
<span class="name">formatTime</span>(

1.  <span id="formatTime-param-dateTime"
    class="parameter"><span class="type-annotation">[DateTime](https://api.flutter.dev/flutter/dart-core/DateTime-class.md)</span>
    <span class="parameter-name">dateTime</span></span>

)

</div>

<div class="section desc markdown">

Formats the given DateTime into a human-readable time string for chat
messages.

Returns different formats based on the time difference:

- For messages older than a day: "day/month" format
- For messages within a day: "hour:minute" format
- For messages within an hour: "Xm ago" format
- For very recent messages: "now"

**params**:

- `dateTime`: The DateTime to format

**returns**:

- `String`: Formatted time string appropriate for chat messages

</div>

<div id="source" class="section summary source-code">

## Implementation

``` language-dart
String formatTime(DateTime dateTime) 
```

</div>

</div>

<div id="dartdoc-sidebar-left" class="sidebar sidebar-offcanvas-left">

<div id="header-search-sidebar" class="hidden-l">

</div>

1.  [talawa](../../index.md)
2.  [chat_message_bubble](../../views_after_auth_screens_chat_widgets_chat_message_bubble/)
3.  [Message](../../views_after_auth_screens_chat_widgets_chat_message_bubble/Message-class.md)
4.  formatTime method

##### Message class

<div id="dartdoc-sidebar-left-content">

</div>

</div>

<div id="dartdoc-sidebar-right" class="sidebar sidebar-offcanvas-right">

</div>

</div>

<span class="no-break"> talawa 1.0.0+1 </span>
