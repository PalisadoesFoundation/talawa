::::::: {#dartdoc-main-content .main-content above-sidebar="view_model_after_auth_view_models_event_view_models_event_info_view_model/EventInfoViewModel-class-sidebar.html" below-sidebar=""}
<div>

# [createAgendaItem]{.kind-method} method

</div>

::: {.section .multi-line-signature}
[[Future](https://api.flutter.dev/flutter/dart-core/Future-class.html)[\<[[EventAgendaItem](../../models_events_event_agenda_item/EventAgendaItem-class.html)?]{.type-parameter}\>]{.signature}]{.returntype}
[createAgendaItem]{.name}({

1.  [required
    [[String](https://api.flutter.dev/flutter/dart-core/String-class.html)]{.type-annotation}
    [title]{.parameter-name}, ]{#createAgendaItem-param-title
    .parameter}
2.  [[[String](https://api.flutter.dev/flutter/dart-core/String-class.html)?]{.type-annotation}
    [description]{.parameter-name},
    ]{#createAgendaItem-param-description .parameter}
3.  [required
    [[String](https://api.flutter.dev/flutter/dart-core/String-class.html)]{.type-annotation}
    [duration]{.parameter-name}, ]{#createAgendaItem-param-duration
    .parameter}
4.  [[[List](https://api.flutter.dev/flutter/dart-core/List-class.html)[\<[[String](https://api.flutter.dev/flutter/dart-core/String-class.html)]{.type-parameter}\>]{.signature}?]{.type-annotation}
    [attachments]{.parameter-name},
    ]{#createAgendaItem-param-attachments .parameter}
5.  [[[List](https://api.flutter.dev/flutter/dart-core/List-class.html)[\<[[String](https://api.flutter.dev/flutter/dart-core/String-class.html)]{.type-parameter}\>]{.signature}?]{.type-annotation}
    [urls]{.parameter-name}, ]{#createAgendaItem-param-urls .parameter}
6.  [[[List](https://api.flutter.dev/flutter/dart-core/List-class.html)[\<[[String](https://api.flutter.dev/flutter/dart-core/String-class.html)]{.type-parameter}\>]{.signature}?]{.type-annotation}
    [categories]{.parameter-name}, ]{#createAgendaItem-param-categories
    .parameter}
7.  [[[int](https://api.flutter.dev/flutter/dart-core/int-class.html)?]{.type-annotation}
    [sequence]{.parameter-name}, ]{#createAgendaItem-param-sequence
    .parameter}

})
:::

::: {.section .desc .markdown}
This function is used to create a new agenda item for an event.

**params**:

-   `title`: Title of the agenda item.
-   `description`: Description of the agenda item (optional).
-   `duration`: Duration of the agenda item.
-   `attachments`: List of attachment URLs (optional).
-   `urls`: List of related URLs (optional).
-   `categories`: List of category IDs (optional).
-   `sequence`: Sequence number of the agenda item.
-   `itemType`: Type of the agenda item.
-   `isNote`: Whether the agenda item is a note or not.

**returns**:

-   `Future<EventAgendaItem?>`: Returns the new agenda item if creation
    is successful.
:::

::: {#source .section .summary .source-code}
## Implementation

``` language-dart
Future<EventAgendaItem?> createAgendaItem({
  required String title,
  String? description,
  required String duration,
  List<String>? attachments,
  List<String>? urls,
  List<String>? categories,
  int? sequence,
}) async {
  try {
    final variables = {
      'title': title,
      'description': description,
      'duration': duration,
      'attachments': attachments,
      'relatedEventId': event.id,
      'urls': urls,
      'categories': categories,
      'sequence': _agendaItems.length + 1,
      'organizationId': userConfig.currentOrg.id,
    };
    final result = await locator<EventService>().createAgendaItem(variables)
        as QueryResult;
    if (result.data == null || result.data!['createAgendaItem'] == null) {
      throw Exception('Failed to create agenda item or no data returned');
    }

    final data = result.data!['createAgendaItem'];

    final newAgendaItem =
        EventAgendaItem.fromJson(data as Map<String, dynamic>);

    _agendaItems.add(newAgendaItem);
    selectedCategories.clear();
    notifyListeners();

    return newAgendaItem;
  } catch (e) {
    print('Error creating agenda item: $e');
  }
  return null;
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
4.  createAgendaItem method

##### EventInfoViewModel class

::: {#dartdoc-sidebar-left-content}
:::
:::::

::: {#dartdoc-sidebar-right .sidebar .sidebar-offcanvas-right}
:::
