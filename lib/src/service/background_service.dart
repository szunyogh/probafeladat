import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:probafeladat/src/service/counter_service.dart';

class BackgroundService {
  factory BackgroundService.instance() => _instance;

  BackgroundService._internal();

  static final _instance = BackgroundService._internal();

  CounterService controller = Get.put(CounterService());

  void counter() {
    print("counter");
    Stream.periodic(Duration(seconds: 1)).listen((_) {
      controller.increment();
      print(controller.count.value);
    });
  }
}
