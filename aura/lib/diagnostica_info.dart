import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class DiagnosticaInfo extends StatelessWidget {
  const DiagnosticaInfo({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        // floatingActionButton: FloatingActionButton.small(onPressed: () {}),
        // drawerEnableOpenDragGesture: false,
        // appBar: AppBar(),
        body: Column(
      children: [
        Align(alignment: Alignment.topLeft, child: IconButton(onPressed: () {}, icon: const Icon(Icons.arrow_forward_ios))),
        Padding(
          padding: const EdgeInsets.only(top: 170),
          child: Image.asset('assets/list.jpg'),
        ),
      ],
    ));
  }
}
