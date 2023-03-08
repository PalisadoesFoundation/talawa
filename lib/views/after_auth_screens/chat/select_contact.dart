// ignore_for_file: talawa_api_doc
// ignore_for_file: talawa_good_doc_comments

import 'package:flutter/material.dart';
import 'package:talawa/locator.dart';
import 'package:talawa/view_model/after_auth_view_models/chat_view_models/select_contact_view_model.dart';
import 'package:talawa/views/base_view.dart';

/// SelectContact returns a widget that has mutable state _SelectContactState.
class SelectContact extends StatefulWidget {
  const SelectContact({Key? key}) : super(key: key);

  @override
  _SelectContactState createState() => _SelectContactState();
}

/// _SelectContactState returns a widget that renders the list of the users that current user can chat with.
class _SelectContactState extends State<SelectContact> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: Colors.black,
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            navigationService.pop();
          },
        ),
        title: Text(
          "Select Contacts",
          style: Theme.of(context).textTheme.titleLarge!.copyWith(
                fontWeight: FontWeight.w600,
                fontSize: 20,
              ),
        ),
      ),
      body: BaseView<SelectContactViewModel>(
        onModelReady: (model) {
          model.initialise();
          model.getCurrentOrgUsersList();
        },
        builder: (context, model, child) {
          return ListView.builder(
            itemCount: model.orgMembersList.length,
            itemBuilder: (context, index) {
              return GestureDetector(
                onTap: () {
                  // Navigator.push(context, MaterialPageRoute(builder: (context)=>ChatMessageScreen(chat: ChatListTileDataModel(ChatUser(model.orgMembersList[index].firstName,model.orgMembersList[index].id,model.orgMembersList[index].image),null,0))));
                },
                child: Container(
                  child: Padding(
                    padding: const EdgeInsets.all(5.0),
                    child: ListTile(
                      leading: const CircleAvatar(
                        radius: 25,
                      ),
                      title: Text(
                        model.orgMembersList[index].firstName.toString(),
                      ),
                    ),
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
