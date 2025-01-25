::: {#overlay-under-drawer}
:::

::: {#title}
[menu]{#sidenav-left-toggle .material-symbols-outlined role="button"
tabindex="0"}

1.  [talawa](../../index.html)
2.  [views/demo_screens/profile_page_demo.dart](../../views_demo_screens_profile_page_demo/)
3.  [DemoProfilePage](../../views_demo_screens_profile_page_demo/DemoProfilePage-class.html)
4.  guestViewWidget method

::: self-name
guestViewWidget
:::

::: {#theme-button .toggle title="Toggle brightness"}
[ dark_mode ]{#dark-theme-button .material-symbols-outlined} [
light_mode ]{#light-theme-button .material-symbols-outlined}
:::
:::

::: {role="main"}
::: {#dartdoc-main-content .main-content above-sidebar="views_demo_screens_profile_page_demo/DemoProfilePage-class-sidebar.html" below-sidebar=""}
<div>

# [guestViewWidget]{.kind-method} method

</div>

::: {.section .multi-line-signature}
[[Widget](https://api.flutter.dev/flutter/widgets/Widget-class.html)]{.returntype}
[guestViewWidget]{.name}(

1.  [[[BuildContext](https://api.flutter.dev/flutter/widgets/BuildContext-class.html)]{.type-annotation}
    [context]{.parameter-name}]{#guestViewWidget-param-context
    .parameter}

)
:::

::: {.section .desc .markdown}
guestViewWidget, this widget is shown if user is not logged in.

**params**:

-   `context`: Build context to perform context related operation

**returns**:

-   `Widget`: Widget
:::

::: {#source .section .summary .source-code}
## Implementation

``` language-dart
Widget guestViewWidget(BuildContext context) {
  return SingleChildScrollView(
    child: Column(
      children: [
        SizedBox(
          height: SizeConfig.screenHeight! * 0.01,
        ),
        Row(
          children: [
            Expanded(
              flex: 1,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: CustomAvatar(
                  isImageNull: true,
                  firstAlphabet: "U",
                  imageUrl: null,
                  fontSize: Theme.of(context).textTheme.titleLarge!.fontSize,
                  maxRadius: 30,
                ),
              ),
            ),
            const Expanded(
              flex: 3,
              child: Padding(
                padding: EdgeInsets.all(8.0),
                child: Text(
                  'User',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontFamily: 'open-sans',
                  ),
                ),
              ),
            ),
            // Expanded(
            //   flex: 1,
            //   child: IconButton(
            //     icon: Icon(
            //       Icons.share,
            //       color:
            //           Theme.of(context).colorScheme.secondary,
            //     ),
            //     onPressed: () => model.invite(context),
            //   ),
            // ),
          ],
        ),
        const SizedBox(
          height: 20,
        ),
        RaisedRoundedButton(
          key: homeModel!.keySPDonateUs,
          buttonLabel: AppLocalizations.of(context)!.strictTranslate(
            'Donate to the Community',
          ),
          onTap: () {
            MainScreenViewModel.scaffoldKey.currentState?.openDrawer();
          },
          textColor: Theme.of(context)
              .inputDecorationTheme
              .focusedBorder!
              .borderSide
              .color,
          backgroundColor: Theme.of(context).colorScheme.secondaryContainer,
        ),
        SizedBox(
          height: 600,
          width: double.infinity,
          child: ContainedTabBarView(
            tabs: [
              Tab(
                text: AppLocalizations.of(context)!.strictTranslate('Posts'),
              ),
              Tab(
                text: AppLocalizations.of(context)!.strictTranslate('Events'),
              ),
              Tab(
                text: AppLocalizations.of(context)!.strictTranslate('Tasks'),
              ),
            ],
            views: [
              ColoredBox(
                color: Theme.of(context).colorScheme.surface,
                child: GridView.count(
                  mainAxisSpacing: 5,
                  crossAxisCount: 3,
                  children: [
                    Image.asset('assets/images/pfp2.png'),
                    Image.asset('assets/images/pfp2.png'),
                    Image.asset('assets/images/pfp2.png'),
                    Image.asset('assets/images/pfp2.png'),
                    Image.asset('assets/images/pfp2.png'),
                  ],
                ),
              ),
              Container(
                color: Theme.of(context).colorScheme.surface,
              ),
              Container(
                color: Theme.of(context).colorScheme.onPrimary,
              ),
            ],
          ),
        ),
        SizedBox(
          height: SizeConfig.screenHeight! * 0.67,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              SizedBox(
                height: SizeConfig.screenHeight! * 0.01,
              ),
              SizedBox(
                height: SizeConfig.screenHeight! * 0.05,
              ),

              /// `Donation` acts as plugin. If visible is true the it will be always visible.
              /// even if it's uninstalled by the admin (for development purposes)
              //TODO: custom tile for Invitation.
              // CustomListTile(
              //   key: homeModel!.keySPInvite,
              //   index: 3,
              //   type: TileType.option,
              //   option: Options(
              //     icon: Icon(
              //       Icons.share,
              //       color:
              //           Theme.of(context).colorScheme.secondary,
              //       size: 30,
              //     ),
              //     // title
              //     title: AppLocalizations.of(context)!
              //         .strictTranslate('Invite'),
              //     // subtitle
              //     subtitle: AppLocalizations.of(context)!
              //         .strictTranslate('Invite to org'),
              //   ),
              //   // on tap call the invite function
              //   onTapOption: () => model.invite(context),
              // ),
              SizedBox(
                height: SizeConfig.screenHeight! * 0.05,
              ),
              // Custom tile for Logout option.
              //TODO: logout
              // CustomListTile(
              //   key: homeModel!.keySPLogout,
              //   index: 3,
              //   type: TileType.option,
              //   option: Options(
              //     icon: Icon(
              //       Icons.logout,
              //       color:
              //           Theme.of(context).colorScheme.secondary,
              //       size: 30,
              //     ),
              //     title: AppLocalizations.of(context)!
              //         .strictTranslate('Log out'),
              //     subtitle: AppLocalizations.of(context)!
              //         .strictTranslate('Log out from Talawa'),
              //   ),
              //   // on tap calls the logout function
              //   onTapOption: () => model.logout(context),
              // ),
              SizedBox(
                height: SizeConfig.screenHeight! * 0.05,
              ),
              FromPalisadoes(key: homeModel!.keySPPalisadoes),
            ],
          ),
        ),
      ],
    ),
  );
}
```
:::
:::

::: {#dartdoc-sidebar-left .sidebar .sidebar-offcanvas-left}
::: {#header-search-sidebar .hidden-l}
:::

1.  [talawa](../../index.html)
2.  [profile_page_demo](../../views_demo_screens_profile_page_demo/)
3.  [DemoProfilePage](../../views_demo_screens_profile_page_demo/DemoProfilePage-class.html)
4.  guestViewWidget method

##### DemoProfilePage class

::: {#dartdoc-sidebar-left-content}
:::
:::

::: {#dartdoc-sidebar-right .sidebar .sidebar-offcanvas-right}
:::
:::

[ talawa 1.0.0+1 ]{.no-break}
