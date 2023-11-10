import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:local_auth/local_auth.dart';
import 'package:photo_manager/photo_manager.dart';
import 'pages/home_page.dart';
import 'package:bitmap/bitmap.dart';

Future<void> main() async {
  runApp(const MyApp());

  Bitmap bitmap = Bitmap.blank(100, 100);

  Bitmap contrastedBitmap = bitmap.apply(BitmapContrast(0.2));

  Bitmap brightBitmap = bitmap.applyBatch([
    BitmapBrightness(0.2),
    BitmapAdjustColor(saturation: 1.0),
  ]);

  Uint8List headedBitmap = bitmap.buildHeaded();

  // List<int> listInt = [];
  // Bitmap bitmap = await Bitmap.fromProvider(
  //     const NetworkImage("http://pudim.com.br/pudim.jpg"));// сайт не открывается
  // Uint8List? theListOfInts;
  // Bitmap bitmap = Bitmap.fromHeadful(
  //   100,
  //   100,  );
  // Bitmap bitmap = Bitmap.fromHeadless(imageWidth, imageHeight, theListOfInts);

  //аунтификация и проверка паролей - если успею можно взяться за него
  // final LocalAuthentication auth = LocalAuthentication();
  // final bool canAuthenticateWithBiometrics = await auth.canCheckBiometrics;
  // final bool canAuthenticate =
  //     canAuthenticateWithBiometrics || await auth.isDeviceSupported();

//права доступа к фото
  // final PermissionState ps = await PhotoManager.requestPermissionExtend();
  // if (ps.isAuth) {
  // } else {
  //   PhotoManager.openSetting();
  // }
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}
