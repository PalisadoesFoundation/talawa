# Method: `platformDispatcher`

## Description

The [ui.PlatformDispatcher] to which this binding is bound.

 A number of additional bindings are defined as extensions of
 [BindingBase], e.g., [ServicesBinding], [RendererBinding], and
 [WidgetsBinding]. Each of these bindings define behaviors that interact
 with a [ui.PlatformDispatcher], e.g., [ServicesBinding] registers
 listeners with the [ChannelBuffers], [RendererBinding]
 registers [ui.PlatformDispatcher.onMetricsChanged],
 [ui.PlatformDispatcher.onTextScaleFactorChanged], and [SemanticsBinding]
 registers [ui.PlatformDispatcher.onSemanticsEnabledChanged],
 [ui.PlatformDispatcher.onSemanticsActionEvent], and
 [ui.PlatformDispatcher.onAccessibilityFeaturesChanged] handlers.

 Each of these other bindings could individually access a
 [ui.PlatformDispatcher] statically, but that would preclude the ability to
 test these behaviors with a fake platform dispatcher for verification
 purposes. Therefore, [BindingBase] exposes this [ui.PlatformDispatcher]
 for use by other bindings. A subclass of [BindingBase], such as
 [TestWidgetsFlutterBinding], can override this accessor to return a
 different [ui.PlatformDispatcher] implementation.

## Return Type
`ui.PlatformDispatcher`

