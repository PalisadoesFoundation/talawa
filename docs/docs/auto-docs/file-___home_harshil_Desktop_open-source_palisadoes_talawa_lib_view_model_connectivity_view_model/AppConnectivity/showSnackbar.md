




showSnackbar method - AppConnectivity class - connectivity\_view\_model library - Dart API







menu

1. [talawa](../../index.html)
2. [view\_model/connectivity\_view\_model.dart](../../file-___home_harshil_Desktop_open-source_palisadoes_talawa_lib_view_model_connectivity_view_model/)
3. [AppConnectivity](../../file-___home_harshil_Desktop_open-source_palisadoes_talawa_lib_view_model_connectivity_view_model/AppConnectivity-class.html)
4. showSnackbar static method

showSnackbar


dark\_mode

light\_mode




# showSnackbar static method


void
showSnackbar({

1. required [bool](https://api.flutter.dev/flutter/dart-core/bool-class.html) isOnline,

})

Triggers the snackbar UI to show online status.

**params**:

* `isOnline`: online status of the device.

**returns**:
None


## Implementation

```
static void showSnackbar({required bool isOnline}) {
  final context = navigationService.navigatorKey.currentContext;
  if (context != null) {
    final TextStyle customStyle = Theme.of(context).textTheme.bodyMedium!;
    if (isOnline) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          duration: const Duration(seconds: 5),
          backgroundColor: Colors.green,
          content: Text(
            'You are back online!',
            style: customStyle,
          ),
        ),
      );
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          duration: const Duration(seconds: 5),
          backgroundColor: const Color.fromRGBO(65, 65, 66, 1),
          content: RichText(
            text: TextSpan(
              children: [
                TextSpan(
                  text: 'You are ',
                  style: Theme.of(context)
                      .textTheme
                      .bodySmall!
                      .copyWith(color: Colors.white),
                ),
                TextSpan(
                  text: 'Offline!',
                  style: customStyle.copyWith(color: Colors.green),
                ),
              ],
            ),
          ),
        ),
      );
    }
  }
}
```

 


1. [talawa](../../index.html)
2. [connectivity\_view\_model](../../file-___home_harshil_Desktop_open-source_palisadoes_talawa_lib_view_model_connectivity_view_model/)
3. [AppConnectivity](../../file-___home_harshil_Desktop_open-source_palisadoes_talawa_lib_view_model_connectivity_view_model/AppConnectivity-class.html)
4. showSnackbar static method

##### AppConnectivity class





talawa
1.0.0+1






