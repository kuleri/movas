library movas;

import 'package:movas/helper/logger.dart';

export 'provider/provider.dart';
export 'router/router.dart';


class Movas {
  static const int transitionDurationInMilliseconds = 500;

  static void log(dynamic message) {
    movasLogger.info(message);
  }
}
