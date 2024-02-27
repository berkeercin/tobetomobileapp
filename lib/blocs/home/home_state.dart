import 'package:tobetomobileapp/models/home_page/page_content.dart';

abstract class HomeState {}

class InitializePage extends HomeState {}

class LoadingPage extends HomeState {}

class LoadedPage extends HomeState {
  PageContent pageContent;

  LoadedPage(this.pageContent);
}
