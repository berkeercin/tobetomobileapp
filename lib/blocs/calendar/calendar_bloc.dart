import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tobetomobileapp/blocs/calendar/calendar_event.dart';
import 'package:tobetomobileapp/blocs/calendar/calendar_state.dart';
import 'package:tobetomobileapp/packages/cell_calendar/cell_calendar.dart';

class CalendarBloc extends Bloc<CalendarBlocEvent, CalendarBlocState> {
  final FirebaseFirestore _firebaseFireStore;
  CalendarBloc({FirebaseFirestore? firebaseFirestore})
      : _firebaseFireStore = firebaseFirestore ?? FirebaseFirestore.instance,
        super(InitializePage()) {
    on<LoadCalender>(loadCalendar);
    on<RefreshCalendarPage>(refreshPage);
  }

  refreshPage(RefreshCalendarPage event, Emitter<CalendarBlocState> emit) {
    emit(InitializePage());
  }

  loadCalendar(LoadCalender event, Emitter<CalendarBlocState> emit) async {
    List<CalendarEvent> calendarEvents = [];
    final snapshot = await _firebaseFireStore.collection("calendarItems").get();
    for (var element in snapshot.docs) {
      Color color = Colors.greenAccent;
      Timestamp timestamp = element['eventDate'];
      print(timestamp);
      DateTime eventTime_ = timestamp.toDate().toLocal();

      var backgroundColor = element['eventBackgroundColor'];
      if (backgroundColor == "pink") {
        color = Colors.pink;
      } else if (backgroundColor == "orange") {
        color = Colors.orange;
      } else if (backgroundColor == "blue") {
        color = Colors.blue;
      } else if (backgroundColor == "cyan") {
        color = Colors.cyan;
      }
      print(eventTime_);
      CalendarEvent calendarEvent = CalendarEvent(
          eventName: element['eventName'],
          eventDate: eventTime_,
          eventBackgroundColor: color,
          eventTextStyle: const TextStyle());
      // CatalogItem item = CatalogItem.fromMap(element.data());
      calendarEvents.add(calendarEvent);
    }

    emit(LoadedPage(calendarEvents: calendarEvents));
  }
}
