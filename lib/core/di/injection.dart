import 'package:get_it/get_it.dart';

import '../database/drift_repository.dart';

void addInjection() {
  GetIt.instance.registerSingleton<DriftRepository>(DriftRepository());
}
