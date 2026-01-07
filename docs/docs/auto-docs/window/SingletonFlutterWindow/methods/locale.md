# Method: `locale`

## Description

The system-reported default locale of the device.

 
 Accessing this value returns the value contained in the
 [PlatformDispatcher] singleton, so instead of getting it from here, you
 should consider getting it from
 `WidgetsBinding.instance.platformDispatcher` instead (or, when
 `WidgetsBinding` isn't available, from [PlatformDispatcher.instance]). The
 reason this value forwards to the [PlatformDispatcher] is to provide
 convenience for applications that only use a single main window.
 

 This establishes the language and formatting conventions that window
 should, if possible, use to render their user interface.

 This is the first locale selected by the user and is the user's primary
 locale (the locale the device UI is displayed in)

 This is equivalent to `locales.first` and will provide an empty non-null
 locale if the [locales] list has not been set or is empty.

## Return Type
`Locale`

