import 'package:tobetomobileapp/packages/cell_calendar/cell_calendar.dart';

abstract class CalendarBlocState {}

class InitializePage extends CalendarBlocState {}

class LoadedPage extends CalendarBlocState {
  final List<CalendarEvent> calendarEvents;
  LoadedPage({required this.calendarEvents});
}
