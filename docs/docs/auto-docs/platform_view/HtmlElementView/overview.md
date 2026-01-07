# Overview for `HtmlElementView`

## Description

Embeds an HTML element in the Widget hierarchy in Flutter web.

 The embedded HTML is laid out like any other Flutter widget and
 transformations (like opacity, and clipping) apply to it as well.

 

 Embedding HTML is a _potentially expensive_ operation and should be avoided
 when a Flutter equivalent is possible. (See **`isVisible` parameter** below.)
 This widget is useful to integrate native HTML elements to a Flutter web app,
 like a `<video>` tag, or a `<div>` where a [Google Map](https://pub.dev/packages/google_maps_flutter)
 can be rendered.

 This widget **only works on Flutter web.** To embed web content on other
 platforms, consider using the [`webview_flutter` plugin](https://pub.dev/packages/webview_flutter).

 ## Usage

 There's two ways to use the `HtmlElementView` widget:

 ### `HtmlElementView.fromTagName`

 The [HtmlElementView.fromTagName] constructor creates the HTML element
 specified by `tagName`, and passes it to the `onElementCreated` callback
 where it can be customized:

 ```dart
 // In a `build` method...
 HtmlElementView.fromTagName(
   tagName: 'div',
   onElementCreated: myOnElementCreated,
 );
 ```

 The example creates a `<div>` element, then calls the `onElementCreated`
 callback with the created `<div>`, so it can be customized **before** it is
 attached to the DOM.

 (See more details about `onElementCreated` in the **Lifecycle** section below.)

 ### Using the `PlatformViewRegistry`

 The primitives used to implement [HtmlElementView.fromTagName] are available
 for general use through `dart:ui_web`'s `platformViewRegistry`.

 Creating an `HtmlElementView` through these primitives is a two step process:

 #### 1. `registerViewFactory`

 First, a `viewFactory` function needs to be registered for a given `viewType`.
 Flutter web will call this factory function to create the `element` that will
 be attached later:

 ```dart
 import 'dart:ui_web' as ui_web;
 import 'package:web/web.dart' as web;

 void  
 ```

 `registerViewFactory` **must** be called outside of `build` methods, so the
 registered function is available when `build` happens.

 See the different types of functions that can be used as `viewFactory`:

 * [`typedef ui_web.PlatformViewFactory`](https://api.flutter.dev/flutter/dart-ui_web/PlatformViewFactory.html)
 * [`typedef ui_web.ParameterizedPlatformViewFactory`](https://api.flutter.dev/flutter/dart-ui_web/ParameterizedPlatformViewFactory.html)

 #### 2. `HtmlElementView` widget

 Once a factory is registered, an `HtmlElementView` widget of `viewType` can
 be added to the widget tree, like so:

 ```dart
 // In a `build` method...
 const HtmlElementView(
   viewType: 'my-view-type',
   onPlatformViewCreated: myOnPlatformViewCreated,
   creationParams: <String, Object?>,
 );
 ```

 [viewType] **must** match the value used to `registerViewFactory` before.

 [creationParams] (optional) will be passed to your `viewFactory` function,
 if it accepts them.

 [onPlatformViewCreated] will be called with the `viewId` of the platform
 view (`element`) created by the `viewFactory`, before it gets attached to
 the DOM.

 The `viewId` can be used to retrieve the created `element` (The same one
 passed to `onElementCreated` in [HtmlElementView.fromTagName]) with the
 `ui_web.platformViewRegistry.`[`getViewById` method](https://api.flutter.dev/flutter/dart-ui_web/PlatformViewRegistry/getViewById.html).

 (See more details about `onPlatformViewCreated` in the **Lifecycle** section
 below.)

 ## Lifecycle

 `HtmlElementView` widgets behave like any other Flutter stateless widget, but
 with an additional lifecycle method: `onPlatformViewCreated` / `onElementCreated`
 (depending on the constructor, see **Usage** above).

 The difference between the two callbacks is the parameter they receive:

 * `onPlatformViewCreated` will be called with the created `viewId` as a parameter,
   and needs `ui_web.platformViewRegistry.getViewById` to retrieve the created
   element (See [PlatformViewCreatedCallback]).
 * `onElementCreated` will be called with the created `element` directly,
   skipping its `viewId` (See [ElementCreatedCallback]).

 Both callbacks are called **after** the HTML `element` has been created, but
 **before** it's attached to the DOM.

 ### HTML Lifecycle

 The Browser DOM APIs have additional HTML lifecycle callbacks for the root
 `element` of an `HtmlElementView`.

 #### Element Attached To The DOM

 It is common for JS code to locate the DOM elements they need with a
 selector, rather than accepting said DOM elements directly. In those cases,
 the `element` **must** be attached to the DOM for the selector to work.

 The example below demonstrates **how to create an `onElementAttached` function**
 that gets called when the root `element` is attached to the DOM using a
 `ResizeObserver` through `package:web` from the `onElementCreated` lifecycle
 method:

 ```dart
 import 'dart:js_interop';
 import 'package:web/web.dart' as web;

 // Called after `element` is attached to the DOM.
 void onElementAttached(web.HTMLDivElement element) 

 void onElementCreated(Object element) 
 ```

 * Read more about [`ResizeObserver` in the MDN](https://developer.mozilla.org/en-US/docs/Web/API/Resize_Observer_API).

 #### Other Observers

 The example above uses a `ResizeObserver` because it can be applied directly
 to the `element` that is about to be attached. Another observer that could
 be used for this (with a little bit more code) would be a
 [`MutationObserver`](https://developer.mozilla.org/en-US/docs/Web/API/MutationObserver).

 The `MutationObserver` requires the parent element in which the `HtmlElementView`
 is going to be inserted. A safe way to retrieve a parent element for the
 platform view is to retrieve the `hostElement` of the [FlutterView] where the
 `HtmlElementView` is being rendered.

 The `hostElement` of the current [FlutterView] can be retrieved through:

 ```dart
 import 'dart:js_interop';
 import 'dart:ui_web' as ui_web;
 import 'package:flutter/widgets.dart';

 void useHostElement(BuildContext context) 
 ```

 **Important:** `FlutterView.viewId` and the `viewId` parameter passed to
 the `viewFactory` identify **different objects**:

 * `flutterViewId` (from `View.of(context)`) represents the [FlutterView]
   where the web app is currently rendering.
 * `viewId` (passed to the `viewFactory` function) represents a unique ID
   for the `HtmlElementView` instance that is being attached to the app.

 Read more about [FlutterView] on Flutter's API docs:

 * [`View.of`](https://api.flutter.dev/flutter/widgets/View/of.html)
 * [`getHostElement`](https://main-api.flutter.dev/flutter/dart-ui_web/FlutterViewManagerProxy/getHostElement.html)

 ## Pointer events

 In order for the `HtmlElementView` contents to be interactive, they're allowed
 to handle `pointer-events`. This may result in Flutter missing some events
 because they've been handled by the `HtmlElementView`, and not seen by
 Flutter.

 [`package:pointer_interceptor`](https://pub.dev/packages/pointer_interceptor)
 may help in some cases where Flutter content needs to be overlaid on top of
 an `HtmlElementView`. Alternatively, the `pointer-events: none` property can
 be set `onElementCreated`; but that will prevent **ALL** interactions with
 the underlying HTML content.

 If the `HtmlElementView` is an `<iframe>` element, Flutter will not receive
 pointer events that land in the `<iframe>` (click/tap, drag, drop, etc.)
 In those cases, the `HtmlElementView` will seem like it's _swallowing_
 the events and not participating in Flutter's gesture detection.

 ## `isVisible` parameter

 Rendering custom HTML content (from `HtmlElementView`) in between `canvas`
 pixels means that the Flutter web engine needs to _split_ the canvas drawing
 into elements drawn _behind_ the HTML content, and those drawn _above_ it.

 In the Flutter web engine, each of these _splits of the canvas to sandwich
 HTML content in between_ is referred to as an **overlay**.

 Each _overlay_ present in a scene has implications both in memory and
 execution performance, and it is best to minimize their amount; browsers
 support a limited number of _overlays_ on a single scene at a given time.

 `HtmlElementView` objects have an `isVisible` property that can be passed
 through `registerViewFactory`, or `fromTagName`. `isVisible` refers
 to whether the `HtmlElementView` will paint pixels on the screen or not.

 Correctly defining this value helps the Flutter web rendering engine optimize
 the amount of _overlays_ it'll need to render a particular scene.

 In general, `isVisible` should be left to its default value of `true`, but
 in some `HtmlElementView`s (like the `pointer_interceptor` or `Link` widget),
 it can be set to `false`, so the engine doesn't _waste_ an overlay to render
 Flutter content on top of views that don't paint any pixels.

## Dependencies

- StatelessWidget

## Members

- **viewType**: `String`
  The unique identifier for the HTML view type to be embedded by this widget.

 A PlatformViewFactory for this type must have been registered.

- **onPlatformViewCreated**: `PlatformViewCreatedCallback?`
  Callback to invoke after the platform view has been created.

 This method is called *before* the platform view is attached to the DOM.

 May be null.

- **creationParams**: `Object?`
  Passed as the 2nd argument (i.e. `params`) of the registered view factory.

- **hitTestBehavior**: `PlatformViewHitTestBehavior`
  

## Constructors

### Unnamed Constructor
Creates a platform view for Flutter web.

 `viewType` identifies the type of platform view to create.

### fromTagName
Creates a platform view that creates a DOM element specified by [tagName].

 [isVisible] indicates whether the view is visible to the user or not.
 Setting this to false allows the rendering pipeline to perform extra
 optimizations knowing that the view will not result in any pixels painted
 on the screen.

 [onElementCreated] is called when the DOM element is created. It can be
 used by the app to customize the element by adding attributes and styles.
 This method is called *before* the element is attached to the DOM.

#### Parameters

- ``: `dynamic`
- ``: `dynamic`
- ``: `dynamic`
- ``: `dynamic`
- ``: `dynamic`
