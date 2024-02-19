import 'package:flutter/material.dart';

class MButton extends StatelessWidget {
  final Function() onTap;
  final String text;
  final Color bgColor;
  final EdgeInsets? margin;

  const MButton(
      {super.key, required this.onTap, required this.text, required this.bgColor, this.margin});
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
          margin: margin,
          alignment: Alignment.center,
          decoration: BoxDecoration(
              color: bgColor, borderRadius: BorderRadius.circular(8)),
          height: 46,
          width: double.infinity,
          child: Text(
            text,
            textAlign: TextAlign.center,
            style: const TextStyle(color: Colors.white),
          )),
    );
  }
}
