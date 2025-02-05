


# CreateTaskViewModel class









<p>CreateTaskViewModel class helps to interact with model to serve data
and react to user's input in Create Task view.</p>
<p>Methods include:</p>
<ul>
<li><code>fillTask</code></li>
<li>`editTask</li>
<li><code>createTask</code></li>
</ul>



**Inheritance**

- [Object](https://api.flutter.dev/flutter/dart-core/Object-class.html)
- [ChangeNotifier](https://api.flutter.dev/flutter/foundation/ChangeNotifier-class.html)
- [BaseModel](../view_model_base_view_model/BaseModel-class.md)
- CreateTaskViewModel








## Constructors

[CreateTaskViewModel](../view_model_after_auth_view_models_task_view_models_create_task_view_model/CreateTaskViewModel/CreateTaskViewModel.md) ()

   


## Properties

##### [hashCode](https://api.flutter.dev/flutter/dart-core/Object/hashCode.html) &#8594; [int](https://api.flutter.dev/flutter/dart-core/int-class.html)



The hash code for this object.  
_<span class="feature">read-only</span><span class="feature">inherited</span>_



##### [hasListeners](https://api.flutter.dev/flutter/foundation/ChangeNotifier/hasListeners.html) &#8594; [bool](https://api.flutter.dev/flutter/dart-core/bool-class.html)



Whether any listeners are currently registered.  
_<span class="feature">read-only</span><span class="feature">inherited</span>_



##### [isBusy](../view_model_base_view_model/BaseModel/isBusy.md) &#8594; [bool](https://api.flutter.dev/flutter/dart-core/bool-class.html)



  
_<span class="feature">read-only</span><span class="feature">inherited</span>_



##### [runtimeType](https://api.flutter.dev/flutter/dart-core/Object/runtimeType.html) &#8594; [Type](https://api.flutter.dev/flutter/dart-core/Type-class.html)



A representation of the runtime type of the object.  
_<span class="feature">read-only</span><span class="feature">inherited</span>_



##### [state](../view_model_base_view_model/BaseModel/state.md) &#8594; [ViewState](../enums_enums/ViewState.md)



  
_<span class="feature">read-only</span><span class="feature">inherited</span>_



##### [taskDescriptionTextController](../view_model_after_auth_view_models_task_view_models_create_task_view_model/CreateTaskViewModel/taskDescriptionTextController.md) &#8594; [TextEditingController](https://api.flutter.dev/flutter/widgets/TextEditingController-class.html)



  
_<span class="feature">final</span>_



##### [taskEndDate](../view_model_after_auth_view_models_task_view_models_create_task_view_model/CreateTaskViewModel/taskEndDate.md) &#8596; [DateTime](https://api.flutter.dev/flutter/dart-core/DateTime-class.html)



  
_<span class="feature">read / write</span>_



##### [taskEndTime](../view_model_after_auth_view_models_task_view_models_create_task_view_model/CreateTaskViewModel/taskEndTime.md) &#8596; [TimeOfDay](https://api.flutter.dev/flutter/material/TimeOfDay-class.html)



  
_<span class="feature">read / write</span>_



##### [taskTitleTextController](../view_model_after_auth_view_models_task_view_models_create_task_view_model/CreateTaskViewModel/taskTitleTextController.md) &#8594; [TextEditingController](https://api.flutter.dev/flutter/widgets/TextEditingController-class.html)



  
_<span class="feature">final</span>_





## Methods

##### [addListener](https://api.flutter.dev/flutter/foundation/ChangeNotifier/addListener.html)([VoidCallback](https://api.flutter.dev/flutter/dart-ui/VoidCallback.html) listener) void



Register a closure to be called when the object changes.  
_<span class="feature">inherited</span>_



##### [createTask](../view_model_after_auth_view_models_task_view_models_create_task_view_model/CreateTaskViewModel/createTask.md)([String](https://api.flutter.dev/flutter/dart-core/String-class.html) eventId) [Future](https://api.flutter.dev/flutter/dart-async/Future-class.html)&lt;[bool](https://api.flutter.dev/flutter/dart-core/bool-class.html)>



This function creates a new task for an event.
The function uses <code>createTask</code> method provided by Task Services.  




##### [dispose](../view_model_after_auth_view_models_task_view_models_create_task_view_model/CreateTaskViewModel/dispose.md)() void



Discards any resources used by the object. After this is called, the
object is not in a usable state and should be discarded (calls to
<a href="https://api.flutter.dev/flutter/foundation/ChangeNotifier/addListener.html">addListener</a> will throw after the object is disposed).  
_<span class="feature">override</span>_



##### [editTask](../view_model_after_auth_view_models_task_view_models_create_task_view_model/CreateTaskViewModel/editTask.md)([String](https://api.flutter.dev/flutter/dart-core/String-class.html) taskId) [Future](https://api.flutter.dev/flutter/dart-async/Future-class.html)&lt;[bool](https://api.flutter.dev/flutter/dart-core/bool-class.html)>



This function updates the task.
The function uses <code>editTask</code> method provided by Task Services.  




##### [fillTask](../view_model_after_auth_view_models_task_view_models_create_task_view_model/CreateTaskViewModel/fillTask.md)([Task](../models_task_task_model/Task-class.md) task) void



This functions fills the task controller data.  




##### [noSuchMethod](https://api.flutter.dev/flutter/dart-core/Object/noSuchMethod.html)([Invocation](https://api.flutter.dev/flutter/dart-core/Invocation-class.html) invocation) dynamic



Invoked when a non-existent method or property is accessed.  
_<span class="feature">inherited</span>_



##### [notifyListeners](https://api.flutter.dev/flutter/foundation/ChangeNotifier/notifyListeners.html)() void



Call all the registered listeners.  
_<span class="feature">inherited</span>_



##### [removeListener](https://api.flutter.dev/flutter/foundation/ChangeNotifier/removeListener.html)([VoidCallback](https://api.flutter.dev/flutter/dart-ui/VoidCallback.html) listener) void



Remove a previously registered closure from the list of closures that are
notified when the object changes.  
_<span class="feature">inherited</span>_



##### [setState](../view_model_base_view_model/BaseModel/setState.md)([ViewState](../enums_enums/ViewState.md) viewState) void



  
_<span class="feature">inherited</span>_



##### [toString](https://api.flutter.dev/flutter/dart-core/Object/toString.html)() [String](https://api.flutter.dev/flutter/dart-core/String-class.html)



A string representation of this object.  
_<span class="feature">inherited</span>_





## Operators

##### [operator ==](https://api.flutter.dev/flutter/dart-core/Object/operator_equals.html)([Object](https://api.flutter.dev/flutter/dart-core/Object-class.html) other) [bool](https://api.flutter.dev/flutter/dart-core/bool-class.html)



The equality operator.  
_<span class="feature">inherited</span>_















