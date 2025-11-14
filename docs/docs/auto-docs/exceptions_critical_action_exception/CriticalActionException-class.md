<div id="overlay-under-drawer">

</div>

<div id="title">

<span id="sidenav-left-toggle" class="material-symbols-outlined"
role="button" tabindex="0">menu</span>

1.  [talawa](../index.md)
2.  [critical_action_exception](../exceptions_critical_action_exception/exceptions_critical_action_exception-library.md)
3.  CriticalActionException class

<div class="self-name">

CriticalActionException

</div>

<div id="theme-button" class="toggle">

<span id="dark-theme-button" class="material-symbols-outlined">
brightness_4 </span> <span id="light-theme-button"
class="material-symbols-outlined"> brightness_5 </span>

</div>

</div>

<div role="main">

<div id="dartdoc-main-content" class="main-content"
above-sidebar="exceptions_critical_action_exception/exceptions_critical_action_exception-library-sidebar.html"
below-sidebar="exceptions_critical_action_exception/CriticalActionException-class-sidebar.html">

<div>

# <span class="kind-class">CriticalActionException</span> class

</div>

<div class="section desc markdown">

Exception thrown for critical actions that require special handling.

Extends
[OperationException](https://pub.dev/documentation/graphql/5.2.1/graphql/OperationException-class.html)
to integrate with GraphQL error handling.

</div>

<div class="section">

Inheritance  
- [Object](https://api.flutter.dev/flutter/dart-core/Object-class.html)
- [OperationException](https://pub.dev/documentation/graphql/5.2.1/graphql/OperationException-class.html)
- CriticalActionException

</div>

<div id="constructors" class="section summary offset-anchor">

## Constructors

<span class="name">[CriticalActionException](../exceptions_critical_action_exception/CriticalActionException/CriticalActionException.md)</span><span class="signature">(<span id="-param-actionError" class="parameter"><span class="type-annotation">[String](https://api.flutter.dev/flutter/dart-core/String-class.md)</span> <span class="parameter-name">actionError</span></span>)</span>  
Constructor for
[CriticalActionException](../exceptions_critical_action_exception/CriticalActionException-class.md).

</div>

<div id="instance-properties" class="section summary offset-anchor">

## Properties

<span class="name">[actionError](../exceptions_critical_action_exception/CriticalActionException/actionError.md)</span> <span class="signature">↔ [String](https://api.flutter.dev/flutter/dart-core/String-class.html)</span>  
The error message associated with this critical action.

<div class="features">

<span class="feature">getter/setter pair</span>

</div>

<span class="name">[graphqlErrors](https://pub.dev/documentation/graphql/5.2.1/graphql/OperationException/graphqlErrors.html)</span> <span class="signature">↔ [List](https://api.flutter.dev/flutter/dart-core/List-class.html)<span class="signature">\<<span class="type-parameter">[GraphQLError](https://pub.dev/documentation/gql_exec/1.1.1-alpha+1699813812660/execution/GraphQLError-class.html)</span>\></span></span>  
Any graphql errors returned from the operation

<div class="features">

<span class="feature">getter/setter
pair</span><span class="feature">inherited</span>

</div>

<span class="name">[hashCode](https://api.flutter.dev/flutter/dart-core/Object/hashCode.html)</span> <span class="signature">→ [int](https://api.flutter.dev/flutter/dart-core/int-class.html)</span>  
The hash code for this object.

<div class="features">

<span class="feature">no
setter</span><span class="feature">inherited</span>

</div>

<span class="name">[linkException](https://pub.dev/documentation/graphql/5.2.1/graphql/OperationException/linkException.html)</span> <span class="signature">↔ [LinkException](https://pub.dev/documentation/gql_link/1.0.1-alpha+1730759315378/link/LinkException-class.html)?</span>  
Errors encountered during execution such as network or cache errors

<div class="features">

<span class="feature">getter/setter
pair</span><span class="feature">inherited</span>

</div>

<span class="name">[originalStackTrace](https://pub.dev/documentation/graphql/5.2.1/graphql/OperationException/originalStackTrace.html)</span> <span class="signature">↔ [StackTrace](https://api.flutter.dev/flutter/dart-core/StackTrace-class.html)?</span>  
<div class="features">

<span class="feature">getter/setter
pair</span><span class="feature">inherited</span>

</div>

<span class="name">[raw](https://pub.dev/documentation/graphql/5.2.1/graphql/OperationException/raw.html)</span> <span class="signature">↔ [List](https://api.flutter.dev/flutter/dart-core/List-class.html)?</span>  
<div class="features">

<span class="feature">getter/setter
pair</span><span class="feature">inherited</span>

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

<span class="name">[addError](https://pub.dev/documentation/graphql/5.2.1/graphql/OperationException/addError.html)</span><span class="signature">(<span id="addError-param-error" class="parameter"><span class="type-annotation">[GraphQLError](https://pub.dev/documentation/gql_exec/1.1.1-alpha+1699813812660/execution/GraphQLError-class.md)</span> <span class="parameter-name">error</span></span>) <span class="returntype parameter">→ void</span> </span>  
<div class="features">

<span class="feature">inherited</span>

</div>

<span class="name">[noSuchMethod](https://api.flutter.dev/flutter/dart-core/Object/noSuchMethod.html)</span><span class="signature">(<span id="noSuchMethod-param-invocation" class="parameter"><span class="type-annotation">[Invocation](https://api.flutter.dev/flutter/dart-core/Invocation-class.md)</span> <span class="parameter-name">invocation</span></span>) <span class="returntype parameter">→ dynamic</span> </span>  
Invoked when a nonexistent method or property is accessed.

<div class="features">

<span class="feature">inherited</span>

</div>

<span class="name">[toString](../exceptions_critical_action_exception/CriticalActionException/toString.md)</span><span class="signature"> <span class="returntype parameter">→ [String](https://api.flutter.dev/flutter/dart-core/String-class.html)</span> </span>  
A string representation of this object.

<div class="features">

<span class="feature">override</span>

</div>

</div>

<div id="operators" class="section summary offset-anchor inherited">

## Operators

<span class="name">[operator ==](https://api.flutter.dev/flutter/dart-core/Object/operator_equals.html)</span><span class="signature">(<span id="==-param-other" class="parameter"><span class="type-annotation">[Object](https://api.flutter.dev/flutter/dart-core/Object-class.md)</span> <span class="parameter-name">other</span></span>) <span class="returntype parameter">→ [bool](https://api.flutter.dev/flutter/dart-core/bool-class.html)</span> </span>  
The equality operator.

<div class="features">

<span class="feature">inherited</span>

</div>

</div>

</div>

<div id="dartdoc-sidebar-left" class="sidebar sidebar-offcanvas-left">

<div id="header-search-sidebar" class="hidden-l">

</div>

1.  [talawa](../index.md)
2.  [critical_action_exception](../exceptions_critical_action_exception/exceptions_critical_action_exception-library.md)
3.  CriticalActionException class

<div id="dartdoc-sidebar-left-content">

</div>

</div>

<div id="dartdoc-sidebar-right" class="sidebar sidebar-offcanvas-right">

</div>

</div>

<span class="no-break"> talawa 1.0.0+1 </span>
