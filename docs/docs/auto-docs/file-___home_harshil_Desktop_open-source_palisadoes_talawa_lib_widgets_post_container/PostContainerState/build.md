




build method - PostContainerState class - post\_container library - Dart API







menu

1. [talawa](../../index.html)
2. [widgets/post\_container.dart](../../file-___home_harshil_Desktop_open-source_palisadoes_talawa_lib_widgets_post_container/)
3. [PostContainerState](../../file-___home_harshil_Desktop_open-source_palisadoes_talawa_lib_widgets_post_container/PostContainerState-class.html)
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
  return VisibilityDetector(
    key: Key(Random().nextInt(1000).toString()),
    onVisibilityChanged: (info) {
      info.visibleFraction > 0.5 ? inView = true : inView = false;
      if (mounted) setState(() {});
    },
    child: Center(
      child: widget.photoUrl != null
          ? Image.network(widget.photoUrl!)
          : Container(),
    ),
  );
}
```

 


1. [talawa](../../index.html)
2. [post\_container](../../file-___home_harshil_Desktop_open-source_palisadoes_talawa_lib_widgets_post_container/)
3. [PostContainerState](../../file-___home_harshil_Desktop_open-source_palisadoes_talawa_lib_widgets_post_container/PostContainerState-class.html)
4. build method

##### PostContainerState class





talawa
1.0.0+1






