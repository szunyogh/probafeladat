import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:probafeladat/src/service/background_service.dart';
import 'package:probafeladat/src/service/counter_service.dart';
import '../../../background_main.dart';

class HomeScreen extends GetView<CounterService> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Obx(
              () => Text(
                '${controller.count.value}',
                style: TextStyle(fontSize: 50, color: Colors.black),
              ),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                var channel = const MethodChannel('com.example.probafeladat/background_service');
                var callbackHandle = PluginUtilities.getCallbackHandle(backgroundMain);
                channel.invokeMethod('startService', callbackHandle!.toRawHandle()).then((value) {
                  //BackgroundService.instance().counter();
                });
              },
              child: Text('Start'),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                var channel = const MethodChannel('com.example.probafeladat/background_service');
                channel.invokeMethod('stoptService');
              },
              child: Text('Stop'),
            )
          ],
        ),
      ),
    );
  }
}
