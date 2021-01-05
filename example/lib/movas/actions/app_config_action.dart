import 'package:movas/provider/provider.dart';

import '../stores/app_config_store.dart';

class AppConfigA {
  final AppConfigStore _appConfigStore;

  AppConfigA(this._appConfigStore);

  factory AppConfigA.of(context) => AppConfigA(
        StaticProvider.of(context),
      );

  Future<void> switchService({bool useProduction}) async {
    return _appConfigStore.switchService(useProduction: useProduction);
  }
}
