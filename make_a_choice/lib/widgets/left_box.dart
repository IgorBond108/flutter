import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:flutter/material.dart';

class LeftBoxAnimation extends StatelessWidget {
  final List<String> listPrises;
  final VoidCallback onClicked;
  final bool isOpened;
  const LeftBoxAnimation(
      {required this.onClicked,
      required this.isOpened,
      super.key,
      required this.listPrises});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: AnimatedCrossFade(
        duration: const Duration(seconds: 1),
        crossFadeState:
            isOpened ? CrossFadeState.showSecond : CrossFadeState.showFirst,
        firstChild: IconButton(
            icon: Image.asset('assets/images/b-box.png'),
            iconSize: 150,
            onPressed: () async {
              onClicked();
              await FirebaseAnalytics.instance.logEvent(
                name: "select_content",
                parameters: {
                  "content_type": "image",
                  "item_id": 'left',
                },
              );
            }),
        secondChild: Stack(
          alignment: Alignment.centerRight,
          children: [
            IconButton(
                icon: Image.asset('assets/images/b-box-o.png'),
                alignment: Alignment.centerLeft,
                iconSize: 250,
                onPressed: () {}),
            Padding(
              padding: const EdgeInsets.only(
                  left: 180, top: 150, right: 20, bottom: 100),
              child: Center(
                heightFactor: 100,
                widthFactor: 100,
                child: Text(listPrises.first,
                    style: const TextStyle(
                        fontSize: 18,
                        color: Colors.white,
                        fontStyle: FontStyle.normal)),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class SecondChild extends StatelessWidget {
  const SecondChild({super.key});

  @override
  Widget build(BuildContext context) {
    return IconButton(
        icon: Image.asset('assets/images/b-box-o.png'),
        alignment: Alignment.centerLeft,
        iconSize: 150,
        onPressed: () {});
  }
}
