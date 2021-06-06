import 'package:flutter/material.dart';
import 'package:talawa/model/posts.dart';
import 'package:talawa/routing_constants.dart';
import 'package:talawa/views/pages/_pages.dart';
import 'package:talawa/views/pages/home_page.dart';
import 'package:talawa/views/pages/login_signup/login_page.dart';
import 'package:talawa/views/pages/login_signup/register_page.dart';
import 'package:talawa/views/pages/login_signup/set_url_page.dart';
import 'package:talawa/views/pages/newsfeed/add_post.dart';
import 'package:talawa/views/pages/newsfeed/news_article.dart';
import 'package:talawa/views/pages/organization/create_organization/create_organization_view.dart';
import 'package:talawa/views/pages/organization/profile_page.dart';
import 'package:talawa/views/pages/organization/switch_org_page.dart';

Route<dynamic> generateRoute(RouteSettings settings) {
  switch (settings.name) {
    case routes.HomeRoute:
      return MaterialPageRoute(builder: (context) => const HomePage());
    case routes.LoginPageRoute:
      return MaterialPageRoute(builder: (context) => LoginPage());
    case routes.CreateOrgPageRoute:
      return MaterialPageRoute(
          builder: (context) => const CreateOrganization());
    case routes.JoinOrganizationPageRoute:
      return MaterialPageRoute(builder: (context) => const JoinOrganization());
    case routes.SwitchOrgPageRoute:
      return MaterialPageRoute(builder: (context) => SwitchOrganization());
    case routes.RegisterPageRoute:
      return MaterialPageRoute(builder: (context) => RegisterPage());
    case routes.ProfilePageRoute:
      return MaterialPageRoute(builder: (context) => const ProfilePage());
    case routes.AddPostPageRoute:
      return MaterialPageRoute(builder: (context) => const AddPost());
    case routes.NewsArticlePageRoute:
      final params = settings.arguments as Map<String, dynamic>;
      final post = params["post"] as Posts;
      final index = params["index"] as int;
      return MaterialPageRoute(
          builder: (context) => NewsArticle(
                post: post,
                index: index,
              ));
    default:
      return MaterialPageRoute(builder: (context) => UrlPage());
  }
}
