import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sindbad/bloc/auth/bloc.dart';
import 'package:sindbad/bloc/auth/state.dart';
import 'package:sindbad/ui/pages/auth/code.dart';
import 'package:sindbad/ui/pages/auth/phone.dart';
import 'package:sindbad/ui/widget/loading_dialog.dart';
import 'package:sindbad/utils/di.dart';

class AuthPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AuthBloc(),
      child: BlocBuilder<AuthBloc, AuthState>(builder: (context, state) {
        getIt<LoadingDialog>().hide();
        return Scaffold(
          body: SafeArea(
            child: Padding(
              padding: EdgeInsets.all(15),
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: 30,
                    ),
                    Container(
                        alignment: Alignment.center,
                        child: Image.asset(
                          'assets/icon.png',
                          width: 120,
                        )),
                    Spacer(),
                    if (state is AuthCodeState) AuthCodeView(),
                    if (state is AuthPhoneState) AuthPhoneView(),
                    Spacer(
                      flex: 2,
                    ),
                  ]),
            ),
          ),
        );
      }),
    );
  }
}
