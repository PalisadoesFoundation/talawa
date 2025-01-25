




build method - PostBottomModal class - post\_modal library - Dart API







menu

1. [talawa](../../index.html)
2. [widgets/post\_modal.dart](../../file-___home_harshil_Desktop_open-source_palisadoes_talawa_lib_widgets_post_modal/)
3. [PostBottomModal](../../file-___home_harshil_Desktop_open-source_palisadoes_talawa_lib_widgets_post_modal/PostBottomModal-class.html)
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
  return Column(
    children: [
      Center(
        child: Row(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.fromLTRB(20, 0, 0, 0),
              child: Icon(
                Icons.report_gmailerrorred_outlined,
                color: Theme.of(context).colorScheme.tertiary,
              ),
            ),
            TextButton(
              key: const Key('reportPost'),
              onPressed: () {
                navigationService.showTalawaErrorSnackBar(
                  'Your Report has been sent to the Admin',
                  MessageType.info,
                );
                Navigator.pop(context);
              },
              child: Text(
                'Report the post to the Admin',
                style: Theme.of(context).textTheme.bodyLarge,
              ),
            ),
          ],
        ),
      ),
      Center(
        child: Row(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.fromLTRB(20, 0, 0, 0),
              child: Icon(
                Icons.delete,
                color: Theme.of(context).colorScheme.tertiary,
              ),
            ),
            TextButton(
              key: const Key('deletePost'),
              onPressed: () {
                showDialog(
                  context: context,
                  builder: (BuildContext builder) {
                    return AlertDialog(
                      title: const Text("Warning"),
                      content: const Text(
                        "Do you really want to delete the post?",
                      ),
                      actions: <Widget>[
                        TextButton(
                          key: const Key('alert_dialog_yes_btn'),
                          onPressed: () {
                            navigationService.pop();
                            deletePost?.call(post);
                            navigationService.pop();
                            navigationService.pushDialog(
                              const CustomProgressDialog(
                                key: Key('deletePost'),
                              ),
                            );
                          },
                          child: const Text("Yes"),
                        ),
                        TextButton(
                          key: const Key('alert_dialog_no_btn'),
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          child: const Text("No"),
                        ),
                      ],
                    );
                  },
                );
              },
              child: Text(
                'The post was deleted',
                style: Theme.of(context).textTheme.bodyLarge,
              ),
            ),
          ],
        ),
      ),
    ],
  );
}
```

 


1. [talawa](../../index.html)
2. [post\_modal](../../file-___home_harshil_Desktop_open-source_palisadoes_talawa_lib_widgets_post_modal/)
3. [PostBottomModal](../../file-___home_harshil_Desktop_open-source_palisadoes_talawa_lib_widgets_post_modal/PostBottomModal-class.html)
4. build method

##### PostBottomModal class





talawa
1.0.0+1






