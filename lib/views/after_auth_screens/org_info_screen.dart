import 'package:flutter/material.dart';
import 'package:talawa/locator.dart';
import 'package:talawa/models/organization/org_info.dart';
import 'package:talawa/services/size_config.dart';
import 'package:talawa/view_model/pre_auth_view_models/select_organization_view_model.dart';

/// A screen widget to display detailed information about an organization.
class OrganisationInfoScreen extends StatelessWidget {
  const OrganisationInfoScreen({super.key, required this.orgInfo});

  /// The organization information to be displayed on the screen.
  final OrgInfo orgInfo;

  @override
  Widget build(BuildContext context) {
    final double imageHeight = SizeConfig.screenHeight! * 0.38;
    final SelectOrganizationViewModel model = SelectOrganizationViewModel();
    final Map<String, OrgInfo> joinedOrgsMap = {};
    for (final org
        in userConfig.currentUser.joinedOrganizations ?? <OrgInfo>[]) {
      joinedOrgsMap[org.id!] = org;
    }

    return Scaffold(
      extendBodyBehindAppBar: true,
      floatingActionButton: FloatingActionButton.extended(
        heroTag: "org_info_join_fab",
        onPressed: () {
          model.selectOrg(orgInfo);
        },
        label: Text(
          'Join',
          style: TextStyle(
            color: const Color.fromARGB(255, 255, 255, 255),
            fontSize: SizeConfig.screenHeight! * 0.022,
          ),
        ),
        backgroundColor: joinedOrgsMap.containsKey(orgInfo.id)
            ? const Color.fromARGB(255, 100, 100, 100)
            : const Color.fromARGB(255, 86, 194, 65),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () => Navigator.of(context).pop(),
        ),
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Stack(
              alignment: Alignment.center,
              children: [
                Stack(
                  children: [
                    orgInfo.image != null
                        ? Image.network(
                            orgInfo.image!,
                            height: imageHeight,
                            width: double.infinity,
                            fit: BoxFit.cover,
                          )
                        : ClipRRect(
                            borderRadius: const BorderRadius.only(
                              bottomLeft: Radius.circular(20.0),
                              bottomRight: Radius.circular(20.0),
                            ),
                            child: Image.asset(
                              'assets/images/Organisation_Default_Image.jpeg',
                              height: imageHeight,
                              width: double.infinity,
                              fit: BoxFit.cover,
                            ),
                          ),
                    Container(
                      key: const Key('image_container'),
                      height: imageHeight,
                      width: double.infinity,
                      decoration: BoxDecoration(
                        color: Colors.black.withAlpha((0.55 * 255).toInt()),
                        borderRadius: const BorderRadius.only(
                          bottomLeft: Radius.circular(20.0),
                          bottomRight: Radius.circular(20.0),
                        ),
                      ),
                    ),
                  ],
                ),
                Positioned(
                  bottom: 45,
                  left: 16,
                  child: Row(
                    children: [
                      Text(
                        orgInfo.name ?? 'Organization Name',
                        style: const TextStyle(
                          fontSize: 28.0,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                      if (orgInfo.city != null && orgInfo.countryCode != null)
                        Padding(
                          padding: const EdgeInsets.only(top: 8, left: 8),
                          child: Center(
                            child: Text(
                              '${orgInfo.city}, ${orgInfo.countryCode}',
                              style: const TextStyle(
                                fontSize: 16.0,
                                color: Color.fromARGB(255, 179, 168, 168),
                              ),
                            ),
                          ),
                        ),
                    ],
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(top: 16, left: 16, right: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    'Description',
                    style:
                        TextStyle(fontWeight: FontWeight.bold, fontSize: 18.0),
                  ),
                  Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      !orgInfo.userRegistrationRequired!
                          ? const Icon(
                              Icons.lock_open,
                              size: 18,
                              color: Colors.green,
                            )
                          : Icon(
                              Icons.lock,
                              size: 18,
                              color: Theme.of(context).colorScheme.primary,
                            ),
                      const SizedBox(width: 8),
                      !orgInfo.userRegistrationRequired!
                          ? Text(
                              "Public",
                              style: Theme.of(context)
                                  .textTheme
                                  .bodySmall!
                                  .copyWith(
                                    color:
                                        const Color.fromARGB(255, 98, 98, 98),
                                  ),
                            )
                          : Text(
                              "Private",
                              style: Theme.of(context)
                                  .textTheme
                                  .bodySmall!
                                  .copyWith(
                                    color: const Color.fromARGB(
                                      255,
                                      103,
                                      103,
                                      103,
                                    ),
                                  ),
                            ),
                    ],
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(
                top: 10,
                left: 16,
                right: 20,
                bottom: 10,
              ),
              child: Text(
                orgInfo.description ?? 'No description provided.',
                style: const TextStyle(fontSize: 16.0),
              ),
            ),
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 16.0, vertical: 20.0),
              child: Card(
                elevation: 4,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Icon(
                            Icons.info_outline,
                            color: Theme.of(context).colorScheme.primary,
                            size: 28,
                          ),
                          const SizedBox(width: 8),
                          Text(
                            'Organization Details',
                            style: Theme.of(context)
                                .textTheme
                                .titleLarge
                                ?.copyWith(fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                      const SizedBox(height: 16),
                      _buildDetailRow(
                        'Admins Count',
                        orgInfo.adminsCount?.toString(),
                      ),
                      _buildDetailRow(
                        'Members Count',
                        orgInfo.membersCount?.toString(),
                      ),
                      _buildDetailRow('Address', _formatAddress(orgInfo)),
                      _buildDetailRow('City', orgInfo.city),
                      _buildDetailRow('State', orgInfo.state),
                      _buildDetailRow('Country', orgInfo.countryCode),
                      _buildDetailRow('Postal Code', orgInfo.postalCode),
                      _buildDetailRow(
                        'Type',
                        orgInfo.userRegistrationRequired == true
                            ? 'Private'
                            : 'Public',
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Divider(
              color: Theme.of(context).colorScheme.onSurface,
              thickness: 1,
              endIndent: 16,
              indent: 16,
            ),
          ],
        ),
      ),
    );
  }

  /// Builds a detail row with a label and value.
  ///
  /// **params**:
  /// * `label`: The label for the detail.
  /// * `value`: The value for the detail.
  ///
  /// **returns**:
  /// * `Widget`:  A widget containing the label and value in a row.
  Widget _buildDetailRow(String label, String? value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6.0),
      child: Row(
        children: [
          Text(
            '$label:',
            style: const TextStyle(fontWeight: FontWeight.w600, fontSize: 16),
          ),
          const SizedBox(width: 10),
          Expanded(
            child: Text(
              value?.isNotEmpty == true ? value! : 'N/A',
              style: const TextStyle(fontSize: 16, color: Color(0xFF444444)),
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
            ),
          ),
        ],
      ),
    );
  }

  /// Formats the address of the organization.
  ///
  /// **params**:
  /// * `orgInfo`: The organization information containing address details.
  ///
  /// **returns**:
  /// * `String`: A formatted address string.
  String _formatAddress(OrgInfo orgInfo) {
    final List<String> parts = [];
    if (orgInfo.line1 != null && orgInfo.line1!.isNotEmpty) {
      parts.add(orgInfo.line1!);
    }
    if (orgInfo.line2 != null && orgInfo.line2!.isNotEmpty) {
      parts.add(orgInfo.line2!);
    }
    return parts.isNotEmpty ? parts.join(', ') : 'N/A';
  }
}
