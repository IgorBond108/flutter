import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sindbad/bloc/auth/event.dart';
import 'package:sindbad/bloc/auth/state.dart';
import 'package:sindbad/repository/auth.dart';
import 'package:sindbad/ui/pages/main/main.dart';
import 'package:sindbad/utils/di.dart';
import 'package:sindbad/utils/nav.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  AuthBloc() : super(AuthPhoneState()) {
    on<AuthSendCodeEvent>(_sendCode);
    on<AuthGetCodeEvent>(_getCode);
  }

  _sendCode(AuthSendCodeEvent event, emit) async {
    var success = await getIt<AuthRepository>().login();
    if (success){ Nav.replace(event.context, MainPage());}
    else{
      emit(AuthPhoneState());
    }
  }

  _getCode(AuthGetCodeEvent event, emit) {
    emit(AuthCodeState());
  }
}
