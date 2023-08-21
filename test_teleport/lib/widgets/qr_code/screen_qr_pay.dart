// import 'dart:async';
// import 'dart:io';
// import 'package:flutter/material.dart';
// import 'package:qr_code_scanner/qr_code_scanner.dart';

// // import 'package:flutter/material.dart';

// // class QrPayScreen extends StatefulWidget {
// //   const QrPayScreen({super.key});

// //   @override
// //   State<QrPayScreen> createState() => _QrPayScreenState();
// // }

// // class _QrPayScreenState extends State<QrPayScreen> {
// //   String qrData = "https://github.com/ChinmayMunje";
// //   final qrdataFeed = TextEditingController();

// //   @override
// //   Widget build(BuildContext context) {
// //     return Scaffold(
// //       body: Container(
// //         alignment: Alignment.center,
// //         padding: const EdgeInsets.all(32),
// //         decoration: const BoxDecoration(
// //             image: DecorationImage(
// //           image: AssetImage(
// //               '/Users/admin/Documents/GitHub/flutter-app/test_teleport/assets/icons_buttomNavigationBar/fone_qr_code.png'),
// //         )),
// //       ),
// //     );
// //   }
// // }

// class ScanQR extends StatefulWidget {
//   @override
//   _ScanQRState createState() => _ScanQRState();
// }

// class _ScanQRState extends State<ScanQR> {
//   Barcode? result;
//   QRViewController? controller;
//   final GlobalKey qrKey = GlobalKey(debugLabel: 'QR');

//   void reassemble() {
//     super.reassemble();
//     if (Platform.isAndroid) {
//       controller!.pauseCamera();
//     }
//     controller!.resumeCamera();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text("Scan QR Code"),
//       ),
//       body: Container(
//         padding: const EdgeInsets.all(20),
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           crossAxisAlignment: CrossAxisAlignment.stretch,
//           children: [
//             //Message displayed over here
//             const Text(
//               "Result",
//               style: TextStyle(fontSize: 25.0, fontWeight: FontWeight.bold),
//               textAlign: TextAlign.center,
//             ),
//             // Text(
//             //   // qrCodeResult,
//             //   style: const TextStyle(
//             //     fontSize: 20.0,
//             //   ),
//             //   textAlign: TextAlign.center,
//             // ),
//             const SizedBox(
//               height: 20.0,
//             ),

//             //Button to scan QR code
//             FloatingActionButton(
//               // padding: EdgeInsets.all(15),
//               onPressed: () async {
//                 // String codeSanner =
//                 //     await BarcodeScanner.scan(); //barcode scanner
//                 // setState(() {
//                 //   qrCodeResult = codeSanner;
//                 // });
//               },
//               //Button having rounded rectangle border
//               shape: RoundedRectangleBorder(
//                 side: const BorderSide(color: Colors.indigo),
//                 borderRadius: BorderRadius.circular(20.0),
//               ),
//               child: const Text(
//                 "Open Scanner",
//                 style: TextStyle(color: Colors.indigo),
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
