# Method: `requiresRootWidgetAttached`

## Description

Whether this command requires the widget tree to be initialized before
 the command may be run.

 This defaults to true to force the application under test to call [runApp]
 before attempting to remotely drive the application. Subclasses may
 override this to return false if they allow invocation before the
 application has started.

 See also:

  * [WidgetsBinding.isRootWidgetAttached], which indicates whether the
    widget tree has been initialized.

## Return Type
`bool`

