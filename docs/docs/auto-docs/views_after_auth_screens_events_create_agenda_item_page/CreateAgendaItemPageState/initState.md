



menu

1.  [talawa](../../index.md)
2.  [views/after_auth_screens/events/create_agenda_item_page.dart](../../views_after_auth_screens_events_create_agenda_item_page/)
3.  [CreateAgendaItemPageState](../../views_after_auth_screens_events_create_agenda_item_page/CreateAgendaItemPageState-class.md)
4.  initState method


initState


 dark_mode   light_mode 




<div>

# initState method

</div>


<div>

1.  @[override](https://api.flutter.dev/flutter/dart-core/override-constant.html)

</div>

void 


override




Called when this object is inserted into the tree.

The framework will call this method exactly once for each
[State](https://api.flutter.dev/flutter/widgets/State-class.html) object
it creates.

Override this method to perform initialization that depends on the
location at which this object was inserted into the tree (i.e.,
[context](https://api.flutter.dev/flutter/widgets/State/context.md))
or on the widget used to configure this object (i.e.,
[widget](https://api.flutter.dev/flutter/widgets/State/widget.md)).

If a
[State](https://api.flutter.dev/flutter/widgets/State-class.html)\'s
[build](../../views_after_auth_screens_events_create_agenda_item_page/CreateAgendaItemPageState/build.md)
method depends on an object that can itself change state, for example a
[ChangeNotifier](https://api.flutter.dev/flutter/foundation/ChangeNotifier-class.html)
or
[Stream](https://api.flutter.dev/flutter/dart-core/Stream-class.html),
or some other object to which one can subscribe to receive
notifications, then be sure to subscribe and unsubscribe properly in
[initState](../../views_after_auth_screens_events_create_agenda_item_page/CreateAgendaItemPageState/initState.md),
[didUpdateWidget](https://api.flutter.dev/flutter/widgets/State/didUpdateWidget.html),
and
[dispose](https://api.flutter.dev/flutter/widgets/State/dispose.html):

-   In
    [initState](../../views_after_auth_screens_events_create_agenda_item_page/CreateAgendaItemPageState/initState.md),
    subscribe to the object.
-   In
    [didUpdateWidget](https://api.flutter.dev/flutter/widgets/State/didUpdateWidget.html)
    unsubscribe from the old object and subscribe to the new one if the
    updated widget configuration requires replacing the object.
-   In
    [dispose](https://api.flutter.dev/flutter/widgets/State/dispose.html),
    unsubscribe from the object.

You should not use
[BuildContext.dependOnInheritedWidgetOfExactType](https://api.flutter.dev/flutter/widgets/BuildContext/dependOnInheritedWidgetOfExactType.html)
from this method. However,
[didChangeDependencies](https://api.flutter.dev/flutter/widgets/State/didChangeDependencies.html)
will be called immediately following this method, and
[BuildContext.dependOnInheritedWidgetOfExactType](https://api.flutter.dev/flutter/widgets/BuildContext/dependOnInheritedWidgetOfExactType.html)
can be used there.

Implementations of this method should start with a call to the inherited
method, as in `super.`.



## Implementation

``` language-dart
@override
void  
```







1.  [talawa](../../index.md)
2.  [create_agenda_item_page](../../views_after_auth_screens_events_create_agenda_item_page/)
3.  [CreateAgendaItemPageState](../../views_after_auth_screens_events_create_agenda_item_page/CreateAgendaItemPageState-class.md)
4.  initState method

##### CreateAgendaItemPageState class









 talawa 1.0.0+1 
