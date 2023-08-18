import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';

class ExampleWidgetModel {
  ExampleWidgetModel(){
   await Hive.initFlutter();
  }
  void doSome (){}
}