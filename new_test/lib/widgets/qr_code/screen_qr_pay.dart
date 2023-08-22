import 'dart:async';
import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:flutter_linkify/flutter_linkify.dart';
import 'package:new_test/widgets/main_screen.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';
import 'package:url_launcher/url_launcher.dart';

class ScanQR extends StatefulWidget {
  const ScanQR({super.key});

  @override
  _ScanQRState createState() => _ScanQRState();
}

class _ScanQRState extends State<ScanQR> {
  Barcode? result;
  QRViewController? qrController;
  final GlobalKey qrKey = GlobalKey(debugLabel: 'QR');

  void _onQrViewCreated(QRViewController controller) {
    setState(() {
      qrController = controller;
    });

    controller.scannedDataStream.listen((scanData) {
      controller.pauseCamera();
      log(scanData.code.toString());
      launchUrl(Uri.parse(scanData.code!));
    });
  }

  Future<void> openlink(LinkableElement link) async {
    if (!await launchUrl(
      Uri.parse(link.url),
    )) {
      throw Exception('Could not launch ${link.url}');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            padding: const EdgeInsets.all(20),
            alignment: Alignment.center,
            decoration: const BoxDecoration(
                image: DecorationImage(
              fit: BoxFit.cover,
              alignment: Alignment.topLeft,
              image: AssetImage('assets/icons_buttomNavigationBar/image75.png'),
            )),
            child: Column(
                // mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const SizedBox(
                    height: 163,
                  ),
                  const Text(
                    'Наведите камеру на ',
                    style: TextStyle(color: Colors.white),
                  ),
                  const Text(
                    'QR-код',
                    style: TextStyle(color: Colors.white),
                  ),
                  SizedBox(
                      width: 230,
                      height: 230,
                      child: Stack(
                        children: [
                          Linkify(
                            onOpen: openlink,
                            options: const LinkifyOptions(
                              humanize: false,
                              excludeLastPeriod: false,
                            ),
                            textWidthBasis: TextWidthBasis.longestLine,
                            text: '',
                          ),
                          QRView(key: qrKey, onQRViewCreated: _onQrViewCreated),
                        ],
                      )),
                  const Text(
                    'по коду приложение определить ',
                    style: TextStyle(color: Colors.white),
                  ),
                  const Text(
                    ' товар или услугу и поможет ',
                    style: TextStyle(color: Colors.white),
                  ),
                  const Text(
                    'совершить оплату',
                    style: TextStyle(color: Colors.white),
                  ),
                  const SizedBox(
                    height: 50,
                  ),
                  const Text(
                    'Как это работает',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 17,
                        fontWeight: FontWeight.w500),
                  ),
                ]),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 28),
            child: Row(
              children: [
                const SizedBox(
                  width: 12,
                ),
                IconButton(
                  icon: const Icon(
                    Icons.arrow_back_ios,
                    color: Colors.white,
                  ),
                  onPressed: () {
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => const MyHomePage(
                              title: '',
                            )));
                  },
                ),
                const SizedBox(
                  width: 8,
                ),
                const Text(
                  'QR-оплата',
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.w500),
                ),
                const SizedBox(
                  width: 80,
                ),
                IconButton(
                    iconSize: 20,
                    onPressed: () {},
                    icon: Image.asset(
                        'assets/icons_buttomNavigationBar/Vector.png',
                        color: Colors.white)),
                IconButton(
                    iconSize: 20,
                    onPressed: () {},
                    icon: Image.asset(
                        'assets/icons_buttomNavigationBar/Vector-2.png',
                        color: Colors.white))
              ],
            ),
          ),
        ],
      ),
    );
  }
}
