import 'package:flutter/material.dart';

class MColor{
  static Color main = Color(int.parse("#114048".substring(1, 7), radix: 16) + 0xFF000000);
  static Color blue = Color(int.parse("#2400FF".substring(1, 7), radix: 16) + 0xFF000000);
  static Color lightBlue = Color(int.parse("#E4FFFD".substring(1, 7), radix: 16) + 0xFF000000);
  static Color grey = Color(int.parse("#E1E1E1".substring(1, 7), radix: 16) + 0xFF000000);
}