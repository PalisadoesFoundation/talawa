// ignore_for_file: talawa_good_doc_comments, talawa_api_doc
import 'package:flutter/material.dart';
import 'package:talawa/models/organization/org_info.dart';
import 'package:talawa/view_model/access_request_view_model.dart';
import 'package:talawa/views/base_view.dart';

///requestAccess.
class SendAccessRequest extends StatelessWidget {
  const SendAccessRequest({
    super.key,
    required this.org,
  });

  /// OrgInfo object.
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
            body: Center(
              child: SingleChildScrollView(
                child: Container(
                  margin:
                      const EdgeInsets.symmetric(horizontal: 24, vertical: 32),
                  padding: const EdgeInsets.all(14.0),
                  decoration: BoxDecoration(
                    color: const Color(0xFF3E3E3E), // AppTheme.blackPrimary
                    borderRadius: BorderRadius.circular(24),
                    boxShadow: [
                      const BoxShadow(
                        color: Color(0x408E8E8E), // AppTheme.shadow
                        blurRadius: 12,
                        offset: Offset(0, 4),
                      ),
                    ],
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Image.asset('assets/images/Group 8948.png', height: 120),
                      const SizedBox(height: 24),
                      const Text(
                        "Request Access to Private Organization",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 22,
                          color: Color(0xFFFFFFFF), // AppTheme.white
                          fontFamily: 'OpenSans',
                        ),
                        textAlign: TextAlign.center,
                      ),
                      const SizedBox(height: 16),
                      Container(
                        padding: const EdgeInsets.all(16),
                        decoration: BoxDecoration(
                          color: const Color(
                            0xFF636363,
                          ), // AppTheme.blackSecondary
                          borderRadius: BorderRadius.circular(12),
                          border: Border.all(
                            color: const Color(0xFFAEAEAE),
                          ), // AppTheme.blackTertiary
                        ),
                        child: const Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                Icon(Icons.lock, color: Color(0xFFAEAEAE)),
                                SizedBox(width: 8),
                                Expanded(
                                  child: Text(
                                    "This is a private organization. You need permission to join. Only approved members can access its resources and participate in its activities. Private organizations are designed to protect sensitive information and ensure a safe environment for their members.",
                                    style: TextStyle(color: Color(0xFFFFFFFF)),
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(height: 8),
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Icon(
                                  Icons.admin_panel_settings,
                                  color: Color(0xFFAEAEAE),
                                ),
                                SizedBox(width: 8),
                                Expanded(
                                  child: Text(
                                    "After you request access, the organization's admin will review your request. If approved, you will be notified and granted access. Admins may consider your profile and reason for joining before approval. If you have questions, contact the organization directly.",
                                    style: TextStyle(color: Color(0xFFFFFFFF)),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 32),
                      SizedBox(
                        width: double.infinity,
                        child: ElevatedButton.icon(
                          icon:
                              const Icon(Icons.send, color: Color(0xFF3E3E3E)),
                          label: const Text(
                            "Request Access",
                            style: TextStyle(
                              fontSize: 18,
                              color: Color(0xFF3E3E3E),
                            ),
                          ),
                          style: ElevatedButton.styleFrom(
                            backgroundColor: const Color(0xFFFFFFFF),
                            padding: const EdgeInsets.symmetric(vertical: 16),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12),
                            ),
                            elevation: 4,
                          ),
                          onPressed: () {
                            model.sendMembershipRequest();
                          },
                        ),
                      ),
                      const SizedBox(height: 16),
                      const Text(
                        "Need help? Contact the organization for more information about their joining process.",
                        style:
                            TextStyle(color: Color(0xFFAEAEAE), fontSize: 14),
                        textAlign: TextAlign.center,
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
