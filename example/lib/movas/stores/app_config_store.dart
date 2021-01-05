import 'package:flutter/cupertino.dart';
import 'package:movas/provider/provider.dart';
import 'package:movas_example/movas/observables/app_config_observable.dart';
import 'package:movas_example/movas/services/posts/mock_posts_service.dart';

import '../observables/app_config_observable.dart';
import '../services/posts/mock_posts_service.dart';
import '../services/posts/prod_posts_service.dart';

class AppConfigStore extends Store<AppConfigO> {
  BuildContext context;

  AppConfigStore(BuildContext context) {
    this.context = context;
    add(AppConfigO(
      MockPostsService(StaticProvider.of(context)),
    ));
  }

  Future<void> switchService({bool useProduction}) async {
    add(AppConfigO(useProduction
        ? ProdPostsService(
            StaticProvider.of(context), StaticProvider.of(context))
        : MockPostsService(StaticProvider.of(context))));
  }
}
