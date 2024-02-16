import 'package:tobetomobileapp/models/home_page/application.dart';
import 'package:tobetomobileapp/models/home_page/news.dart';
import 'package:tobetomobileapp/models/home_page/page_content.dart';
import 'package:tobetomobileapp/models/home_page/survey.dart';
import 'package:tobetomobileapp/models/home_page/education.dart';

abstract class HomeState {}

class InitializePage extends HomeState {}

class LoadingPage extends HomeState {}

class LoadedPage extends HomeState {
  PageContent pageContent;
  // List<Application> applicationList;
  // List<Education> educationList;
  // List<News> newsList;
  // List<Survey> surveyList;
  LoadedPage(this.pageContent);
}
