


# TaskService class









<p>PostService class provides functions in the context of a Task.</p>
<p>Services include:</p>
<ul>
<li><code>getTasksForEvent</code> : to get the task for the event.</li>
<li><code>getTasksByUser</code> : to get the task added by the user.</li>
<li><code>editTask</code> : to edit the task added by the user.</li>
<li><code>createTask</code> : to create the task for the event.</li>
<li><code>deleteTask</code> : to delete the task added by the user.</li>
</ul>




## Constructors

[TaskService](../services_task_service/TaskService/TaskService.md) ()

   


## Properties

##### [callbackNotifyListeners](../services_task_service/TaskService/callbackNotifyListeners.md) &#8596; [VoidCallback](https://api.flutter.dev/flutter/dart-ui/VoidCallback.html)



  
_<span class="feature">read / write</span>_



##### [hashCode](https://api.flutter.dev/flutter/dart-core/Object/hashCode.html) &#8594; [int](https://api.flutter.dev/flutter/dart-core/int-class.html)



The hash code for this object.  
_<span class="feature">read-only</span><span class="feature">inherited</span>_



##### [runtimeType](https://api.flutter.dev/flutter/dart-core/Object/runtimeType.html) &#8594; [Type](https://api.flutter.dev/flutter/dart-core/Type-class.html)



A representation of the runtime type of the object.  
_<span class="feature">read-only</span><span class="feature">inherited</span>_



##### [tasks](../services_task_service/TaskService/tasks.md) &#8594; [List](https://api.flutter.dev/flutter/dart-core/List-class.html)&lt;[Task](../models_task_task_model/Task-class.md)>



  
_<span class="feature">read-only</span>_





## Methods

##### [createTask](../services_task_service/TaskService/createTask.md)({required [String](https://api.flutter.dev/flutter/dart-core/String-class.html) title, required [String](https://api.flutter.dev/flutter/dart-core/String-class.html) description, required [String](https://api.flutter.dev/flutter/dart-core/String-class.html) deadline, required [String](https://api.flutter.dev/flutter/dart-core/String-class.html) eventId}) [Future](https://api.flutter.dev/flutter/dart-async/Future-class.html)&lt;[bool](https://api.flutter.dev/flutter/dart-core/bool-class.html)>



This function is used to create a new task for the event.  




##### [deleteTask](../services_task_service/TaskService/deleteTask.md)([String](https://api.flutter.dev/flutter/dart-core/String-class.html) taskId, [String](https://api.flutter.dev/flutter/dart-core/String-class.html) creatorId) [Future](https://api.flutter.dev/flutter/dart-async/Future-class.html)&lt;void>



This function is used to delete a task.  




##### [editTask](../services_task_service/TaskService/editTask.md)({required [String](https://api.flutter.dev/flutter/dart-core/String-class.html) title, required [String](https://api.flutter.dev/flutter/dart-core/String-class.html) description, required [String](https://api.flutter.dev/flutter/dart-core/String-class.html) deadline, required [String](https://api.flutter.dev/flutter/dart-core/String-class.html) taskId}) [Future](https://api.flutter.dev/flutter/dart-async/Future-class.html)&lt;[bool](https://api.flutter.dev/flutter/dart-core/bool-class.html)>



This function is used to edit the task created by the user.  




##### [getTasksByUser](../services_task_service/TaskService/getTasksByUser.md)() [Future](https://api.flutter.dev/flutter/dart-async/Future-class.html)&lt;void>



This function is used to fetch and return all tasks added by the current user.  




##### [getTasksForEvent](../services_task_service/TaskService/getTasksForEvent.md)([String](https://api.flutter.dev/flutter/dart-core/String-class.html) eventId) [Future](https://api.flutter.dev/flutter/dart-async/Future-class.html)&lt;void>



This function is used to get all the tasks for the event.  




##### [noSuchMethod](https://api.flutter.dev/flutter/dart-core/Object/noSuchMethod.html)([Invocation](https://api.flutter.dev/flutter/dart-core/Invocation-class.html) invocation) dynamic



Invoked when a non-existent method or property is accessed.  
_<span class="feature">inherited</span>_



##### [toString](https://api.flutter.dev/flutter/dart-core/Object/toString.html)() [String](https://api.flutter.dev/flutter/dart-core/String-class.html)



A string representation of this object.  
_<span class="feature">inherited</span>_





## Operators

##### [operator ==](https://api.flutter.dev/flutter/dart-core/Object/operator_equals.html)([Object](https://api.flutter.dev/flutter/dart-core/Object-class.html) other) [bool](https://api.flutter.dev/flutter/dart-core/bool-class.html)



The equality operator.  
_<span class="feature">inherited</span>_















