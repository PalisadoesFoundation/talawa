


# dispose method







- @[override](https://api.flutter.dev/flutter/dart-core/override-constant.html)

void dispose
()

_<span class="feature">override</span>_



<p>Discards any resources used by the object. After this is called, the
object is not in a usable state and should be discarded (calls to
<a href="https://api.flutter.dev/flutter/foundation/ChangeNotifier/addListener.html">addListener</a> will throw after the object is disposed).</p>
<p>This method should only be called by the object's owner.</p>
<p>This method does not notify listeners, and clears the listener list once
it is called. Consumers of this class must decide on whether to notify
listeners or not immediately before disposal.</p>



## Implementation

```dart
@override
void dispose() {
  taskTitleTextController.dispose();
  taskDescriptionTextController.dispose();
  super.dispose();
}
```







