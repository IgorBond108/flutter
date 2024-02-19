import 'package:flutter/material.dart';
import 'package:sindbad/utils/color.dart';

class MTextField extends StatelessWidget{
  final String? hint;
  final EdgeInsets? margin;

  const MTextField({super.key, this.hint, this.margin});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.fromLTRB(8, 0, 8, 0),
      margin: margin,
      decoration: BoxDecoration(border: Border.all(color: MColor.grey), borderRadius: BorderRadius.circular(8)),
      child: TextField(decoration: InputDecoration(border: InputBorder.none, hintText: hint),),
    );
  }
}