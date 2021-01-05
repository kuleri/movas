import 'package:flutter/material.dart';
import 'package:movas_example/movas/actions/app_config_action.dart';
import 'package:movas_example/movas/actions/feed_items_action.dart';
import 'package:movas_example/movas/observables/feed_items_observable.dart';
import 'package:movas_example/movas/ui/widgets/custom_loading_indicator.dart';
import 'package:movas_example/movas/ui/widgets/post_tile.dart';
import 'package:movas_example/movas/ui/widgets/service_switch.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool useProdService = false;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      FeedItemsA.of(context).getPosts();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text('Posts')),
      ),
      body: Center(
        child: Container(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Consumer<FeedItemsO>(
              builder: (context, feedItemsO, _) => Column(
                children: [
                  ServiceSwitch(
                      useProdService: useProdService,
                      onChanged: (newVal) async {
                        useProdService = newVal;
                        await AppConfigA.of(context)
                            .switchService(useProduction: newVal);
                        FeedItemsA.of(context).getPosts();
                      }),
                  Expanded(
                    child: Card(
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: feedItemsO?.items == null
                            ? CustomLoadingIndicator()
                            : ListView.separated(
                                itemBuilder: (context, index) =>
                                    PostTile(item: feedItemsO?.items[index]),
                                separatorBuilder: (context, index) => Divider(),
                                itemCount: feedItemsO.items.length,
                              ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
