import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

class TimeWidget extends StatelessWidget {
  const TimeWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: Stream.periodic(const Duration(seconds: 60)),
      builder: (context, snapshot) {
        return Center(
          child: Text(
            style: const TextStyle(
                color: Colors.black, fontSize: 36, fontStyle: FontStyle.normal),
            DateFormat.MMMMEEEEd('ru_RU').format(DateTime.now()),
          ),
        );
      },
    );
  }
}
