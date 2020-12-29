import 'package:provider/provider.dart';

void configureMovas(){
  Provider.debugCheckInvalidValueType = <T>(T value) {
    return true;
  };

}