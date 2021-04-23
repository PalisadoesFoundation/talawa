//Pages are called here
import 'package:get_it/get_it.dart';
import 'package:talawa/view_models/swtich_org_vm.dart';
import 'services/api_.dart';

GetIt locator = GetIt.instance;

void setupLocator() {
  locator.registerLazySingleton(() => API());

  locator.registerFactory(() => SwitchOrgModel());
}
