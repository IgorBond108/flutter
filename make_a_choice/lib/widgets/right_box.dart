import 'package:flutter/material.dart';

class RightBoxAnimation extends StatelessWidget {
  final VoidCallback onClicked;
  final List<String> listPrises;
  final bool isOpened;
  const RightBoxAnimation(
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
            icon: Image.asset('assets/images/p-box.png'),
            iconSize: 150,
            onPressed: () {
              onClicked();
            }),
        secondChild: Stack(
          alignment: Alignment.centerLeft,
          children: [
            IconButton(
                icon: Image.asset('assets/images/p-box-o.png'),
                iconSize: 250,
                onPressed: () {
                  // onClicked();
                }),
            Padding(
              padding: const EdgeInsets.only(
                  left: 30, top: 150, right: 170, bottom: 90),
              child: Center(
                heightFactor: 100,
                widthFactor: 100,
                child: Text(
                  listPrises.last,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
