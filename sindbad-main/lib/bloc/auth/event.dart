import 'package:flutter/material.dart';

class AuthEvent{}
class AuthGetCodeEvent extends AuthEvent{}
class AuthSendCodeEvent extends AuthEvent{
  final BuildContext context;

  AuthSendCodeEvent({required this.context});
}