import 'package:flutter/material.dart';
import 'package:sindbad/utils/color.dart';

class LoadingDialog {
  BuildContext? ctxt;
  bool shown = false;

  show(context) {
    if (shown) return;
    ctxt = context;
    shown = true;
    showDialog(
      barrierDismissible: false,
      context: context,
      builder: (context) {
        return Dialog(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20),
            ),
            elevation: 0,
            backgroundColor: Colors.transparent,
            child: Container(
              alignment: Alignment.center,
              child: Container(
                padding: EdgeInsets.all(30),
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(20)),
                width: 100,
                height: 100,
                child: CircularProgressIndicator(valueColor: AlwaysStoppedAnimation<Color>(MColor.main),),
              ),
            ));
      },
    ).then((value) => shown = false);
  }

  void hide() {
    if (shown) {
      shown = false;
      if (ctxt != null) {
        Navigator.pop(ctxt!);
      }
    }
  }
}
