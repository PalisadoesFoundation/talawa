




build method - PinnedPost class - pinned\_post library - Dart API







menu

1. [talawa](../../index.html)
2. [widgets/pinned\_post.dart](../../widgets_pinned_post/widgets_pinned_post-library.html)
3. [PinnedPost](../../widgets_pinned_post/PinnedPost-class.html)
4. build method

build


dark\_mode

light\_mode




# build method


1. @override

[Widget](https://api.flutter.dev/flutter/widgets/Widget-class.html)
build(

1. [BuildContext](https://api.flutter.dev/flutter/widgets/BuildContext-class.html) context

)
override

Describes the part of the user interface represented by this widget.

The framework calls this method when this widget is inserted into the tree
in a given [BuildContext](https://api.flutter.dev/flutter/widgets/BuildContext-class.html) and when the dependencies of this widget change
(e.g., an [InheritedWidget](https://api.flutter.dev/flutter/widgets/InheritedWidget-class.html) referenced by this widget changes). This
method can potentially be called in every frame and should not have any side
effects beyond building a widget.

The framework replaces the subtree below this widget with the widget
returned by this method, either by updating the existing subtree or by
removing the subtree and inflating a new subtree, depending on whether the
widget returned by this method can update the root of the existing
subtree, as determined by calling [Widget.canUpdate](https://api.flutter.dev/flutter/widgets/Widget/canUpdate.html).

Typically implementations return a newly created constellation of widgets
that are configured with information from this widget's constructor and
from the given [BuildContext](https://api.flutter.dev/flutter/widgets/BuildContext-class.html).

The given [BuildContext](https://api.flutter.dev/flutter/widgets/BuildContext-class.html) contains information about the location in the
tree at which this widget is being built. For example, the context
provides the set of inherited widgets for this location in the tree. A
given widget might be built with multiple different [BuildContext](https://api.flutter.dev/flutter/widgets/BuildContext-class.html)
arguments over time if the widget is moved around the tree or if the
widget is inserted into the tree in multiple places at once.

The implementation of this method must only depend on:

* the fields of the widget, which themselves must not change over time,
  and
* any ambient state obtained from the `context` using
  [BuildContext.dependOnInheritedWidgetOfExactType](https://api.flutter.dev/flutter/widgets/BuildContext/dependOnInheritedWidgetOfExactType.html).

If a widget's [build](../../widgets_pinned_post/PinnedPost/build.html) method is to depend on anything else, use a
[StatefulWidget](https://api.flutter.dev/flutter/widgets/StatefulWidget-class.html) instead.

See also:

* [StatelessWidget](https://api.flutter.dev/flutter/widgets/StatelessWidget-class.html), which contains the discussion on performance considerations.

## Implementation

```
@override
Widget build(BuildContext context) {
  return Container(
    key: const Key('hello'),
    child: pinnedPost.isNotEmpty
        ? SizedBox(
            height: SizeConfig.screenHeight! * 0.28,
            child: ListView.builder(
              itemCount: pinnedPost.length,
              shrinkWrap: true,
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) => Padding(
                key: index == 0 ? model.keySHPinnedPost : const Key(''),
                padding: const EdgeInsets.only(
                  left: 10,
                  top: 7,
                ),
                child: GestureDetector(
                  onTap: () {
                    // final Map<String, dynamic> arg = {"index": "$index","post": pinnedPost};
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => PinnedPostScreen(
                          post: toMap(index),
                        ),
                      ),
                    );
                  },
                  child: SizedBox(
                    width: SizeConfig.screenWidth! / 4.1,
                    child: Column(
                      children: [
                        Expanded(
                          child: CachedNetworkImage(
                            cacheKey: pinnedPost[index].sId,
                            imageUrl:
                                (pinnedPost[index].imageUrl ?? '').isEmpty
                                    ? 'placeHolderUrl'
                                    : pinnedPost[index].imageUrl!,
                            errorWidget: (context, url, error) {
                              print(error);
                              return const SizedBox(
                                child: Center(
                                  child: CircularProgressIndicator(),
                                ),
                              );
                            },
                            height: SizeConfig.screenHeight! * 0.15,
                            fit: BoxFit.cover,
                          ),
                        ),
                        const SizedBox(height: 5),
                        Row(
                          children: [
                            Expanded(
                              child: Padding(
                                padding: const EdgeInsets.all(1.0),
                                child: Text(
                                  getTimeDifferenceInHours(
                                    pinnedPost[index]
                                        .createdAt!
                                        .toIso8601String(),
                                  ),
                                  style: const TextStyle(
                                    color: Colors.grey,
                                    fontWeight: FontWeight.w200,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 5),
                        Text(
                          pinnedPost[index].description!,
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          )
        : Container(
            key: const Key('hi'),
          ),
  );
}
```

 


1. [talawa](../../index.html)
2. [pinned\_post](../../widgets_pinned_post/widgets_pinned_post-library.html)
3. [PinnedPost](../../widgets_pinned_post/PinnedPost-class.html)
4. build method

##### PinnedPost class





talawa
1.0.0+1






