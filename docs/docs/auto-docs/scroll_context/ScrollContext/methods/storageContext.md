# Method: `storageContext`

## Description

The [BuildContext] that should be used when searching for a [PageStorage].

 This context is typically the context of the scrollable widget itself. In
 particular, it should involve any [GlobalKey]s that are dynamically
 created as part of creating the scrolling widget, since those would be
 different each time the widget is created.

## Return Type
`BuildContext`

