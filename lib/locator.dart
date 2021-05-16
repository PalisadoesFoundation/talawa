//Pages are called here
import 'package:get_it/get_it.dart';
import 'package:talawa/services/navigation_service.dart';
import 'package:talawa/utils/gql_client.dart';
import 'package:talawa/view_models/newwfeed_view_model/new_article_page_view_model.dart';
import 'package:talawa/view_models/page_view_model/add_event_page_view_model.dart';
import 'package:talawa/view_models/page_view_model/create_organization_page_viewModel.dart';
import 'package:talawa/view_models/page_view_model/events_page_view_model.dart';
import 'package:talawa/view_models/page_view_model/join_organization_view_model.dart';
import 'package:talawa/view_models/page_view_model/update_profile_page_viewModel.dart';
import 'package:talawa/view_models/page_view_model/profile_page_viewModel.dart';
import 'package:talawa/view_models/swtich_org_vm.dart';
import 'services/api_.dart';

GetIt locator = GetIt.instance;

void setupLocator() {
  locator.registerLazySingleton(() => API());
  locator.registerFactory(() => GraphQLConfiguration());

  //Register ViewModels
  locator.registerFactory(() => JoinOrgnizationViewModel());
  locator.registerFactory(() => UpdateProfilePageViewModel());
  locator.registerFactory(() => EventPageViewModel());
  locator.registerFactory(() => AddEventPageViewModel());
  locator.registerFactory(() => CreateOrganizationViewModel());
  locator.registerFactory(() => ProfilePageViewModel());

  locator.registerFactory(() => NewsArticleViewModel());

  locator.registerFactory(() => SwitchOrgModel());

  //register services
  locator.registerLazySingleton(() => NavigationService());
}
