import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:probafeladat/src/service/counter_service.dart';
import 'package:probafeladat/src/theme/mytheme.dart';
import 'package:probafeladat/src/ui/pages/home_screen.dart';
import 'package:probafeladat/src/ui/widgets/app_retain_widget.dart';

void main() {
  HomeBinding().dependencies();
  runApp(MyApp());
}

class HomeBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => CounterService());
  }
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Proba feladat',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        elevatedButtonTheme: ElevatedButtonThemeData(style: MyTheme.raisedButtonStyle),
      ),
      home: AppRetainWidget(child: HomeScreen()),
    );
  }
}
