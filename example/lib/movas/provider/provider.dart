import 'package:movas/provider/provider.dart';
import 'package:movas_example/movas/observables/app_config_observable.dart';
import 'package:movas_example/movas/observables/feed_items_observable.dart';
import 'package:movas_example/movas/services/app_http_service.dart';
import 'package:movas_example/movas/services/responses/feed_items.dart';
import 'package:movas_example/movas/stores/app_config_store.dart';
import 'package:movas_example/movas/stores/feed_items_store.dart';
import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';
import 'package:rxdart/rxdart.dart';

List<SingleChildWidget> providers = [
  ...streamProviders,
  ...serviceProviders,
  ...storeProviders,
];

List<SingleChildWidget> streamProviders = [
  Provider<PublishSubject<FeedItemsResponse>>(
    lazy: false,
    dispose: (_, stream) => stream.close(),
    create: (context) => PublishSubject(sync: true),
  ),
];

List<SingleChildWidget> serviceProviders = [
  Provider<AppHttpService>(
    create: (context) => AppHttpService(context),
  ),
];

List<SingleChildWidget> storeProviders = [
  StoreProvider<FeedItemsStore, FeedItemsO>(
    storeBuilder: (context) => FeedItemsStore(
      StaticProvider.of(context),
    ),
  ),
  StoreProvider<AppConfigStore, AppConfigO>(
    storeBuilder: (context) => AppConfigStore(context),
  ),
];
