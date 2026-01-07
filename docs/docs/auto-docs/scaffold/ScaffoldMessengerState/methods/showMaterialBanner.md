# Method: `showMaterialBanner`

## Description

Shows a [MaterialBanner] across all registered [Scaffold]s. Scaffolds register
 to receive material banners from their closest [ScaffoldMessenger] ancestor.
 If there are several registered scaffolds the material banner is shown
 simultaneously on all of them.

 A scaffold can show at most one material banner at a time. If this function is
 called while another material banner is already visible, the given material banner
 will be added to a queue and displayed after the earlier material banners have
 closed.

 To remove the [MaterialBanner] with an exit animation, use [hideCurrentMaterialBanner]
 or call [ScaffoldFeatureController.close] on the returned
 [ScaffoldFeatureController]. To remove a [MaterialBanner] suddenly (without an
 animation), use [removeCurrentMaterialBanner].

 See [ScaffoldMessenger.of] for information about how to obtain the
 [ScaffoldMessengerState].

 
 Here is an example of showing a [MaterialBanner] when the user presses a button.

 ** See code in examples/api/lib/material/scaffold/scaffold_messenger_state.show_material_banner.0.dart **
 

## Return Type
`ScaffoldFeatureController&lt;MaterialBanner, MaterialBannerClosedReason&gt;`

## Parameters

- `materialBanner`: `MaterialBanner`
