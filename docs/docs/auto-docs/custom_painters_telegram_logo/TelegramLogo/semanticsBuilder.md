<div id="overlay-under-drawer">

</div>

<div id="title">

<span id="sidenav-left-toggle" class="material-symbols-outlined"
role="button" tabindex="0">menu</span>

1.  [talawa](../../index.md)
2.  [custom_painters/telegram_logo.dart](../../custom_painters_telegram_logo/custom_painters_telegram_logo-library.md)
3.  [TelegramLogo](../../custom_painters_telegram_logo/TelegramLogo-class.md)
4.  semanticsBuilder property

<div class="self-name">

semanticsBuilder

</div>

<div id="theme-button" class="toggle" title="Toggle brightness">

<span id="dark-theme-button" class="material-symbols-outlined">
dark_mode </span> <span id="light-theme-button"
class="material-symbols-outlined"> light_mode </span>

</div>

</div>

<div role="main">

<div id="dartdoc-main-content" class="main-content"
above-sidebar="custom_painters_telegram_logo/TelegramLogo-class-sidebar.html"
below-sidebar="">

<div>

# <span class="kind-property">semanticsBuilder</span> property

</div>

<div id="getter" class="section">

<div class="section multi-line-signature">

<span class="returntype">SemanticsBuilderCallback?</span>
<span class="name">semanticsBuilder</span>

<div class="features">

<span class="feature">inherited</span>

</div>

</div>

<div class="section desc markdown">

Returns a function that builds semantic information for the picture
drawn by this painter.

If the returned function is null, this painter will not contribute new
`SemanticsNode`s to the semantics tree and the `CustomPaint`
corresponding to this painter will not create a semantics boundary.
However, if the child of a `CustomPaint` is not null, the child may
contribute `SemanticsNode`s to the tree.

See also:

- `SemanticsConfiguration.isSemanticBoundary`, which causes new
  `SemanticsNode`s to be added to the semantics tree.
- `RenderCustomPaint`, which uses this getter to build semantics.

</div>

<div id="source" class="section summary source-code">

## Implementation

``` language-dart
SemanticsBuilderCallback? get semanticsBuilder => null;
```

</div>

</div>

</div>

<div id="dartdoc-sidebar-left" class="sidebar sidebar-offcanvas-left">

<div id="header-search-sidebar" class="hidden-l">

</div>

1.  [talawa](../../index.md)
2.  [telegram_logo](../../custom_painters_telegram_logo/custom_painters_telegram_logo-library.md)
3.  [TelegramLogo](../../custom_painters_telegram_logo/TelegramLogo-class.md)
4.  semanticsBuilder property

##### TelegramLogo class

<div id="dartdoc-sidebar-left-content">

</div>

</div>

<div id="dartdoc-sidebar-right" class="sidebar sidebar-offcanvas-right">

</div>

</div>

<span class="no-break"> talawa 1.0.0+1 </span>
