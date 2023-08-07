import 'package:get/get.dart';

class MyController extends GetxController {
  List text = ['itemi', 'item2'];

  void addItem(int index) {
    text.add('item${index}');
    update();
  }
}
