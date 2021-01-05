import 'package:flutter/material.dart';
import 'package:movas_example/movas/observables/feed_item_observable.dart';

class PostTile extends StatelessWidget {
  const PostTile({
    Key key,
    @required this.item,
  }) : super(key: key);
  final FeedItemO item;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Text(item?.userId?.toString() ?? ''),
      title: Text(item?.title ?? ''),
      subtitle: Padding(
        padding: const EdgeInsets.only(top: 8.0),
        child: Text(item?.body ?? ''),
      ),
    );
  }
}
