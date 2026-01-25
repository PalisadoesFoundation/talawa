import 'package:flutter/material.dart';
import 'package:talawa/locator.dart';
import 'package:talawa/models/organization/org_info.dart';
<<<<<<< HEAD
import 'package:talawa/models/user/user_info.dart';
import 'package:talawa/services/graphql_config.dart';
import 'package:talawa/services/size_config.dart';
import 'package:talawa/view_model/pre_auth_view_models/select_organization_view_model.dart';
import 'package:talawa/widgets/custom_avatar.dart';
=======
import 'package:talawa/services/size_config.dart';
import 'package:talawa/view_model/pre_auth_view_models/select_organization_view_model.dart';
>>>>>>> upstream/develop

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
<<<<<<< HEAD
      floatingActionButton: !joinedOrgsMap.containsKey(orgInfo.id)
          ? FloatingActionButton.extended(
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
              backgroundColor: const Color.fromARGB(255, 86, 194, 65),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
              ),
            )
          : FloatingActionButton.extended(
              onPressed: () {},
              label: Text(
                'Leave',
                style: TextStyle(
                  color: const Color.fromARGB(255, 255, 255, 255),
                  fontSize: SizeConfig.screenHeight! * 0.022,
                ),
              ),
              backgroundColor: const Color.fromARGB(255, 208, 51, 51),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
              ),
            ),
=======
      floatingActionButton: FloatingActionButton.extended(
        heroTag: "org_info_join_fab",
        onPressed: () {
          if (joinedOrgsMap.containsKey(orgInfo.id)) {
            return;
          }
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
>>>>>>> upstream/develop
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
<<<<<<< HEAD
            const Padding(
              padding: EdgeInsets.only(top: 16, left: 16, right: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
=======
            Padding(
              padding: const EdgeInsets.only(top: 16, left: 16, right: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
>>>>>>> upstream/develop
                    'Description',
                    style:
                        TextStyle(fontWeight: FontWeight.bold, fontSize: 18.0),
                  ),
                  Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
<<<<<<< HEAD
                      // !orgInfo.userRegistrationRequired!
                      //     ? const Icon(
                      //         Icons.lock_open,
                      //         size: 18,
                      //         color: Colors.green,
                      //       )
                      //     : Icon(
                      //         Icons.lock,
                      //         size: 18,
                      //         color: Theme.of(context).colorScheme.primary,
                      //       ),
                      // const SizedBox(width: 8),
                      // !orgInfo.userRegistrationRequired!
                      //     ? Text(
                      //         "Public",
                      //         style: Theme.of(context)
                      //             .textTheme
                      //             .bodySmall!
                      //             .copyWith(
                      //               color:
                      //                   const Color.fromARGB(255, 98, 98, 98),
                      //             ),
                      //       )
                      //     : Text(
                      //         "Private",
                      //         style: Theme.of(context)
                      //             .textTheme
                      //             .bodySmall!
                      //             .copyWith(
                      //               color: const Color.fromARGB(
                      //                 255,
                      //                 103,
                      //                 103,
                      //                 103,
                      //               ),
                      //             ),
                      //       ),
=======
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
>>>>>>> upstream/develop
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
<<<<<<< HEAD
            _buildSectionTitle(
              context,
              'Admins',
              orgInfo.admins,
              () => _showAllMembersBottomSheet(
                context,
                orgInfo.admins!,
                'Admins',
              ),
              2,
=======
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
>>>>>>> upstream/develop
            ),
            Divider(
              color: Theme.of(context).colorScheme.onSurface,
              thickness: 1,
              endIndent: 16,
              indent: 16,
            ),
<<<<<<< HEAD
            _buildUserList(context, orgInfo.admins, 2),
            _buildSectionTitle(
              context,
              'Members',
              orgInfo.members,
              () => _showAllMembersBottomSheet(
                context,
                orgInfo.members!,
                'Members',
              ),
              4,
            ),
            Divider(
              color: Theme.of(context).colorScheme.onSurface,
              thickness: 1,
              endIndent: 16,
              indent: 16,
            ),
            _buildUserList(context, orgInfo.members, 4),
=======
>>>>>>> upstream/develop
          ],
        ),
      ),
    );
  }

<<<<<<< HEAD
  /// Builds a section title widget.
  ///
  /// **params**:
  /// * `context`: The build context.
  /// * `title`: The title of the section.
  /// * `users`:  The list of users
  /// * `onSeeAllTap`:  Callback when "See all" is tapped.
  /// * `maxUsers`: The maximum number of users to display.
  ///
  /// **returns**:
  /// * `Widget`:  Returns a section title widget.
  Widget _buildSectionTitle(
    BuildContext context,
    String title,
    List<User>? users,
    VoidCallback onSeeAllTap,
    int maxUsers,
  ) {
    return Padding(
      padding: const EdgeInsets.only(left: 16.0, right: 16, top: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 18.0),
          ),
          if (users != null && users.length > maxUsers)
            GestureDetector(
              onTap: onSeeAllTap,
              child: const Text(
                'See all',
                style: TextStyle(
                  fontSize: 16.0,
                  color: Colors.blue,
                ),
              ),
            ),
=======
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
>>>>>>> upstream/develop
        ],
      ),
    );
  }

<<<<<<< HEAD
  /// Builds a list of users widget.
  ///
  /// **params**:
  /// * `context`:  The build context.
  /// * `users`: The list of users
  /// * `maxDisplay`: The maximum number of users to display.
  ///
  /// **returns**:
  /// * `Widget`: Returns a list of users widget.
  Widget _buildUserList(
    BuildContext context,
    List<User>? users,
    int maxDisplay,
  ) {
    if (users == null || users.isEmpty) {
      return const Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.0),
        child: Text('No users to display'),
      );
    }

    final List<User> displayedUsers = users.take(maxDisplay).toList();

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Column(
        children: displayedUsers
            .map(
              (user) => Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  decoration: BoxDecoration(
                    color: Theme.of(context).brightness == Brightness.dark
                        ? const Color.fromARGB(255, 50, 50, 50)
                        : const Color.fromARGB(255, 226, 226, 226),
                    borderRadius: BorderRadius.circular(20),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withAlpha((0.5 * 255).toInt()),
                        spreadRadius: 1,
                        blurRadius:
                            Theme.of(context).brightness == Brightness.dark
                                ? 1
                                : 6,
                        offset: Theme.of(context).brightness == Brightness.dark
                            ? Offset.zero
                            : const Offset(0, 3),
                      ),
                    ],
                  ),
                  height: 60,
                  child: Row(
                    children: [
                      Expanded(
                        flex: 1,
                        child: CustomAvatar(
                          isImageNull: user.image == null,
                          firstAlphabet:
                              user.firstName?.substring(0, 1).toUpperCase(),
                          imageUrl:
                              '${'${GraphqlConfig.orgURI}'.replaceFirst('/graphql', '')}/${user.image}',
                          fontSize: SizeConfig.screenHeight! * 0.018,
                        ),
                      ),
                      Expanded(
                        flex: 3,
                        child: Text(
                          '${user.firstName ?? 'No Name'} ${user.lastName ?? ''}',
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            )
            .toList(),
      ),
    );
  }

  ///  Shows a bottom sheet with all members.
  ///
  /// **params**:
  /// * `context`: The build context.
  /// * `users`: The list of users.
  /// * `title`: The title of the bottom sheet.
  ///
  /// **returns**:
  ///   None
  void _showAllMembersBottomSheet(
    BuildContext context,
    List<User> users,
    String title,
  ) {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext bc) {
        return SafeArea(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              AppBar(
                title: Text(title),
                leading: IconButton(
                  key: const Key('modalSheetbackBtn'),
                  icon: const Icon(Icons.close),
                  onPressed: () => Navigator.of(bc).pop(),
                ),
              ),
              Flexible(
                child: ListView.builder(
                  itemCount: users.length,
                  itemBuilder: (BuildContext context, int index) {
                    return ListTile(
                      leading: CustomAvatar(
                        isImageNull: users[index].image == null,
                        firstAlphabet: users[index]
                            .firstName!
                            .substring(0, 1)
                            .toUpperCase(),
                        imageUrl:
                            '${'${GraphqlConfig.orgURI}'.replaceFirst('/graphql', '')}/${users[index].image}',
                        fontSize: SizeConfig.screenHeight! * 0.018,
                      ),
                      title: Text(
                        '${users[index].firstName ?? 'No Name'} ${users[index].lastName ?? ''}',
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        );
      },
    );
=======
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
>>>>>>> upstream/develop
  }
}
