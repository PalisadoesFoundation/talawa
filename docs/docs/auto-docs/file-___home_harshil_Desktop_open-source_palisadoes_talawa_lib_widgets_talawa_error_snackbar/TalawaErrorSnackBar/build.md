




build method - TalawaErrorSnackBar class - talawa\_error\_snackbar library - Dart API







menu

1. [talawa](../../index.html)
2. [widgets/talawa\_error\_snackbar.dart](../../file-___home_harshil_Desktop_open-source_palisadoes_talawa_lib_widgets_talawa_error_snackbar/)
3. [TalawaErrorSnackBar](../../file-___home_harshil_Desktop_open-source_palisadoes_talawa_lib_widgets_talawa_error_snackbar/TalawaErrorSnackBar-class.html)
4. build method

build


dark\_mode

light\_mode




# build method


1. @[override](https://api.flutter.dev/flutter/dart-core/override-constant.html)

dynamic
build(

1. dynamic context

)

## Implementation

```
@override
Widget build(BuildContext context) {
  final ScrollController scrollController = ScrollController();

  WidgetsBinding.instance.addPostFrameCallback((_) {
    scrollController.animateTo(
      scrollController.position.maxScrollExtent,
      duration: duration,
      curve: Curves.linear,
    );
  });

  return Row(
    children: [
      Container(
        width: 20,
        height: 80,
        decoration: BoxDecoration(
          color: messageType == MessageType.error
              ? Colors.red
              : messageType == MessageType.warning
                  ? Colors.yellow
                  : messageType == MessageType.info
                      ? Colors.green
                      : Colors.red,
        ),
      ),
      const SizedBox(
        width: 10,
      ),
      Icon(
        messageType == MessageType.error
            ? Icons.error
            : messageType == MessageType.warning
                ? Icons.error
                : messageType == MessageType.info
                    ? Icons.info_outline
                    : Icons.error,
        // Icons.error,
        color: messageType == MessageType.error
            ? Colors.red
            : messageType == MessageType.warning
                ? Colors.yellow
                : messageType == MessageType.info
                    ? Colors.green
                    : Colors.red,
        size: 35,
      ),
      const SizedBox(
        width: 10,
      ),
      Expanded(
        flex: 1,
        child: SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          controller: scrollController,
          child: Text(
            AppLocalizations.of(context)!.strictTranslate(errorMessage),
            style: const TextStyle(color: Colors.white),
          ),
        ),
      ),
    ],
  );
}
```

 


1. [talawa](../../index.html)
2. [talawa\_error\_snackbar](../../file-___home_harshil_Desktop_open-source_palisadoes_talawa_lib_widgets_talawa_error_snackbar/)
3. [TalawaErrorSnackBar](../../file-___home_harshil_Desktop_open-source_palisadoes_talawa_lib_widgets_talawa_error_snackbar/TalawaErrorSnackBar-class.html)
4. build method

##### TalawaErrorSnackBar class





talawa
1.0.0+1






