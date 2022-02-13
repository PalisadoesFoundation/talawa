import 'package:flutter/material.dart';
import 'package:talawa/view_model/after_auth_view_models/chat_view_models/direct_chat_view_model.dart';
import 'package:talawa/views/base_view.dart';

class DirectChats extends StatelessWidget {
  const DirectChats({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BaseView<DirectChatViewModel>(
      onModelReady: (model) => model.initialise(),
      builder: (context, model, child) {
        return ElevatedButton(
            onPressed: () => model.getDirectChatList(), child: Text('Click'));
      },
    );
  }
}
