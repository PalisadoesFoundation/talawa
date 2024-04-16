import 'package:flutter/material.dart';
import 'package:talawa/locator.dart';
import 'package:talawa/models/organization/org_info.dart';
import 'package:talawa/models/user/user_info.dart';
import 'package:talawa/services/graphql_config.dart';
import 'package:talawa/services/size_config.dart';
import 'package:talawa/view_model/pre_auth_view_models/select_organization_view_model.dart';
import 'package:talawa/widgets/custom_avatar.dart';

class OrganisationInfoScreen extends StatelessWidget {
  const OrganisationInfoScreen({super.key, required this.orgInfo});
  final OrgInfo orgInfo;

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(
      context,
    );
    final double imageHeight = SizeConfig.screenHeight! * 0.38;
    final SelectOrganizationViewModel model = SelectOrganizationViewModel();
    final Map<String, OrgInfo> joinedOrgsMap = {};
    for (final org in userConfig.currentUser.joinedOrganizations!) {
      joinedOrgsMap[org.id!] = org;
    }

    return Scaffold(
      extendBodyBehindAppBar: true,
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
                              'assets/images/talawaorg.png',
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
                        color: Colors.black.withOpacity(0.55),
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
                      if (orgInfo.address != null)
                        Padding(
                          padding: const EdgeInsets.only(top: 8, left: 8),
                          child: Center(
                            child: Text(
                              '${orgInfo.address?.city}, ${orgInfo.address?.countryCode}',
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
                Positioned(
                  bottom: 28,
                  left: 16,
                  child: Text(
                    'Created by: ${orgInfo.creatorInfo?.firstName ?? 'User name'} ${orgInfo.creatorInfo?.lastName ?? ''}',
                    style: const TextStyle(
                      fontSize: 16.0,
                      color: Color.fromARGB(255, 255, 255, 255),
                    ),
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
            ),
            Divider(
              color: Theme.of(context).colorScheme.onBackground,
              thickness: 1,
              endIndent: 16,
              indent: 16,
            ),
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
              color: Theme.of(context).colorScheme.onBackground,
              thickness: 1,
              endIndent: 16,
              indent: 16,
            ),
            _buildUserList(context, orgInfo.members, 4),
          ],
        ),
      ),
    );
  }

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
        ],
      ),
    );
  }

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
                        color: Colors.grey.withOpacity(0.5),
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
                              user.firstName!.substring(0, 1).toUpperCase(),
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
  }
}
