import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tobetomobileapp/blocs/login_screen/loginscreen_event.dart';
import 'package:tobetomobileapp/blocs/login_screen/loginscreen_state.dart';
import 'package:tobetomobileapp/repositories/user_repository.dart';

class LoginScreenBloc extends Bloc<LoginScreenEvent, LoginScreenState> {
  final UserRepostory userRepostory;
  LoginScreenBloc({required this.userRepostory}) : super(CheckUserLoginData()) {
    on<LoginUser>(_loginUser);
    on<ReturnLoginScreen>(_loginPage);
  }

  void _loginUser(LoginUser event, Emitter<LoginScreenState> emit) async {
    final userData = await userRepostory.loginUser(event.email, event.password);
    emit(LoadedUser(user: userData));
  }

  void _loginPage(LoginScreenEvent event, Emitter<LoginScreenState> emit) {
    emit(LoginPage());
  }
}
