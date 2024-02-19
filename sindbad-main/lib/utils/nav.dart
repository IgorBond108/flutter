import 'package:flutter/material.dart';

class Nav {
  static replace(context, destination, {bool lazy = false}) {
    if (lazy) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        Navigator.of(context).pushReplacement(
          MaterialPageRoute(
            builder: (context) => destination,
          ),
        );
      });
    } else {
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(
          builder: (context) => destination,
        ),
      );
    }
  }

  static popReturn(context, value, {bool lazy = false}) {
    if (lazy) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        Navigator.pop(context, value);
      });
    } else {
      Navigator.pop(context, value);
    }
  }
}