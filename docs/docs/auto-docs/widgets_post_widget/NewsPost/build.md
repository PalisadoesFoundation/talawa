::: {#overlay-under-drawer}
:::

::: {#title}
[menu]{#sidenav-left-toggle .material-symbols-outlined role="button"
tabindex="0"}

1.  [talawa](../../index.html)
2.  [widgets/post_widget.dart](../../widgets_post_widget/)
3.  [NewsPost](../../widgets_post_widget/NewsPost-class.html)
4.  build method

::: self-name
build
:::

::: {#theme-button .toggle title="Toggle brightness"}
[ dark_mode ]{#dark-theme-button .material-symbols-outlined} [
light_mode ]{#light-theme-button .material-symbols-outlined}
:::
:::

::: {role="main"}
::: {#dartdoc-main-content .main-content above-sidebar="widgets_post_widget/NewsPost-class-sidebar.html" below-sidebar=""}
<div>

# [build]{.kind-method} method

</div>

::: {.section .multi-line-signature}
<div>

1.  @[override](https://api.flutter.dev/flutter/dart-core/override-constant.html)

</div>

[[Widget](https://api.flutter.dev/flutter/widgets/Widget-class.html)]{.returntype}
[build]{.name}(

1.  [[[BuildContext](https://api.flutter.dev/flutter/widgets/BuildContext-class.html)]{.type-annotation}
    [context]{.parameter-name}]{#build-param-context .parameter}

)

::: features
[override]{.feature}
:::
:::

::: {.section .desc .markdown}
Describes the part of the user interface represented by this widget.

The framework calls this method when this widget is inserted into the
tree in a given
[BuildContext](https://api.flutter.dev/flutter/widgets/BuildContext-class.html)
and when the dependencies of this widget change (e.g., an
[InheritedWidget](https://api.flutter.dev/flutter/widgets/InheritedWidget-class.html)
referenced by this widget changes). This method can potentially be
called in every frame and should not have any side effects beyond
building a widget.

The framework replaces the subtree below this widget with the widget
returned by this method, either by updating the existing subtree or by
removing the subtree and inflating a new subtree, depending on whether
the widget returned by this method can update the root of the existing
subtree, as determined by calling
[Widget.canUpdate](https://api.flutter.dev/flutter/widgets/Widget/canUpdate.html).

Typically implementations return a newly created constellation of
widgets that are configured with information from this widget\'s
constructor and from the given
[BuildContext](https://api.flutter.dev/flutter/widgets/BuildContext-class.html).

The given
[BuildContext](https://api.flutter.dev/flutter/widgets/BuildContext-class.html)
contains information about the location in the tree at which this widget
is being built. For example, the context provides the set of inherited
widgets for this location in the tree. A given widget might be built
with multiple different
[BuildContext](https://api.flutter.dev/flutter/widgets/BuildContext-class.html)
arguments over time if the widget is moved around the tree or if the
widget is inserted into the tree in multiple places at once.

The implementation of this method must only depend on:

-   the fields of the widget, which themselves must not change over
    time, and
-   any ambient state obtained from the `context` using
    [BuildContext.dependOnInheritedWidgetOfExactType](https://api.flutter.dev/flutter/widgets/BuildContext/dependOnInheritedWidgetOfExactType.html).

If a widget\'s [build](../../widgets_post_widget/NewsPost/build.html)
method is to depend on anything else, use a
[StatefulWidget](https://api.flutter.dev/flutter/widgets/StatefulWidget-class.html)
instead.

See also:

-   [StatelessWidget](https://api.flutter.dev/flutter/widgets/StatelessWidget-class.html),
    which contains the discussion on performance considerations.
:::

::: {#source .section .summary .source-code}
## Implementation

``` language-dart
@override
Widget build(BuildContext context) {
  return Padding(
    padding: const EdgeInsets.all(8.0),
    child: Card(
      elevation: 5,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8),
      ),
      surfaceTintColor: Theme.of(context).colorScheme.secondaryContainer,
      color: Theme.of(context).colorScheme.tertiaryContainer,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ListTile(
            leading: CustomAvatar(
              isImageNull: post.creator!.image == null,
              firstAlphabet:
                  post.creator!.firstName!.substring(0, 1).toUpperCase(),
              imageUrl:
                  "${'${GraphqlConfig.orgURI}'.replaceFirst('/graphql', '')}/${post.creator!.image}",
              fontSize: 20,
            ),
            title: Text(
              "${post.creator!.firstName} ${post.creator!.lastName}",
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w400,
                color: Theme.of(context).colorScheme.onSecondary,
              ),
            ),
            trailing: IconButton(
              key: const Key('reportButton'),
              onPressed: () => showModalBottomSheet<void>(
                context: context,
                builder: (BuildContext context1) => Container(
                  key: const Key('reportPost'),
                  height: 120,
                  decoration: BoxDecoration(
                    color: Theme.of(context).primaryColor,
                    borderRadius: const BorderRadius.only(
                      topRight: Radius.circular(16),
                      topLeft: Radius.circular(16),
                    ),
                  ),
                  child: PostBottomModal(
                    post: post,
                    deletePost: deletePost,
                    function: function,
                  ),
                ),
              ),
              icon: Icon(
                Icons.report_gmailerrorred_outlined,
                color: Theme.of(context).colorScheme.onSecondary,
              ),
            ),
          ),
          post.imageUrl != null
              ? Container(
                  key: const Key('postParentContainer'),
                  height: 340,
                  color: Colors.white,
                  child: PostContainer(photoUrl: post.imageUrl),
                )
              : DescriptionTextWidget(text: post.description!),
          BaseView<LikeButtonViewModel>(
            onModelReady: (model) {
              model.initialize(post.likedBy ?? [], post.sId);
            },
            builder: (context, model, child) => Column(
              children: [
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 16, vertical: 5),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
                        child: Column(
                          children: [
                            MultiReactButton(
                              toggle: () => model.toggleIsLiked(),
                            ),
                            Text(
                              "${model.likedBy.length}",
                              style: TextStyle(
                                fontFamily: 'open-sans',
                                color:
                                    Theme.of(context).colorScheme.onSecondary,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        child: Column(
                          children: [
                            GestureDetector(
                              key: const Key('commentButton'),
                              onTap: () => function?.call(post),
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: SizedBox(
                                  height: (MediaQuery.sizeOf(context).width /
                                          392) *
                                      35,
                                  width: (MediaQuery.sizeOf(context).width /
                                          392) *
                                      35,
                                  child: SvgPicture.asset(
                                    'assets/images/comment.svg',
                                  ),
                                ),
                              ),
                            ),
                            Text(
                              "${post.comments!.length}",
                              style: TextStyle(
                                color:
                                    Theme.of(context).colorScheme.onSecondary,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(120, 0, 0, 0),
                        child: Text(
                          '    ${post.getPostCreatedDuration()}',
                          style: TextStyle(
                            color: Theme.of(context).colorScheme.onSecondary,
                            fontSize: 12,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 16,
                    vertical: 0,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      GestureDetector(
                        onTap: () => function?.call(post),
                        child: Text(
                          "${AppLocalizations.of(context)!.strictTranslate("Liked")} by ...",
                          style: TextStyle(
                            fontFamily: 'open-sans',
                            color: Theme.of(context).colorScheme.onSecondary,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 6,
                    vertical: 5,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      if (post.imageUrl != null)
                        DescriptionTextWidget(text: post.description!),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    ),
  );
}
```
:::
:::

::: {#dartdoc-sidebar-left .sidebar .sidebar-offcanvas-left}
::: {#header-search-sidebar .hidden-l}
:::

1.  [talawa](../../index.html)
2.  [post_widget](../../widgets_post_widget/)
3.  [NewsPost](../../widgets_post_widget/NewsPost-class.html)
4.  build method

##### NewsPost class

::: {#dartdoc-sidebar-left-content}
:::
:::

::: {#dartdoc-sidebar-right .sidebar .sidebar-offcanvas-right}
:::
:::

[ talawa 1.0.0+1 ]{.no-break}
