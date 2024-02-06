import 'package:tobetomobileapp/models/home_page/application.dart';

abstract class HomeState {}

class InitializePage extends HomeState {}

class LoadingPage extends HomeState {}

class LoadedPage extends HomeState {
  List<Application> applicationList;
  LoadedPage(this.applicationList);
}
