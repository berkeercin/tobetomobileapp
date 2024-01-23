import 'package:flutter/material.dart';

abstract class AuthEvent {}

class CheckLogin extends AuthEvent {}

class LoginUser extends AuthEvent {
  final BuildContext context;
  final String email;
  final String password;
  LoginUser(
      {required this.context, required this.email, required this.password});
}

class SignUpUser extends AuthEvent {
  final BuildContext context;
  final String username;
  final String name;
  final String surname;
  final String password;
  final String email;
  SignUpUser(
      {required this.context,
      required this.email,
      required this.name,
      required this.password,
      required this.surname,
      required this.username});
}

class ReturnLoginScreen extends AuthEvent {}
