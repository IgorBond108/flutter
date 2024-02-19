import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sindbad/bloc/auth/bloc.dart';
import 'package:sindbad/bloc/auth/event.dart';
import 'package:sindbad/ui/widget/btn.dart';
import 'package:sindbad/utils/color.dart';

class AuthPhoneView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Добро пожаловать!',
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
        const SizedBox(
          height: 40,
        ),
        const Text(
          'Введите номер телефона',
          style: TextStyle(color: Colors.grey),
        ),
        Container(
          margin: EdgeInsets.fromLTRB(0, 10, 0, 10),
          padding: EdgeInsets.fromLTRB(8, 0, 8, 0),
          decoration: BoxDecoration(
              border: Border.all(color: MColor.grey),
              borderRadius: BorderRadius.circular(6)),
          child: Row(children: [
            Container(
                decoration: BoxDecoration(
                    color: Colors.grey.withOpacity(0.2),
                    borderRadius: BorderRadius.circular(6)),
                padding: EdgeInsets.fromLTRB(10, 2, 10, 2),
                margin: EdgeInsets.only(right: 8),
                child: Text('+7')),
            const Expanded(
                child: TextField(
              decoration: InputDecoration(
                border: InputBorder.none,
                hintText: '999 999 99 99',
              ),
            ))
          ]),
        ),
        Container(
            alignment: Alignment.center,
            child: const Text(
                'Мы отправим СМС-сообщение с кодом.\nВведите его в форму для продолжения.',
                style: TextStyle(color: Colors.grey))),
        const SizedBox(
          height: 20,
        ),
        MButton(
          onTap: () {
            context.read<AuthBloc>().add(AuthGetCodeEvent());
          },
          text: 'Получить код',
          bgColor: MColor.main,
          margin: EdgeInsets.fromLTRB(0, 20, 0, 20),
        ),
      ],
    );
  }
}
