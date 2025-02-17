::::::::: {#dartdoc-main-content .main-content above-sidebar="view_model_after_auth_view_models_chat_view_models_direct_chat_view_model/DirectChatViewModel-class-sidebar.html" below-sidebar=""}
<div>

# [dispose]{.kind-method} method

</div>

::::: {.section .multi-line-signature}
<div>

1.  @[override](https://api.flutter.dev/flutter/dart-core/override-constant.html)

</div>

[void]{.returntype} [dispose]{.name}()

::: features
[override]{.feature}
:::
:::::

::: {.section .desc .markdown}
Discards any resources used by the object. After this is called, the
object is not in a usable state and should be discarded (calls to
[addListener](https://api.flutter.dev/flutter/foundation/ChangeNotifier/addListener.html)
will throw after the object is disposed).

This method should only be called by the object\'s owner.

This method does not notify listeners, and clears the listener list once
it is called. Consumers of this class must decide on whether to notify
listeners or not immediately before disposal.
:::

::: {#source .section .summary .source-code}
## Implementation

``` language-dart
@override
void dispose() {
  _chatMessageSubscription?.cancel();
  _chatListSubscription.cancel();
  super.dispose();
}
```
:::
:::::::::

::::: {#dartdoc-sidebar-left .sidebar .sidebar-offcanvas-left}
::: {#header-search-sidebar .hidden-l}
:::

1.  [talawa](../../index.html)
2.  [direct_chat_view_model](../../view_model_after_auth_view_models_chat_view_models_direct_chat_view_model/)
3.  [DirectChatViewModel](../../view_model_after_auth_view_models_chat_view_models_direct_chat_view_model/DirectChatViewModel-class.html)
4.  dispose method

##### DirectChatViewModel class

::: {#dartdoc-sidebar-left-content}
:::
:::::

::: {#dartdoc-sidebar-right .sidebar .sidebar-offcanvas-right}
:::
