import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class FillProfilePageWidget extends StatefulWidget {
  const FillProfilePageWidget({Key? key}) : super(key: key);

  @override
  _FillProfilePageWidgetState createState() => _FillProfilePageWidgetState();
}

class _FillProfilePageWidgetState extends State<FillProfilePageWidget> {
  final scaffoldKey = GlobalKey<ScaffoldState>();
  final TextEditingController _dateController = TextEditingController();
  final DateFormat _dateFormat = DateFormat('dd.MM.yyyy');

  String? _validateAge(String input) {
    DateTime currentDate = DateTime.now();
    DateTime selectedDate = _dateFormat.parse(currentDate as String);
    Duration difference = currentDate.difference(selectedDate);

    if (difference.inDays < 18 * 365) {
      return 'Вы не достигли 18 лет';
    } else if (difference.inDays > 100 * 365) {
      return 'Вы превысили 100 лет';
    }

    return null;
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Scaffold(
        key: scaffoldKey,
        appBar: AppBar(
          automaticallyImplyLeading: false,
        ),
        body: SafeArea(
          top: true,
          child: Column(
            children: [
              TextField(
                controller: _dateController,
                decoration: InputDecoration(
                  labelText: 'Введите дату (дд.мм.гггг)',
                ),
                textInputAction: TextInputAction.done,
                keyboardType: TextInputType.datetime,
                onChanged: (value) {
                  // Проверка возраста при изменении текста в поле
                  String? errorText = _validateAge(value);
                  if (errorText != null) {
                    // Показать ошибку, если возраст не соответствует
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text(errorText)),
                    );
                  }
                },
                onSubmitted: (value) {
                  // Проверка возраста при подтверждении ввода (например, нажатии Enter)
                  String? errorText = _validateAge(value);
                  if (errorText == null) {
                    // Сохраните значение в базе данных, если возраст соответствует
                    // TODO: Сохраните значение в вашей базе данных
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text('Значение сохранено')),
                    );
                  } else {
                    // Показать ошибку, если возраст не соответствует
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text(errorText)),
                    );
                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
