import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tobetomobileapp/blocs/home_screen/homescreen_event.dart';
import 'package:tobetomobileapp/blocs/home_screen/homescreen_state.dart';
import 'package:tobetomobileapp/repositories/user_repository.dart';

class HomeScreenBloc extends Bloc<HomeScreenEvent, HomeScreenState> {
  final UserRepostory userRepostory;
  HomeScreenBloc({required this.userRepostory}) : super(InitializePage()) {
    on<LogOutUser>(logOutUser);
  }
  void logOutUser(HomeScreenEvent event, Emitter<HomeScreenState> emit) {}
}
