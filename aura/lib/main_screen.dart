import 'dart:io';
import 'dart:typed_data';
import 'dart:convert';
import 'package:flutter/material.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Image.asset('assets/fone.jpg'),
        ],
      ),
    );
  }
}

Future<void> getPixelsFromImage() async {
  Uint8List imageFile = File('/Users/admin/Documents/GitHub/flutter-app/aura/assets/1.jpg').readAsBytesSync();
  String base64Image = base64Encode(imageFile);
  print(base64Image);
}
