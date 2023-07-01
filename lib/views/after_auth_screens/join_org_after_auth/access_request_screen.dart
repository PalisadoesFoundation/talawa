import 'package:flutter/material.dart';
import 'package:talawa/apptheme.dart';
import 'package:talawa/models/organization/org_info.dart';
import 'package:talawa/view_model/access_request_view_model.dart';
import 'package:talawa/views/base_view.dart';

///requestAccess
class SendAccessRequest extends StatelessWidget {
  const SendAccessRequest({
    Key? key,
    required this.org,
    // required this.model
  }) : super(key: key);
  final OrgInfo org;
  @override
  Widget build(BuildContext context) {
    return BaseView<AccessScreenViewModel>(
      onModelReady: (model) => model.initialise(org),
      builder: (context, model, child) {
        return SafeArea(
          child: Scaffold(
            appBar: AppBar(
              backgroundColor: Colors.transparent,
            ),
            resizeToAvoidBottomInset: false,
            body: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Image.asset('assets/images/Group 8948.png'),
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "You need access",
                        style: AppTheme.title.copyWith(color: AppTheme.white),
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      const Text(
                        "Request access, or switch to an account with access",
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Container(
                        child: TextField(
                          style: const TextStyle(color: AppTheme.blackPrimary),
                          minLines: 15,
                          maxLines: 20,
                          decoration: InputDecoration(
                            constraints: const BoxConstraints(
                              maxWidth: 400,
                              minWidth: 100,
                            ),
                            enabledBorder: UnderlineInputBorder(
                              borderRadius: BorderRadius.circular(20.0),
                              borderSide: const BorderSide(
                                width: 3,
                                color: Colors.white,
                              ),
                            ),
                            hintText: "Message (optional)",
                            hintStyle: const TextStyle(
                              color: AppTheme.blackSecondary,
                            ),
                            filled: true,
                            fillColor: AppTheme.white,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Center(
                  child: TextButton(
                    onPressed: () {
                      model.sendMembershipRequest();
                    },
                    style:
                        TextButton.styleFrom(backgroundColor: AppTheme.green),
                    child: const Text(
                      "Request Access",
                      style: TextStyle(
                        color: AppTheme.white,
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        );
      },
    );
  }
}
