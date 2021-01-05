import 'package:movas/provider/provider.dart';
import 'package:movas_example/movas/observables/app_config_observable.dart';

class FeedItemsA {
  FeedItemsA(this.appConfigO);

  final AppConfigO appConfigO;

  Future<void> getPosts() {
    return appConfigO.postsService.getPosts();
  }

  factory FeedItemsA.of(context) => FeedItemsA(
        StaticProvider.of(context),
      );
}
