
<div>

# dispose method

</div>


<div>

1.  @[override](https://api.flutter.dev/flutter/dart-core/override-constant.html)

</div>

void 


override




Discards any resources used by the object. After this is called, the
object is not in a usable state and should be discarded (calls to
[addListener](https://api.flutter.dev/flutter/foundation/ChangeNotifier/addListener.html)
will throw after the object is disposed).

This method should only be called by the object\'s owner.

This method does not notify listeners, and clears the listener list once
it is called. Consumers of this class must decide on whether to notify
listeners or not immediately before disposal.



## Implementation

``` language-dart
@override
void  {
  titleController.;
  descriptionController.;
  urlController.;
  durationController.;
  super.;
}
```







1.  [talawa](../../index.html)
2.  [edit_agenda_view_model](../../view_model_after_auth_view_models_event_view_models_edit_agenda_view_model/)
3.  [EditAgendaItemViewModel](../../view_model_after_auth_view_models_event_view_models_edit_agenda_view_model/EditAgendaItemViewModel-class.html)
4.  dispose method

##### EditAgendaItemViewModel class







