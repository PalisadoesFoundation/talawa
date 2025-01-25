




build method - OrganisationInfoScreen class - org\_info\_screen library - Dart API







menu

1. [talawa](../../index.html)
2. [views/after\_auth\_screens/org\_info\_screen.dart](../../file-___home_harshil_Desktop_open-source_palisadoes_talawa_lib_views_after_auth_screens_org_info_screen/)
3. [OrganisationInfoScreen](../../file-___home_harshil_Desktop_open-source_palisadoes_talawa_lib_views_after_auth_screens_org_info_screen/OrganisationInfoScreen-class.html)
4. build method

build


dark\_mode

light\_mode




# build method


1. @[override](https://api.flutter.dev/flutter/dart-core/override-constant.html)

dynamic
build(

1. dynamic context

)

## Implementation

```
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
                bottom: 24,
                left: 16,
                child: Text(
                  'Created by: ${orgInfo.creatorInfo?.firstName ?? 'User name'} ${orgInfo.creatorInfo?.lastName ?? ''}',
                  style: const TextStyle(
                    fontSize: 16.0,
                    color: Color.fromARGB(255, 255, 255, 255),
                    fontWeight: FontWeight.w500,
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
            color: Theme.of(context).colorScheme.onSurface,
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
            color: Theme.of(context).colorScheme.onSurface,
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
```

 


1. [talawa](../../index.html)
2. [org\_info\_screen](../../file-___home_harshil_Desktop_open-source_palisadoes_talawa_lib_views_after_auth_screens_org_info_screen/)
3. [OrganisationInfoScreen](../../file-___home_harshil_Desktop_open-source_palisadoes_talawa_lib_views_after_auth_screens_org_info_screen/OrganisationInfoScreen-class.html)
4. build method

##### OrganisationInfoScreen class





talawa
1.0.0+1






