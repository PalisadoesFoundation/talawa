


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
<p>If a widget's <a href="../../views_after_auth_screens_add_post_page/AddPost/build.md">build</a> method is to depend on anything else, use a
<a href="https://api.flutter.dev/flutter/widgets/StatefulWidget-class.html">StatefulWidget</a> instead.</p>
<p>See also:</p>
<ul>
<li><a href="https://api.flutter.dev/flutter/widgets/StatelessWidget-class.html">StatelessWidget</a>, which contains the discussion on performance considerations.</li>
</ul>



## Implementation

```dart
@override
Widget build(BuildContext context) {
  return Scaffold(
    resizeToAvoidBottomInset: false,
    // header for the widget
    appBar: AppBar(
      backgroundColor: Theme.of(context).primaryColor,
      elevation: 0.9,
      centerTitle: true,
      // header title
      title: Text(
        AppLocalizations.of(context)!.strictTranslate('Share News'),
        style: Theme.of(context).textTheme.titleLarge!.copyWith(
              fontWeight: FontWeight.w600,
              fontSize: 20,
            ),
      ),
      leading: IconButton(
        //TODO: showing the null pointer exception
        key: const Key('add_post_icon_button1'),
        color: Theme.of(context).iconTheme.color,
        icon: const Icon(Icons.menu),
        onPressed: () => drawerKey!.currentState!.openDrawer(),
      ),
      // button to upload the post.
      actions: [
        TextButton(
          key: const Key('add_post_text_btn1'),
          onPressed: () => model.uploadPost(),
          child: Text(
            AppLocalizations.of(context)!.strictTranslate("Post"),
            style: Theme.of(context).textTheme.headlineSmall!.copyWith(
                  fontWeight: FontWeight.w600,
                  color: Theme.of(context).colorScheme.secondary,
                ),
          ),
        ),
      ],
    ),
    body: BaseView<AddPostViewModel>(
      onModelReady: (m) {
        m.initialise();
        model = m;
      },
      builder: (context, model, child) => SingleChildScrollView(
        child: Column(
          children: <Widget>[
            ListTile(
              leading: const CircleAvatar(radius: 25),
              title: Text(model.userName),
              subtitle: Text(
                AppLocalizations.of(context)!.strictTranslate(model.orgName),
              ),
            ),
            // renders icon button to upload post files.
            Row(
              children: <Widget>[
                // button to select the photo from gallery.
                IconButton(
                  key: const Key('add_post_icon_button2'),
                  onPressed: () => model.getImageFromGallery(),
                  icon: const Icon(Icons.photo),
                ),
                // button to capture the image.
                IconButton(
                  key: const Key('add_post_icon_button3'),
                  onPressed: () => model.getImageFromGallery(camera: true),
                  icon: const Icon(Icons.camera_alt),
                ),
                // button to select file
                IconButton(
                  key: const Key('add_post_icon_button4'),
                  onPressed: () {},
                  icon: const Icon(Icons.file_upload),
                ),
                // button to add hastags to the post.
                TextButton(
                  key: const Key('add_post_text_btn2'),
                  onPressed: () {},
                  child: Text(
                    '# ${AppLocalizations.of(context)!.strictTranslate("Add hashtag")}',
                    style: Theme.of(context).textTheme.titleLarge,
                  ),
                ),
              ],
            ),
            const Divider(),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: TextField(
                controller: model.titleController,
                // input field to write the description of the post.
                decoration: InputDecoration(
                  border: InputBorder.none,
                  focusedBorder: InputBorder.none,
                  enabledBorder: InputBorder.none,
                  errorBorder: InputBorder.none,
                  disabledBorder: InputBorder.none,
                  hintText: AppLocalizations.of(context)!.strictTranslate(
                    "Enter the title of your post",
                  ),
                  label: Text(
                    AppLocalizations.of(context)!.strictTranslate(
                      "Title",
                    ),
                  ),
                ),
              ),
            ),
            const Divider(),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: TextField(
                controller: model.controller,
                maxLines: null,
                // input field to write the description of the post.
                decoration: InputDecoration(
                  border: InputBorder.none,
                  focusedBorder: InputBorder.none,
                  enabledBorder: InputBorder.none,
                  errorBorder: InputBorder.none,
                  disabledBorder: InputBorder.none,
                  hintText: AppLocalizations.of(context)!.strictTranslate(
                    "Write here what do you want to share",
                  ),
                ),
              ),
            ),
            // if the image for the post is added then render button to remove it.
            model.imageFile != null
                // ignore: sized_box_for_whitespace
                ? Container(
                    height: 230,
                    padding: const EdgeInsets.all(8.0),
                    child: Stack(
                      children: [
                        Image.file(
                          model.imageFile!,
                          fit: BoxFit.cover,
                          width: MediaQuery.of(context).size.width,
                        ),
                        Positioned(
                          right: 5,
                          top: 5,
                          child: IconButton(
                            onPressed: () => model.removeImage(),
                            icon: const Icon(
                              Icons.cancel,
                              color: Colors.black,
                            ),
                          ),
                        )
                      ],
                    ),
                  )
                : Container(),
          ],
        ),
      ),
    ),
  );
}
```







