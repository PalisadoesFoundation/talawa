


# dispose method







- @[override](https://api.flutter.dev/flutter/dart-core/override-constant.html)

void dispose
()

_<span class="feature">override</span>_



<p>Called when this object is removed from the tree permanently.</p>
<p>The framework calls this method when this <a href="https://api.flutter.dev/flutter/widgets/State-class.html">State</a> object will never
build again. After the framework calls <a href="../../widgets_post_widget/PostContainerState/dispose.md">dispose</a>, the <a href="https://api.flutter.dev/flutter/widgets/State-class.html">State</a> object is
considered unmounted and the <a href="https://api.flutter.dev/flutter/widgets/State/mounted.html">mounted</a> property is false. It is an error
to call <a href="https://api.flutter.dev/flutter/widgets/State/setState.html">setState</a> at this point. This stage of the lifecycle is terminal:
there is no way to remount a <a href="https://api.flutter.dev/flutter/widgets/State-class.html">State</a> object that has been disposed.</p>
<p>Subclasses should override this method to release any resources retained
by this object (e.g., stop any active animations).</p>
<p>If a <a href="https://api.flutter.dev/flutter/widgets/State-class.html">State</a>'s <a href="../../widgets_post_widget/PostContainerState/build.md">build</a> method depends on an object that can itself
change state, for example a <a href="https://api.flutter.dev/flutter/foundation/ChangeNotifier-class.html">ChangeNotifier</a> or <a href="https://api.flutter.dev/flutter/dart-async/Stream-class.html">Stream</a>, or some
other object to which one can subscribe to receive notifications, then
be sure to subscribe and unsubscribe properly in <a href="../../widgets_post_widget/PostContainerState/initState.md">initState</a>,
<a href="https://api.flutter.dev/flutter/widgets/State/didUpdateWidget.html">didUpdateWidget</a>, and <a href="../../widgets_post_widget/PostContainerState/dispose.md">dispose</a>:</p>
<ul>
<li>In <a href="../../widgets_post_widget/PostContainerState/initState.md">initState</a>, subscribe to the object.</li>
<li>In <a href="https://api.flutter.dev/flutter/widgets/State/didUpdateWidget.html">didUpdateWidget</a> unsubscribe from the old object and subscribe
to the new one if the updated widget configuration requires
replacing the object.</li>
<li>In <a href="../../widgets_post_widget/PostContainerState/dispose.md">dispose</a>, unsubscribe from the object.</li>
</ul>
<p>Implementations of this method should end with a call to the inherited
method, as in <code>super.dispose()</code>.</p>
<p>See also:</p>
<ul>
<li><a href="https://api.flutter.dev/flutter/widgets/State/deactivate.html">deactivate</a>, which is called prior to <a href="../../widgets_post_widget/PostContainerState/dispose.md">dispose</a>.</li>
</ul>



## Implementation

```dart
@override
void dispose() {
  controller.dispose();
  super.dispose();
}
```







