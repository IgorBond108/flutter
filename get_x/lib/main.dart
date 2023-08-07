import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'mycontroller.dart';

void main() {
  runApp(GetMaterialApp(home: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GetBuilder<MyController>(
        init: MyController(),
        builder: (controller) => ListView.builder(
          itemCount: controller.text.length,
          itemBuilder: (context, index) => ListTile(
            title: Text(controller.text[index]),
            onTap: () {
              controller.addItem(index);
            },
          ),
        ),
      ),
    );
  }
}
