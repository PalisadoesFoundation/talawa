# Method: `locales`

## Description

The full system-reported supported locales of the device.

 

 This establishes the language and formatting conventions that window
 should, if possible, use to render their user interface.

 The list is ordered in order of priority, with lower-indexed locales being
 preferred over higher-indexed ones. The first element is the primary [locale].

 The [onLocaleChanged] callback is called whenever this value changes.

 See also:

  * [WidgetsBindingObserver], for a mechanism at the widgets layer to
    observe when this value changes.

## Return Type
`List&lt;Locale&gt;`

