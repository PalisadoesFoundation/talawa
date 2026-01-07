# Method: `page`

## Description

The current page displayed in the controlled [PageView].

 There are circumstances that this [PageController] can't know the current
 page. Reading [page] will throw an [AssertionError] in the following cases:

 1. No [PageView] is currently using this [PageController]. Once a
 [PageView] starts using this [PageController], the new [page]
 position will be derived:

   * First, based on the attached [PageView]'s [BuildContext] and the
     position saved at that context's [PageStorage] if [keepPage] is true.
   * Second, from the [PageController]'s [initialPage].

 2. More than one [PageView] using the same [PageController].

 The [hasClients] property can be used to check if a [PageView] is attached
 prior to accessing [page].

## Return Type
`double?`

