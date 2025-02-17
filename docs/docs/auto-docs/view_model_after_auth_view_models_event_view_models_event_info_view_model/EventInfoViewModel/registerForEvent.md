::::::: {#dartdoc-main-content .main-content above-sidebar="view_model_after_auth_view_models_event_view_models_event_info_view_model/EventInfoViewModel-class-sidebar.html" below-sidebar=""}
<div>

# [registerForEvent]{.kind-method} method

</div>

::: {.section .multi-line-signature}
[[Future](https://api.flutter.dev/flutter/dart-core/Future-class.html)[\<[void]{.type-parameter}\>]{.signature}]{.returntype}
[registerForEvent]{.name}()
:::

::: {.section .desc .markdown}
The function allows user to register for an event.

**params**: None

**returns**: None
:::

::: {#source .section .summary .source-code}
## Implementation

``` language-dart
Future<void> registerForEvent() async {
  // if event registration is open and user not already registered for the event.
  if (event.isRegisterable == true && event.isRegistered == false) {
    navigationService.pushDialog(
      const CustomProgressDialog(
        key: Key('RegisterEvent'),
      ),
    );

    // use `registerForAnEvent` function provided by `EventService` service.
    final registerResult =
        await locator<EventService>().registerForAnEvent(event.id!);
    if (registerResult != null) {
      event.isRegistered = true;
      final userConfig = locator<UserConfig>();
      attendees.add(
        Attendee(
          id: userConfig.currentUser.id,
          firstName: userConfig.currentUser.firstName,
          lastName: userConfig.currentUser.lastName,
          image: userConfig.currentUser.image,
        ),
      );
    }
    fabTitle = getFabTitle();
    navigationService.pop();
    notifyListeners();
    await locator<EventService>().getEvents();
  }
}
```
:::
:::::::

::::: {#dartdoc-sidebar-left .sidebar .sidebar-offcanvas-left}
::: {#header-search-sidebar .hidden-l}
:::

1.  [talawa](../../index.html)
2.  [event_info_view_model](../../view_model_after_auth_view_models_event_view_models_event_info_view_model/)
3.  [EventInfoViewModel](../../view_model_after_auth_view_models_event_view_models_event_info_view_model/EventInfoViewModel-class.html)
4.  registerForEvent method

##### EventInfoViewModel class

::: {#dartdoc-sidebar-left-content}
:::
:::::

::: {#dartdoc-sidebar-right .sidebar .sidebar-offcanvas-right}
:::
