<div id="overlay-under-drawer">

</div>

<div id="title">

<span id="sidenav-left-toggle" class="material-symbols-outlined"
role="button" tabindex="0">menu</span>

1.  [talawa](../index.md)
2.  [utils/validators.dart](../utils_validators/)
3.  Validator class

<div class="self-name">

Validator

</div>

<span id="dark-theme-button" class="material-symbols-outlined"
aria-hidden="true"> dark_mode </span> <span id="light-theme-button"
class="material-symbols-outlined" aria-hidden="true"> light_mode </span>

</div>

<div role="main">

<div id="dartdoc-main-content" class="main-content"
above-sidebar="utils_validators/utils_validators-library-sidebar.html"
below-sidebar="utils_validators/Validator-class-sidebar.html">

<div>

# <span class="kind-class">Validator</span> class

</div>

<div class="section desc markdown">

This class creats various validator methods for the application.

They are used to validate information given by the users.

</div>

<div id="constructors" class="section summary offset-anchor">

## Constructors

<span class="name">[Validator](../utils_validators/Validator/Validator.md)</span><span class="signature"></span>  

</div>

<div id="instance-properties"
class="section summary offset-anchor inherited">

## Properties

<span class="name">[hashCode](https://api.flutter.dev/flutter/dart-core/Object/hashCode.html)</span> <span class="signature">→ [int](https://api.flutter.dev/flutter/dart-core/int-class.html)</span>  
The hash code for this object.

<div class="features">

<span class="feature">no
setter</span><span class="feature">inherited</span>

</div>

<span class="name">[runtimeType](https://api.flutter.dev/flutter/dart-core/Object/runtimeType.html)</span> <span class="signature">→ [Type](https://api.flutter.dev/flutter/dart-core/Type-class.html)</span>  
A representation of the runtime type of the object.

<div class="features">

<span class="feature">no
setter</span><span class="feature">inherited</span>

</div>

</div>

<div id="instance-methods" class="section summary offset-anchor">

## Methods

<span class="name">[noSuchMethod](https://api.flutter.dev/flutter/dart-core/Object/noSuchMethod.html)</span><span class="signature">(<span id="noSuchMethod-param-invocation" class="parameter"><span class="type-annotation">[Invocation](https://api.flutter.dev/flutter/dart-core/Invocation-class.md)</span> <span class="parameter-name">invocation</span></span>) <span class="returntype parameter">→ dynamic</span> </span>  
Invoked when a nonexistent method or property is accessed.

<div class="features">

<span class="feature">inherited</span>

</div>

<span class="name">[toString](https://api.flutter.dev/flutter/dart-core/Object/toString.html)</span><span class="signature"> <span class="returntype parameter">→ [String](https://api.flutter.dev/flutter/dart-core/String-class.html)</span> </span>  
A string representation of this object.

<div class="features">

<span class="feature">inherited</span>

</div>

<span class="name">[validateUrlExistence](../utils_validators/Validator/validateUrlExistence.md)</span><span class="signature">(<span id="validateUrlExistence-param-url" class="parameter"><span class="type-annotation">[String](https://api.flutter.dev/flutter/dart-core/String-class.md)</span> <span class="parameter-name">url</span></span>) <span class="returntype parameter">→ [Future](https://api.flutter.dev/flutter/dart-core/Future-class.html)<span class="signature">\<<span class="type-parameter">[bool](https://api.flutter.dev/flutter/dart-core/bool-class.html)?</span>\></span></span> </span>  
Method to validate already exisiting URL.

</div>

<div id="operators" class="section summary offset-anchor inherited">

## Operators

<span class="name">[operator ==](https://api.flutter.dev/flutter/dart-core/Object/operator_equals.html)</span><span class="signature">(<span id="==-param-other" class="parameter"><span class="type-annotation">[Object](https://api.flutter.dev/flutter/dart-core/Object-class.md)</span> <span class="parameter-name">other</span></span>) <span class="returntype parameter">→ [bool](https://api.flutter.dev/flutter/dart-core/bool-class.html)</span> </span>  
The equality operator.

<div class="features">

<span class="feature">inherited</span>

</div>

</div>

<div id="static-methods" class="section summary offset-anchor">

## Static Methods

<span class="name">[validateEmail](../utils_validators/Validator/validateEmail.md)</span><span class="signature">(<span id="validateEmail-param-email" class="parameter"><span class="type-annotation">[String](https://api.flutter.dev/flutter/dart-core/String-class.md)</span> <span class="parameter-name">email</span></span>) <span class="returntype parameter">→ [String](https://api.flutter.dev/flutter/dart-core/String-class.html)?</span> </span>  
Method to validate a user's email.

<span class="name">[validateEventForm](../utils_validators/Validator/validateEventForm.md)</span><span class="signature">(<span id="validateEventForm-param-value" class="parameter"><span class="type-annotation">[String](https://api.flutter.dev/flutter/dart-core/String-class.md)</span> <span class="parameter-name">value</span>, </span><span id="validateEventForm-param-label" class="parameter"><span class="type-annotation">[String](https://api.flutter.dev/flutter/dart-core/String-class.html)?</span> <span class="parameter-name">label</span></span>) <span class="returntype parameter">→ [String](https://api.flutter.dev/flutter/dart-core/String-class.html)?</span> </span>  
Method to validate event form.

<span class="name">[validateEventTime](../utils_validators/Validator/validateEventTime.md)</span><span class="signature">(<span id="validateEventTime-param-startTime" class="parameter"><span class="type-annotation">[TimeOfDay](https://api.flutter.dev/flutter/material/TimeOfDay-class.md)</span> <span class="parameter-name">startTime</span>, </span><span id="validateEventTime-param-endTime" class="parameter"><span class="type-annotation">[TimeOfDay](https://api.flutter.dev/flutter/material/TimeOfDay-class.html)</span> <span class="parameter-name">endTime</span></span>) <span class="returntype parameter">→ [String](https://api.flutter.dev/flutter/dart-core/String-class.html)?</span> </span>  
Method to validate event time.

<span class="name">[validateFirstName](../utils_validators/Validator/validateFirstName.md)</span><span class="signature">(<span id="validateFirstName-param-value" class="parameter"><span class="type-annotation">[String](https://api.flutter.dev/flutter/dart-core/String-class.md)</span> <span class="parameter-name">value</span></span>) <span class="returntype parameter">→ [String](https://api.flutter.dev/flutter/dart-core/String-class.html)?</span> </span>  
Method to validate a user's first name.

<span class="name">[validateLastName](../utils_validators/Validator/validateLastName.md)</span><span class="signature">(<span id="validateLastName-param-value" class="parameter"><span class="type-annotation">[String](https://api.flutter.dev/flutter/dart-core/String-class.md)</span> <span class="parameter-name">value</span></span>) <span class="returntype parameter">→ [String](https://api.flutter.dev/flutter/dart-core/String-class.html)?</span> </span>  
Method to validate a user's last name.

<span class="name">[validatePassword](../utils_validators/Validator/validatePassword.md)</span><span class="signature">(<span id="validatePassword-param-password" class="parameter"><span class="type-annotation">[String](https://api.flutter.dev/flutter/dart-core/String-class.md)</span> <span class="parameter-name">password</span></span>) <span class="returntype parameter">→ [String](https://api.flutter.dev/flutter/dart-core/String-class.html)?</span> </span>  
Method to validate password.

<span class="name">[validatePasswordConfirm](../utils_validators/Validator/validatePasswordConfirm.md)</span><span class="signature">(<span id="validatePasswordConfirm-param-value" class="parameter"><span class="type-annotation">[String](https://api.flutter.dev/flutter/dart-core/String-class.md)</span> <span class="parameter-name">value</span>, </span><span id="validatePasswordConfirm-param-comparator" class="parameter"><span class="type-annotation">[String](https://api.flutter.dev/flutter/dart-core/String-class.html)</span> <span class="parameter-name">comparator</span></span>) <span class="returntype parameter">→ [String](https://api.flutter.dev/flutter/dart-core/String-class.html)?</span> </span>  
Method to valid password re-entered for confirmation.

<span class="name">[validateURL](../utils_validators/Validator/validateURL.md)</span><span class="signature">(<span id="validateURL-param-value" class="parameter"><span class="type-annotation">[String](https://api.flutter.dev/flutter/dart-core/String-class.md)</span> <span class="parameter-name">value</span></span>) <span class="returntype parameter">→ [String](https://api.flutter.dev/flutter/dart-core/String-class.html)?</span> </span>  
Method to validate an organization's URL.

</div>

</div>

<div id="dartdoc-sidebar-left" class="sidebar sidebar-offcanvas-left">

<div id="header-search-sidebar" class="hidden-l">

</div>

1.  [talawa](../index.md)
2.  [validators](../utils_validators/)
3.  Validator class

##### validators library

<div id="dartdoc-sidebar-left-content">

</div>

</div>

<div id="dartdoc-sidebar-right" class="sidebar sidebar-offcanvas-right">

</div>

</div>

<span class="no-break"> talawa 1.0.0+1 </span>
