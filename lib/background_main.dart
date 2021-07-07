import 'package:flutter/cupertino.dart';
import 'package:probafeladat/src/service/background_service.dart';

void backgroundMain() {
  WidgetsFlutterBinding.ensureInitialized();

  BackgroundService.instance().counter();
}
