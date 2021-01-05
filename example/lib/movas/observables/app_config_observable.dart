import 'package:movas_example/movas/services/posts/posts_service.dart';

class AppConfigO {
  AppConfigO(
    this.postsService,
  );

  final PostsService postsService;

  @override
  String toString() => 'AppConfigO(postsService: $postsService)';

  @override
  bool operator ==(Object o) {
    if (identical(this, o)) return true;

    return o is AppConfigO && o.postsService == postsService;
  }

  @override
  int get hashCode => postsService.hashCode;
}
