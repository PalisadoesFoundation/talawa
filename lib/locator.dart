import 'package:get_it/get_it.dart';
import 'package:talawa/services/database_mutation_functions.dart';
import 'package:talawa/services/graphql_config.dart';
import 'package:talawa/services/navigation_service.dart';
import 'package:talawa/services/size_config.dart';
import 'package:talawa/view_model/demo_view_model.dart';
import 'package:talawa/view_model/login_view_model.dart';
import 'package:talawa/view_model/organization_feed_view_model.dart';
import 'package:talawa/view_model/progress_dialog_view_model.dart';
import 'package:talawa/view_model/select_organization_view_model.dart';
import 'package:talawa/view_model/set_url_view_model.dart';
import 'package:talawa/view_model/signup_details_view_model.dart';
import 'package:talawa/view_model/waiting_view_model.dart';

GetIt locator = GetIt.instance;

void setupLocator() {
  //services
  locator.registerSingleton(NavigationService());

  //sizeConfig
  locator.registerSingleton(SizeConfig());

  //graphql
  locator.registerSingleton(GraphqlConfig());

  //databaseMutationFunction
  locator.registerSingleton(DataBaseMutationFunctions());

  //Page viewModels
  locator.registerFactory(() => DemoViewModel());
  // locator.registerFactory(() => OrganizationFeedViewModel());
  locator.registerFactory(() => OrganizationFeedViewModel());
  locator.registerFactory(() => SetUrlViewModel());
  locator.registerFactory(() => LoginViewModel());
  locator.registerFactory(() => ProgressDialogViewModel());
  locator.registerFactory(() => SelectOrganizationViewModel());
  locator.registerFactory(() => SignupDetailsViewModel());
  locator.registerFactory(() => WaitingViewModel());
}
