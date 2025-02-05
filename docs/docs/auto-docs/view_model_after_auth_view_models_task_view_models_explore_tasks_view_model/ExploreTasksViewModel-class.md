


# ExploreTasksViewModel class









<p>ExploreTasksViewModel class helps to interact with model to serve data
and react to user's input in Explore Task section.</p>
<p>Methods include:</p>
<ul>
<li><code>fetchTasks</code></li>
<li>`fetchTasksByUser</li>
<li><code>deleteTask</code></li>
</ul>



**Inheritance**

- [Object](https://api.flutter.dev/flutter/dart-core/Object-class.html)
- [ChangeNotifier](https://api.flutter.dev/flutter/foundation/ChangeNotifier-class.html)
- [BaseModel](../view_model_base_view_model/BaseModel-class.md)
- ExploreTasksViewModel








## Constructors

[ExploreTasksViewModel](../view_model_after_auth_view_models_task_view_models_explore_tasks_view_model/ExploreTasksViewModel/ExploreTasksViewModel.md) ()

   


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



##### [tasks](../view_model_after_auth_view_models_task_view_models_explore_tasks_view_model/ExploreTasksViewModel/tasks.md) &#8594; [List](https://api.flutter.dev/flutter/dart-core/List-class.html)&lt;[Task](../models_task_task_model/Task-class.md)>



  
_<span class="feature">read-only</span>_





## Methods

##### [addListener](https://api.flutter.dev/flutter/foundation/ChangeNotifier/addListener.html)([VoidCallback](https://api.flutter.dev/flutter/dart-ui/VoidCallback.html) listener) void



Register a closure to be called when the object changes.  
_<span class="feature">inherited</span>_



##### [deleteTask](../view_model_after_auth_view_models_task_view_models_explore_tasks_view_model/ExploreTasksViewModel/deleteTask.md)([String](https://api.flutter.dev/flutter/dart-core/String-class.html) taskId, [String](https://api.flutter.dev/flutter/dart-core/String-class.html) creatorId) [Future](https://api.flutter.dev/flutter/dart-async/Future-class.html)&lt;void>



This function deletes the task for an event.
The function uses <code>deleteTask</code> method of Task Service.  




##### [dispose](https://api.flutter.dev/flutter/foundation/ChangeNotifier/dispose.html)() void



Discards any resources used by the object. After this is called, the
object is not in a usable state and should be discarded (calls to
<a href="https://api.flutter.dev/flutter/foundation/ChangeNotifier/addListener.html">addListener</a> will throw after the object is disposed).  
_<span class="feature">inherited</span>_



##### [fetchTasks](../view_model_after_auth_view_models_task_view_models_explore_tasks_view_model/ExploreTasksViewModel/fetchTasks.md)([String](https://api.flutter.dev/flutter/dart-core/String-class.html) eventId) [Future](https://api.flutter.dev/flutter/dart-async/Future-class.html)&lt;void>



This function fetch all the task for an event.
The function uses <code>getTasksForEvent</code> method of Task Service.  




##### [fetchTasksByUser](../view_model_after_auth_view_models_task_view_models_explore_tasks_view_model/ExploreTasksViewModel/fetchTasksByUser.md)() [Future](https://api.flutter.dev/flutter/dart-async/Future-class.html)&lt;void>



This function fetch tasks created by the current user for an event.
The function uses <code>getTasksByUser</code> method of Task Service.  




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















