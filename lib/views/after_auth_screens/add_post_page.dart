import 'package:flutter/material.dart';
import 'package:talawa/utils/app_localization.dart';

class AddPost extends StatelessWidget {
  const AddPost({Key? key, this.drawerKey}) : super(key: key);
  final GlobalKey<ScaffoldState>? drawerKey;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          elevation: 0.9,
          centerTitle: true,
          title: Text(
            AppLocalizations.of(context)!.strictTranslate('Share News'),
            style: Theme.of(context).textTheme.headline6!.copyWith(
                  fontWeight: FontWeight.w600,
                  fontSize: 20,
                ),
          ),
          leading: IconButton(
            icon: const Icon(Icons.menu),
            onPressed: () => drawerKey!.currentState!.openDrawer(),
          ),
          actions: [
            TextButton(
              onPressed: () {},
              child: Text(
                AppLocalizations.of(context)!.strictTranslate("Post"),
                style: Theme.of(context).textTheme.headline5!.copyWith(
                    fontWeight: FontWeight.w600,
                    color: Theme.of(context).accentColor),
              ),
            ),
          ],
        ),
        body: Column(
          children: <Widget>[
            ListTile(
              leading: const CircleAvatar(radius: 25),
              title: const Text('Rutvik Chandla'),
              subtitle: Text(AppLocalizations.of(context)!
                  .strictTranslate('Organization Name')),
            ),
            Row(
              children: <Widget>[
                IconButton(onPressed: () {}, icon: const Icon(Icons.photo)),
                IconButton(
                    onPressed: () {}, icon: const Icon(Icons.camera_alt)),
                IconButton(
                    onPressed: () {}, icon: const Icon(Icons.file_upload)),
                TextButton(
                    onPressed: () {},
                    child: Text(
                      '# ${AppLocalizations.of(context)!.strictTranslate("Add hasthtag")}',
                      style: Theme.of(context).textTheme.headline6,
                    )),
              ],
            ),
            const Divider(),
            Expanded(
                child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: TextField(
                maxLines: null,
                decoration: InputDecoration(
                    border: InputBorder.none,
                    focusedBorder: InputBorder.none,
                    enabledBorder: InputBorder.none,
                    errorBorder: InputBorder.none,
                    disabledBorder: InputBorder.none,
                    hintText: AppLocalizations.of(context)!.strictTranslate(
                        "Write here what do you want to share")),
              ),
            ))
          ],
        ));
  }
}
