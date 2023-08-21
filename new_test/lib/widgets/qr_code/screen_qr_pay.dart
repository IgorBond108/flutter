import 'dart:async';
import 'dart:io';
import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:flutter_linkify/flutter_linkify.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';
import 'package:url_launcher/url_launcher.dart';

class ScanQR extends StatefulWidget {
  @override
  _ScanQRState createState() => _ScanQRState();
}

class _ScanQRState extends State<ScanQR> {
  Barcode? result;
  QRViewController? controller;
  final GlobalKey qrKey = GlobalKey(debugLabel: 'QR');

  void qr(QRViewController controller) {
    this.controller = controller;
    controller.scannedDataStream.listen((event) async {
      // if (event.code != null) {
      // launchUrl(event.code as Uri);
      // }
      // launchUrl(event.code);
      setState(() {
        result = event;
        log(result.toString());
        // controller.scannedDataStream.first;
      });
    });
  }

  Future<void> openlink(LinkableElement link) async {
    if (!await launchUrl(
      Uri.parse(link.url),
      // mode: LaunchMode.externalApplication
    )) {
      throw Exception('Could not launch ${link.url}');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: false,
        iconTheme: const IconThemeData(color: Colors.black),
        title: const Row(
          children: [
            Text(
              'QR-оплата',
            ),
          ],
        ),
        actions: <Widget>[
          IconButton(
              iconSize: 20,
              onPressed: () {},
              icon: Image.asset('assets/icons_buttomNavigationBar/Vector.png',
                  color: Colors.black)),
          IconButton(
              iconSize: 20,
              onPressed: () {},
              icon: Image.asset('assets/icons_buttomNavigationBar/Vector-2.png',
                  color: Colors.black))
        ],
      ),
      body: Container(
        padding: const EdgeInsets.all(20),
        alignment: Alignment.center,
        // decoration: const BoxDecoration(
        //     image: DecorationImage(
        //   image: AssetImage('assets/icons_buttomNavigationBar/image75.png'),
        // )),
        child: Column(
            // mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Text('Наведите камеру на '),
              const Text('QR-код'),
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
                        // linkStyle: linkTextStyle,
                        // style: messageTextStyle,
                        textWidthBasis: TextWidthBasis.longestLine, text: '',
                      ), // Linkify(text: '',);
                      QRView(key: qrKey, onQRViewCreated: qr),
                    ],
                  )),
              Center(
                  child: (result != null)
                      ? Text('${result!.code}')
                      : Text('Scan a code')),
              const Text(
                  'по коду приложение определить товар или услугу и поможет совершить оплату'),
            ]),
      ),
    );
  }
}
