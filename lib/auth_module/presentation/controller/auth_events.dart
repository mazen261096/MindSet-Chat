import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

abstract class AuthEvents extends Equatable{
  const AuthEvents();

  @override
  List<Object> get props =>[];
}


class RegisterByEmailEvent extends AuthEvents {
final String email ;
final String password ;
final String name ;
final BuildContext context;
const RegisterByEmailEvent({
  required this.email,
  required this.password,
  required this.name,
  required this.context,
});
}

class LoginByEmailEvent extends AuthEvents {
  final String email;
  final String password;
  final BuildContext context;


  const LoginByEmailEvent({required this.email,required this.password,required this.context});
}

class LogOutEvent extends AuthEvents {
  final BuildContext context ;
  const LogOutEvent({required this.context});
}