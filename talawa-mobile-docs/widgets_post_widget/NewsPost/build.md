


# build method







- @[override](https://api.flutter.dev/flutter/dart-core/override-constant.html)

[Widget](https://api.flutter.dev/flutter/widgets/Widget-class.html) build
([BuildContext](https://api.flutter.dev/flutter/widgets/BuildContext-class.html) context)

_<span class="feature">override</span>_



<p>Describes the part of the user interface represented by this widget.</p>
<p>The framework calls this method when this widget is inserted into the tree
in a given <a href="https://api.flutter.dev/flutter/widgets/BuildContext-class.html">BuildContext</a> and when the dependencies of this widget change
(e.g., an <a href="https://api.flutter.dev/flutter/widgets/InheritedWidget-class.html">InheritedWidget</a> referenced by this widget changes). This
method can potentially be called in every frame and should not have any side
effects beyond building a widget.</p>
<p>The framework replaces the subtree below this widget with the widget
returned by this method, either by updating the existing subtree or by
removing the subtree and inflating a new subtree, depending on whether the
widget returned by this method can update the root of the existing
subtree, as determined by calling <a href="https://api.flutter.dev/flutter/widgets/Widget/canUpdate.html">Widget.canUpdate</a>.</p>
<p>Typically implementations return a newly created constellation of widgets
that are configured with information from this widget's constructor and
from the given <a href="https://api.flutter.dev/flutter/widgets/BuildContext-class.html">BuildContext</a>.</p>
<p>The given <a href="https://api.flutter.dev/flutter/widgets/BuildContext-class.html">BuildContext</a> contains information about the location in the
tree at which this widget is being built. For example, the context
provides the set of inherited widgets for this location in the tree. A
given widget might be built with multiple different <a href="https://api.flutter.dev/flutter/widgets/BuildContext-class.html">BuildContext</a>
arguments over time if the widget is moved around the tree or if the
widget is inserted into the tree in multiple places at once.</p>
<p>The implementation of this method must only depend on:</p>
<ul>
<li>the fields of the widget, which themselves must not change over time,
and</li>
<li>any ambient state obtained from the <code>context</code> using
<a href="https://api.flutter.dev/flutter/widgets/BuildContext/dependOnInheritedWidgetOfExactType.html">BuildContext.dependOnInheritedWidgetOfExactType</a>.</li>
</ul>
<p>If a widget's <a href="../../widgets_post_widget/NewsPost/build.md">build</a> method is to depend on anything else, use a
<a href="https://api.flutter.dev/flutter/widgets/StatefulWidget-class.html">StatefulWidget</a> instead.</p>
<p>See also:</p>
<ul>
<li><a href="https://api.flutter.dev/flutter/widgets/StatelessWidget-class.html">StatelessWidget</a>, which contains the discussion on performance considerations.</li>
</ul>



## Implementation

```dart
@override
Widget build(BuildContext context) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      // const PinnedPostCarousel(),
      ListTile(
        leading: CustomAvatar(
          isImageNull: post.creator!.image == null,
          firstAlphabet:
              post.creator!.firstName!.substring(0, 1).toUpperCase(),
          imageUrl: post.creator!.image,
          fontSize: 24,
        ),
        title: Text(
          "${post.creator!.firstName} ${post.creator!.lastName}",
          style: const TextStyle(fontSize: 20, fontWeight: FontWeight.w400),
        ),
        subtitle: Text(post.getPostCreatedDuration()),
      ),
      DescriptionTextWidget(text: post.description!),
      Container(
        height: 400,
        color:
            Theme.of(context).colorScheme.primaryContainer.withOpacity(0.5),
        child: PostContainer(id: post.sId),
      ),
      BaseView<LikeButtonViewModel>(
        onModelReady: (model) {
          model.initialize(post.likedBy ?? [], post.sId);
        },
        builder: (context, model, child) => Column(
          children: [
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  GestureDetector(
                    onTap: () => function != null ? function!(post) : {},
                    child: Text(
                      "${model.likedBy.length} ${AppLocalizations.of(context)!.strictTranslate("Likes")}",
                      style: const TextStyle(
                        fontFamily: 'open-sans',
                        fontWeight: FontWeight.w800,
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () => function != null ? function!(post) : {},
                    child: Text(
                      "${post.comments!.length} ${AppLocalizations.of(context)!.strictTranslate("comments")}",
                    ),
                  )
                ],
              ),
            ),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.0),
              child: Divider(),
            ),
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 16, vertical: 5),
              child: Row(
                children: [
                  GestureDetector(
                    onTap: () {
                      model.toggleIsLiked();
                    },
                    child: Icon(
                      Icons.thumb_up,
                      color: model.isLiked
                          ? Theme.of(context).colorScheme.secondary
                          : const Color(0xff737373),
                    ),
                  ),
                  GestureDetector(
                    onTap: () => function != null ? function!(post) : {},
                    child: const Padding(
                      padding: EdgeInsets.only(left: 18.0),
                      child: Icon(
                        Icons.comment,
                        color: Color(0xff737373),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    ],
  );
}
```







