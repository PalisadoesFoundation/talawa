<div id="overlay-under-drawer">

</div>

<div id="title">

<span id="sidenav-left-toggle" class="material-symbols-outlined"
role="button" tabindex="0">menu</span>

1.  [talawa](../index.md)
2.  [fund_campaign](../models_funds_fund_campaign/models_funds_fund_campaign-library.md)
3.  Campaign class

<div class="self-name">

Campaign

</div>

<div id="theme-button" class="toggle">

<span id="dark-theme-button" class="material-symbols-outlined">
brightness_4 </span> <span id="light-theme-button"
class="material-symbols-outlined"> brightness_5 </span>

</div>

</div>

<div role="main">

<div id="dartdoc-main-content" class="main-content"
above-sidebar="models_funds_fund_campaign/models_funds_fund_campaign-library-sidebar.html"
below-sidebar="models_funds_fund_campaign/Campaign-class-sidebar.html">

<div>

# <span class="kind-class">Campaign</span> class

</div>

<div class="section desc markdown">

The `Campaign` class represents a fundraising campaign in the
application.

</div>

<div id="constructors" class="section summary offset-anchor">

## Constructors

<span class="name">[Campaign](../models_funds_fund_campaign/Campaign/Campaign.md)</span><span class="signature">(<span id="-param-id" class="parameter"></span>)</span>  
Constructs a `FundraisingCampaign` instance.

<span class="name">[Campaign.fromJson](../models_funds_fund_campaign/Campaign/Campaign.fromJson.md)</span><span class="signature">(<span id="fromJson-param-json" class="parameter"><span class="type-annotation">[Map](https://api.flutter.dev/flutter/dart-core/Map-class.md)<span class="signature">\<<span class="type-parameter">[String](https://api.flutter.dev/flutter/dart-core/String-class.html)</span>, <span class="type-parameter">dynamic</span>\></span></span> <span class="parameter-name">json</span></span>)</span>  
Creates a `Campaign` instance from a JSON object.

<div class="constructor-modifier features">

factory

</div>

</div>

<div id="instance-properties" class="section summary offset-anchor">

## Properties

<span class="name">[currency](../models_funds_fund_campaign/Campaign/currency.md)</span> <span class="signature">→ [String](https://api.flutter.dev/flutter/dart-core/String-class.html)?</span>  
The currency used for the campaign.

<div class="features">

<span class="feature">final</span>

</div>

<span class="name">[endDate](../models_funds_fund_campaign/Campaign/endDate.md)</span> <span class="signature">→ [DateTime](https://api.flutter.dev/flutter/dart-core/DateTime-class.html)?</span>  
The end date of the campaign.

<div class="features">

<span class="feature">final</span>

</div>

<span class="name">[fundId](../models_funds_fund_campaign/Campaign/fundId.md)</span> <span class="signature">→ [String](https://api.flutter.dev/flutter/dart-core/String-class.html)?</span>  
The identifier of the fund to which the campaign belongs.

<div class="features">

<span class="feature">final</span>

</div>

<span class="name">[goalAmount](../models_funds_fund_campaign/Campaign/goalAmount.md)</span> <span class="signature">→ [double](https://api.flutter.dev/flutter/dart-core/double-class.html)?</span>  
The funding goal of the campaign.

<div class="features">

<span class="feature">final</span>

</div>

<span class="name">[hashCode](https://api.flutter.dev/flutter/dart-core/Object/hashCode.html)</span> <span class="signature">→ [int](https://api.flutter.dev/flutter/dart-core/int-class.html)</span>  
The hash code for this object.

<div class="features">

<span class="feature">no
setter</span><span class="feature">inherited</span>

</div>

<span class="name">[id](../models_funds_fund_campaign/Campaign/id.md)</span> <span class="signature">→ [String](https://api.flutter.dev/flutter/dart-core/String-class.html)?</span>  
The unique identifier of the campaign.

<div class="features">

<span class="feature">final</span>

</div>

<span class="name">[name](../models_funds_fund_campaign/Campaign/name.md)</span> <span class="signature">→ [String](https://api.flutter.dev/flutter/dart-core/String-class.html)?</span>  
The name of the campaign.

<div class="features">

<span class="feature">final</span>

</div>

<span class="name">[pledgedAmount](../models_funds_fund_campaign/Campaign/pledgedAmount.md)</span> <span class="signature">→ [double](https://api.flutter.dev/flutter/dart-core/double-class.html)?</span>  
Total amount of money pledged under the fund campaign.

<div class="features">

<span class="feature">final</span>

</div>

<span class="name">[pledges](../models_funds_fund_campaign/Campaign/pledges.md)</span> <span class="signature">→ [List](https://api.flutter.dev/flutter/dart-core/List-class.html)<span class="signature">\<<span class="type-parameter">[Pledge](../models_funds_fund_pledges/Pledge-class.md)</span>\></span>?</span>  
A list of pledge identifiers associated with the campaign.

<div class="features">

<span class="feature">final</span>

</div>

<span class="name">[runtimeType](https://api.flutter.dev/flutter/dart-core/Object/runtimeType.html)</span> <span class="signature">→ [Type](https://api.flutter.dev/flutter/dart-core/Type-class.html)</span>  
A representation of the runtime type of the object.

<div class="features">

<span class="feature">no
setter</span><span class="feature">inherited</span>

</div>

<span class="name">[startDate](../models_funds_fund_campaign/Campaign/startDate.md)</span> <span class="signature">→ [DateTime](https://api.flutter.dev/flutter/dart-core/DateTime-class.html)?</span>  
The start date of the campaign.

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
2.  [fund_campaign](../models_funds_fund_campaign/models_funds_fund_campaign-library.md)
3.  Campaign class

<div id="dartdoc-sidebar-left-content">

</div>

</div>

<div id="dartdoc-sidebar-right" class="sidebar sidebar-offcanvas-right">

</div>

</div>

<span class="no-break"> talawa 1.0.0+1 </span>
