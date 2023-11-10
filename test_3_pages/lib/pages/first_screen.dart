import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:test_3_pages/widgets/loading_image.dart';
import 'package:test_3_pages/widgets/text_format.dart';

class FirstScreen extends StatefulWidget {
  const FirstScreen({super.key, required this.title});
  final String title;

  @override
  State<FirstScreen> createState() => _FirstScreenState();
}

var _isObscured = true;
final formKey = GlobalKey<FormState>();

@override
void initState() {
  initState();
  _isObscured = true;
}

class _FirstScreenState extends State<FirstScreen> {

  final TextEditingController _confirmPass = TextEditingController();
  final TextEditingController _pass = TextEditingController();
  String _confirmPassword = '';
  String _password = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Поля ввода'),
      ),
      body: Stack(
        children: [
          Container(
            padding: const EdgeInsetsDirectional.all(10),
            child: Form(
              key: formKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  const FirstLine(),
                  SecondLine(),
                  SecondLine2(),
                  const ThirdLine(),
                  const FourthLine(),
                  const ImageInsert(),
                  const CheckButton()
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  TextFormField SecondLine() {
    return TextFormField(
        controller: _pass,
        onChanged: (value) {
          _password = value;
        },
        validator: (value) {
          if (value != null && value.isEmpty) {
            return "Пожалуйста введите пароль";
          } else {
            return null;
          }
        },
        obscureText: _isObscured,
        enableSuggestions: true,
        autocorrect: true,
        decoration: InputDecoration(
            suffixIcon: IconButton(
                onPressed: () {
                  setState(() {
                    _isObscured = !_isObscured;
                  });
                },
                icon: _isObscured ? const Icon(Icons.visibility) : const Icon(Icons.visibility_off)),
            hintText: 'Пароль',
            icon: const Icon(Icons.lock)));
  }

  TextFormField SecondLine2() {
    return TextFormField(
        autovalidateMode: AutovalidateMode.onUserInteraction,
        controller: _confirmPass,
        onChanged: (value) {
          _confirmPassword = value;
        },
        validator: (value) {
          if (value != null && value.isEmpty) {
            return "Пожалуйста, повторно введите новый пароль";
          } else if (value!.length < 8) {
            return "Длина пароля должна составлять не менее 8 символов";
          } else if (_password != _confirmPassword) {
            return "Пароль должен быть таким же, как указано выше";
          } else {
            return null;
          }
        },
        obscureText: _isObscured,
        enableSuggestions: true,
        autocorrect: true,
        decoration: InputDecoration(
            suffixIcon: IconButton(
                onPressed: () {
                  setState(() {
                    _isObscured = !_isObscured;
                  });
                },
                icon: _isObscured ? const Icon(Icons.visibility) : const Icon(Icons.visibility_off)),
            hintText: 'Подтверждение пароля',
            icon: const Icon(Icons.lock)));
  }
}

class FirstLine extends StatelessWidget {
  const FirstLine({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
        validator: (value) {
          if (value!.isEmpty || !RegExp(r'^[a-zA-Zа-яА-Я]+$').hasMatch(value)) {
            return "Пожалуйста введите правильное текстовое поле";
          } else {
            return null;
          }
        },
        inputFormatters: [
          FilteringTextInputFormatter.allow(RegExp("[a-zA-Zа-яА-Я]")),
        ],
        keyboardType: TextInputType.name,
        decoration: const InputDecoration(hintText: 'Текстовое поле (только буквы)', icon: Icon(Icons.text_decrease)));
  }
}

class ThirdLine extends StatelessWidget {
  const ThirdLine({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
        //Дата.
        validator: (value) {
          if (value!.isEmpty) {
            return "Пожалуйста введите правильную дату";
          } else {
            return null;
          }
        },
        inputFormatters: [
          CustomDateTextFormatter(),
        ],
        keyboardType: TextInputType.name,
        decoration: const InputDecoration(hintText: 'Дата', icon: Icon(Icons.date_range)));
  }
}

class FourthLine extends StatelessWidget {
  const FourthLine({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
        validator: (value) {
          if (value!.isEmpty || !RegExp(r'^[0-9]+$').hasMatch(value)) {
            return "Пожалуйста введите правильно цифровое поле";
          } else {
            return null;
          }
        },
        inputFormatters: [
          FilteringTextInputFormatter.allow(RegExp("[0-9]")),
        ],
        keyboardType: TextInputType.name,
        decoration: const InputDecoration(hintText: 'Цифровое поле', icon: Icon(Icons.numbers)));
  }
}

class CheckButton extends StatelessWidget {
  const CheckButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () {
        if (formKey.currentState!.validate()) {}
      },
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: const [
          Icon(Icons.check),
          Text('Подтвердить'),
        ],
      ),
    );
  }
}
