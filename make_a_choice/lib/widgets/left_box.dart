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
            iconSize: 230,
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
                iconSize: 330,
                onPressed: () {}),
            Padding(
              padding: const EdgeInsets.only(
                  left: 200, top: 150, right: 30, bottom: 90),
              child: Center(
                heightFactor: 100,
                widthFactor: 100,
                child: Text(listPrises.first,
                    style: const TextStyle(
                        fontSize: 23,
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
