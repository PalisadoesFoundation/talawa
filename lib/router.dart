import 'package:flutter/material.dart';
import 'package:talawa/routing_constants.dart';
import 'package:talawa/views/pages/home_page.dart';
import 'package:talawa/views/pages/login_signup/register_page.dart';
import 'package:talawa/views/pages/login_signup/set_url_page.dart';
import 'package:talawa/views/pages/organization/create_organization.dart';
import 'package:talawa/views/pages/organization/join_organization.dart';
import 'package:talawa/views/pages/organization/profile_page.dart';
import 'package:talawa/views/pages/organization/switch_org_page.dart';

Route<dynamic> generateRoute(RouteSettings settings) {
  switch (settings.name) {
    case routes.HomeRoute:
      return MaterialPageRoute(builder: (context) => HomePage());
    case routes.LoginPageRoute:
      return MaterialPageRoute(builder: (context) => UrlPage());
    case routes.CreateOrgPageRoute:
      return MaterialPageRoute(builder: (context) => CreateOrganization());
    case routes.JoinOrganizationPageRoute:
      return MaterialPageRoute(builder: (context) => JoinOrganization());
    case routes.SwitchOrgPageRoute:
      return MaterialPageRoute(builder: (context) => SwitchOrganization());
    case routes.RegisterPageRoute:
      return MaterialPageRoute(builder: (context) => RegisterPage());
    case routes.ProfilePageRoute:
      return MaterialPageRoute(builder: (context) => ProfilePage());
    default:
      return MaterialPageRoute(builder: (context) => UrlPage());
  }
}
