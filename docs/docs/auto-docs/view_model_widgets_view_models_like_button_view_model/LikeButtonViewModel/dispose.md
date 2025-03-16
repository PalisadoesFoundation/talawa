
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
[addListener](https://api.flutter.dev/flutter/foundation/ChangeNotifier/addListener.md)
will throw after the object is disposed).

This method should only be called by the object\'s owner.

This method does not notify listeners, and clears the listener list once
it is called. Consumers of this class must decide on whether to notify
listeners or not immediately before disposal.



## Implementation

``` language-dart
@override
// ignore: must_call_super
void  
```







1.  [talawa](../../index.md)
2.  [like_button_view_model](../../view_model_widgets_view_models_like_button_view_model/)
3.  [LikeButtonViewModel](../../view_model_widgets_view_models_like_button_view_model/LikeButtonViewModel-class.md)
4.  dispose method

##### LikeButtonViewModel class







