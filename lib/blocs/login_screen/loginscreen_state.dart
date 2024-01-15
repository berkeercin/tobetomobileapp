import 'package:tobetomobileapp/models/user.dart';

abstract class LoginScreenState {}

class CheckUserLoginData extends LoginScreenState {}

class LoginPage extends LoginScreenState {}

class LoadingUser extends LoginScreenState {}

class LoadedUser extends LoginScreenState {
  final UserData user;
  LoadedUser({required this.user});
}
