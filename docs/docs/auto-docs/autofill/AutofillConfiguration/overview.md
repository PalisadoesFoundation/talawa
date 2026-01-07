# Overview for `AutofillConfiguration`

## Description

A collection of autofill related information that represents an [AutofillClient].

 Typically used in [TextInputConfiguration.autofillConfiguration].

## Members

- **disabled**: `AutofillConfiguration`
  An [AutofillConfiguration] that indicates the [AutofillClient] does not
 wish to be autofilled.

- **enabled**: `bool`
  Whether autofill should be enabled for the [AutofillClient].

 To retrieve a disabled [AutofillConfiguration], use [disabled].

- **uniqueIdentifier**: `String`
  A string that uniquely identifies the current [AutofillClient].

 The identifier needs to be unique within the [AutofillScope] for the
 [AutofillClient] to receive the correct autofill value.

- **autofillHints**: `List&lt;String&gt;`
  A list of strings that helps the autofill service identify the type of the
 [AutofillClient].

 
 For the best results, hint strings need to be understood by the platform's
 autofill service. The common values of hint strings can be found in
 [AutofillHints], as well as their availability on different platforms.

 If an autofillable input field needs to use a custom hint that translates to
 different strings on different platforms, the easiest way to achieve that
 is to return different hint strings based on the value of
 [defaultTargetPlatform].

 Each hint in the list, if not ignored, will be translated to the platform's
 autofill hint type understood by its autofill services:

 * On iOS, only the first hint in the list is accounted for. The hint will
   be translated to a
   [UITextContentType](https://developer.apple.com/documentation/uikit/uitextcontenttype).

 * On Android, all hints in the list are translated to Android hint strings.

 * On web, only the first hint is accounted for and will be translated to
   an "autocomplete" string.

 Providing an autofill hint that is predefined on the platform does not
 automatically grant the input field eligibility for autofill. Ultimately,
 it comes down to the autofill service currently in charge to determine
 whether an input field is suitable for autofill and what the autofill
 candidates are.

 See also:

 * [AutofillHints], a list of autofill hint strings that is predefined on at
   least one platform.

 * [UITextContentType](https://developer.apple.com/documentation/uikit/uitextcontenttype),
   the iOS equivalent.

 * Android [autofillHints](https://developer.android.com/reference/android/view/View#setAutofillHints(java.lang.String...)),
   the Android equivalent.

 * The [autocomplete](https://developer.mozilla.org/en-US/docs/Web/HTML/Attributes/autocomplete) attribute,
   the web equivalent.
 

- **currentEditingValue**: `TextEditingValue`
  The current [TextEditingValue] of the [AutofillClient].

- **hintText**: `String?`
  The optional hint text placed on the view that typically suggests what
 sort of input the field accepts, for example "enter your password here".

 If the developer does not specify any [autofillHints], the [hintText] can
 be a useful indication to the platform autofill service.

## Constructors

### Unnamed Constructor
Creates autofill related configuration information that can be sent to the
 platform.

### _


#### Parameters

- ``: `dynamic`
- ``: `dynamic`
- ``: `dynamic`
- ``: `dynamic`
- ``: `dynamic`
