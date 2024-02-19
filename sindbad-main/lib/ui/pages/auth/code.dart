import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sindbad/bloc/auth/bloc.dart';
import 'package:sindbad/bloc/auth/event.dart';
import 'package:sindbad/repository/auth.dart';
import 'package:sindbad/ui/widget/btn.dart';
import 'package:sindbad/ui/widget/loading_dialog.dart';
import 'package:sindbad/utils/color.dart';
import 'package:sindbad/utils/di.dart';

class AuthCodeView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Вход',
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
        const SizedBox(
          height: 40,
        ),
        const Text(
          'Введите код из смс',
          style: TextStyle(color: Colors.grey),
        ),
        Container(
          margin: EdgeInsets.fromLTRB(0, 10, 0, 10),
          padding: EdgeInsets.fromLTRB(8, 0, 8, 0),
          decoration: BoxDecoration(
              border: Border.all(color: MColor.grey),
              borderRadius: BorderRadius.circular(6)),
          child: const TextField(
            decoration: InputDecoration(
              border: InputBorder.none,
              hintText: '',
            ),
          ),
        ),
        const Text(
            'Отправить код повторно через 1:59',
            style: TextStyle(color: Colors.grey)),

        MButton(
          onTap: () {
            getIt<LoadingDialog>().show(context);
            context.read<AuthBloc>().add(AuthSendCodeEvent(context: context));
          },
          text: 'Войти',
          bgColor: MColor.main,
          margin: EdgeInsets.fromLTRB(0, 20, 0, 20),
        ),
        Row(children: [Checkbox(value: false, onChanged: (v){}), Expanded(child: Text('Я соглашаюсь с правилами пользования торговой площадкой и возврата'))],)
      ],
    );
  }
}
