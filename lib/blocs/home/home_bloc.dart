import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tobetomobileapp/blocs/home/home_event.dart';
import 'package:tobetomobileapp/blocs/home/home_state.dart';
import 'package:tobetomobileapp/models/home_page/application.dart';
import 'package:tobetomobileapp/models/home_page/news.dart';
import 'package:tobetomobileapp/models/home_page/page_content.dart';
import 'package:tobetomobileapp/models/home_page/survey.dart';
import 'package:tobetomobileapp/models/home_page/education.dart';
import 'package:tobetomobileapp/repositories/home_repository.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  final HomeRepository homeRepository;
  HomeBloc({required this.homeRepository}) : super(InitializePage()) {
    on<LoadPage>(loadPage);
    on<RefreshPage>(refreshPage);
  }
  void loadPage(LoadPage event, Emitter<HomeState> emit) async {
    List<Application> applicationList = await homeRepository.loadApplcations();
    List<Education> educationList = await homeRepository.loadEducations();
    List<News> newsList = await homeRepository.loadNews();
    List<Survey> surveyList = await homeRepository.loadSurveys();
    PageContent content = PageContent(
        applicationList: applicationList,
        newsList: newsList,
        surveyList: surveyList,
        educationList: educationList);
    emit(LoadedPage(content));
  }

  void refreshPage(RefreshPage event, Emitter<HomeState> emit) async {
    emit(InitializePage());
  }
}
