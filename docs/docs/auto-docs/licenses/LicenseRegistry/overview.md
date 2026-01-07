# Overview for `LicenseRegistry`

## Description

A registry for packages to add licenses to, so that they can be displayed
 together in an interface such as the [LicensePage].

 Packages can register their licenses using [addLicense]. User interfaces
 that wish to show all the licenses can obtain them by calling [licenses].

 The flutter tool will automatically collect the contents of all the LICENSE
 files found at the root of each package into a single LICENSE file in the
 default asset bundle. Each license in that file is separated from the next
 by a line of eighty hyphens (`-`), and begins with a list of package names
 that the license applies to, one to a line, separated from the next by a
 blank line. The `services` package registers a license collector that splits
 that file and adds each entry to the registry.

 The LICENSE files in each package can either consist of a single license, or
 can be in the format described above. In the latter case, each component
 license and list of package names is merged independently.

 See also:

  * [showAboutDialog], which shows a Material-style dialog with information
    about the application, including a button that shows a [LicensePage] that
    uses this API to select licenses to show.
  * [AboutListTile], which is a widget that can be added to a [Drawer]. When
    tapped it calls [showAboutDialog].

## Members

- **_collectors**: `List&lt;LicenseEntryCollector&gt;?`
