import 'package:flutter/material.dart';

class AddPost extends StatelessWidget {
  const AddPost({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          elevation: 0.9,
          centerTitle: true,
          title: Text(
            'Share News',
            style: Theme.of(context).textTheme.headline6!.copyWith(
                  fontWeight: FontWeight.w600,
                  fontSize: 20,
                ),
          ),
          actions: [
            TextButton(
              onPressed: () {},
              child: Text(
                "Post",
                style: Theme.of(context).textTheme.headline5!.copyWith(
                    fontWeight: FontWeight.w600,
                    color: Theme.of(context).accentColor),
              ),
            ),
          ],
        ),
        body: Column(
          children: <Widget>[
            const ListTile(
              leading: CircleAvatar(
                radius: 25,
              ),
              title: Text('Rutvik Chandla'),
              subtitle: Text('Organization Name'),
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
                      '# Add hasthtag',
                      style: Theme.of(context).textTheme.headline6,
                    )),
              ],
            ),
            const Divider(),
            const Expanded(
                child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.0),
              child: TextField(
                maxLines: null,
                decoration: InputDecoration(
                    border: InputBorder.none,
                    focusedBorder: InputBorder.none,
                    enabledBorder: InputBorder.none,
                    errorBorder: InputBorder.none,
                    disabledBorder: InputBorder.none,
                    hintText: "Write here what do you want to share"),
              ),
            ))
          ],
        ));
  }
}
