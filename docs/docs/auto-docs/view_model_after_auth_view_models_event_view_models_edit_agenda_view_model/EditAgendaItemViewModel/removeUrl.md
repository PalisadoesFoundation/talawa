
<div>

# removeUrl method

</div>


void removeUrl(

1.  [[[String](https://api.flutter.dev/flutter/dart-core/String-class.html)]
    url]

)



Removes a URL from the agenda item.

**params**:

-   `url`: The URL string to be removed.

**returns**: None



## Implementation

``` language-dart
void removeUrl(String url) {
  _currentUrls.remove(url);
  ;
}
```







1.  [talawa](../../index.html)
2.  [edit_agenda_view_model](../../view_model_after_auth_view_models_event_view_models_edit_agenda_view_model/)
3.  [EditAgendaItemViewModel](../../view_model_after_auth_view_models_event_view_models_edit_agenda_view_model/EditAgendaItemViewModel-class.html)
4.  removeUrl method

##### EditAgendaItemViewModel class







