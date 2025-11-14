<div id="overlay-under-drawer">

</div>

<div id="title">

<span id="sidenav-left-toggle" class="material-symbols-outlined"
role="button" tabindex="0">menu</span>

1.  [talawa](../index.md)
2.  [models/funds/fund_pledges.dart](../models_funds_fund_pledges/)
3.  Pledge class

<div class="self-name">

Pledge

</div>

<span id="dark-theme-button" class="material-symbols-outlined"
aria-hidden="true"> dark_mode </span> <span id="light-theme-button"
class="material-symbols-outlined" aria-hidden="true"> light_mode </span>

</div>

<div role="main">

<div id="dartdoc-main-content" class="main-content"
above-sidebar="models_funds_fund_pledges/models_funds_fund_pledges-library-sidebar.html"
below-sidebar="models_funds_fund_pledges/Pledge-class-sidebar.html">

<div>

# <span class="kind-class">Pledge</span> class

</div>

<div class="section desc markdown">

The `Pledge` class represents a pledge for a fundraising campaign in the
application.

</div>

<div id="constructors" class="section summary offset-anchor">

## Constructors

<span class="name">[Pledge.new](../models_funds_fund_pledges/Pledge/Pledge.md)</span><span class="signature"></span>  
Constructs a `Pledge` instance.

<span class="name">[Pledge.fromJson](../models_funds_fund_pledges/Pledge/Pledge.fromJson.md)</span><span class="signature">(<span id="fromJson-param-json" class="parameter"><span class="type-annotation">[Map](https://api.flutter.dev/flutter/dart-core/Map-class.md)<span class="signature">\<<span class="type-parameter">[String](https://api.flutter.dev/flutter/dart-core/String-class.html)</span>, <span class="type-parameter">dynamic</span>\></span></span> <span class="parameter-name">json</span></span>)</span>  
Creates a `Pledge` instance from a JSON object.

<div class="constructor-modifier features">

factory

</div>

</div>

<div id="instance-properties" class="section summary offset-anchor">

## Properties

<span class="name">[amount](../models_funds_fund_pledges/Pledge/amount.md)</span> <span class="signature">→ [int](https://api.flutter.dev/flutter/dart-core/int-class.html)?</span>  
The amount pledged.

<div class="features">

<span class="feature">final</span>

</div>

<span class="name">[campaign](../models_funds_fund_pledges/Pledge/campaign.md)</span> <span class="signature">→ [Campaign](../models_funds_fund_campaign/Campaign-class.md)?</span>  
The campaign associated with the pledge.

<div class="features">

<span class="feature">final</span>

</div>

<span class="name">[creator](../models_funds_fund_pledges/Pledge/creator.md)</span> <span class="signature">→ [User](../models_user_user_info/User-class.md)?</span>  
The user who created the pledge.

<div class="features">

<span class="feature">final</span>

</div>

<span class="name">[currency](../models_funds_fund_pledges/Pledge/currency.md)</span> <span class="signature">→ [String](https://api.flutter.dev/flutter/dart-core/String-class.html)?</span>  
The currency in which the pledge was made.

<div class="features">

<span class="feature">final</span>

</div>

<span class="name">[endDate](../models_funds_fund_pledges/Pledge/endDate.md)</span> <span class="signature">→ [DateTime](https://api.flutter.dev/flutter/dart-core/DateTime-class.html)?</span>  
The end date of the pledge (from campaign).

<div class="features">

<span class="feature">final</span>

</div>

<span class="name">[hashCode](https://api.flutter.dev/flutter/dart-core/Object/hashCode.html)</span> <span class="signature">→ [int](https://api.flutter.dev/flutter/dart-core/int-class.html)</span>  
The hash code for this object.

<div class="features">

<span class="feature">no
setter</span><span class="feature">inherited</span>

</div>

<span class="name">[id](../models_funds_fund_pledges/Pledge/id.md)</span> <span class="signature">→ [String](https://api.flutter.dev/flutter/dart-core/String-class.html)?</span>  
The unique identifier of the pledge.

<div class="features">

<span class="feature">final</span>

</div>

<span class="name">[note](../models_funds_fund_pledges/Pledge/note.md)</span> <span class="signature">→ [String](https://api.flutter.dev/flutter/dart-core/String-class.html)?</span>  
The note associated with the pledge.

<div class="features">

<span class="feature">final</span>

</div>

<span class="name">[pledger](../models_funds_fund_pledges/Pledge/pledger.md)</span> <span class="signature">→ [User](../models_user_user_info/User-class.md)?</span>  
The user who made the pledge.

<div class="features">

<span class="feature">final</span>

</div>

<span class="name">[runtimeType](https://api.flutter.dev/flutter/dart-core/Object/runtimeType.html)</span> <span class="signature">→ [Type](https://api.flutter.dev/flutter/dart-core/Type-class.html)</span>  
A representation of the runtime type of the object.

<div class="features">

<span class="feature">no
setter</span><span class="feature">inherited</span>

</div>

<span class="name">[startDate](../models_funds_fund_pledges/Pledge/startDate.md)</span> <span class="signature">→ [DateTime](https://api.flutter.dev/flutter/dart-core/DateTime-class.html)?</span>  
The start date of the pledge (from campaign).

<div class="features">

<span class="feature">final</span>

</div>

</div>

<div id="instance-methods"
class="section summary offset-anchor inherited">

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
2.  [fund_pledges](../models_funds_fund_pledges/)
3.  Pledge class

##### fund_pledges library

<div id="dartdoc-sidebar-left-content">

</div>

</div>

<div id="dartdoc-sidebar-right" class="sidebar sidebar-offcanvas-right">

</div>

</div>

<span class="no-break"> talawa 1.0.0+1 </span>
