import 'package:tobetomobileapp/models/home_page/education.dart';

abstract class EduContentState {}

class Initialize extends EduContentState {}

class LoadedPage extends EduContentState {
  final Education education;
  LoadedPage(this.education);
}
