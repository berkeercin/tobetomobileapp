import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tobetomobileapp/blocs/calendar/calendar_bloc.dart';
import 'package:tobetomobileapp/blocs/calendar/calendar_event.dart';
import 'package:tobetomobileapp/blocs/calendar/calendar_state.dart';
import 'package:tobetomobileapp/packages/cell_calendar/cell_calendar.dart';
import 'package:tobetomobileapp/widgets/global_widgets/appBar_logo.dart';

class CalendarScreen extends StatefulWidget {
  const CalendarScreen({Key? key}) : super(key: key);

  @override
  _CalendarScreenState createState() => _CalendarScreenState();
}

final today = DateTime.now();
const eventTextStyle = TextStyle(
  fontSize: 9,
  color: Colors.white,
);
final sampleEvents = [
  CalendarEvent(
    eventName: "New iPhone",
    eventDate: today.add(const Duration(days: -42)),
    eventBackgroundColor: Colors.black,
    eventTextStyle: eventTextStyle,
  ),
  CalendarEvent(
    eventName: "Writing test",
    eventDate: today.add(const Duration(days: -30)),
    eventBackgroundColor: Colors.deepOrange,
    eventTextStyle: eventTextStyle,
  ),
  CalendarEvent(
    eventName: "Play soccer",
    eventDate: today.add(const Duration(days: -7)),
    eventBackgroundColor: Colors.greenAccent,
    eventTextStyle: eventTextStyle,
  ),
  CalendarEvent(
    eventName: "Learn about history",
    eventDate: today.add(
      const Duration(days: -7),
    ),
    eventTextStyle: eventTextStyle,
  ),
  CalendarEvent(
    eventName: "Buy new keyboard",
    eventDate: today.add(
      const Duration(days: -7),
    ),
    eventTextStyle: eventTextStyle,
  ),
  CalendarEvent(
    eventName: "Walk around the park",
    eventDate: today.add(const Duration(days: -7)),
    eventBackgroundColor: Colors.deepOrange,
    eventTextStyle: eventTextStyle,
  ),
  CalendarEvent(
    eventName: "Buy a present for Rebecca",
    eventDate: today.add(const Duration(days: -7)),
    eventBackgroundColor: Colors.pink,
    eventTextStyle: eventTextStyle,
  ),
  CalendarEvent(
    eventName: "Firebase",
    eventDate: today.add(
      const Duration(days: -7),
    ),
    eventTextStyle: eventTextStyle,
  ),
  CalendarEvent(
    eventName: "Task deadline",
    eventDate: today,
    eventTextStyle: eventTextStyle,
  ),
  CalendarEvent(
    eventName: "Jon's Birthday",
    eventDate: today.add(
      const Duration(days: 3),
    ),
    eventBackgroundColor: Colors.green,
    eventTextStyle: eventTextStyle,
  ),
  CalendarEvent(
    eventName: "Date with Rebecca",
    eventDate: today.add(const Duration(days: 7)),
    eventBackgroundColor: Colors.pink,
    eventTextStyle: eventTextStyle,
  ),
  CalendarEvent(
    eventName: "Start to study Spanish",
    eventDate: today.add(
      const Duration(days: 13),
    ),
    eventTextStyle: eventTextStyle,
  ),
  CalendarEvent(
    eventName: "Have lunch with Mike",
    eventDate: today.add(const Duration(days: 13)),
    eventBackgroundColor: Colors.green,
    eventTextStyle: eventTextStyle,
  ),
  CalendarEvent(
    eventName: "Buy new Play Station software",
    eventDate: today.add(const Duration(days: 13)),
    eventBackgroundColor: Colors.indigoAccent,
    eventTextStyle: eventTextStyle,
  ),
  CalendarEvent(
    eventName: "Update my flutter package",
    eventDate: today.add(
      const Duration(days: 13),
    ),
    eventTextStyle: eventTextStyle,
  ),
  CalendarEvent(
    eventName: "Watch movies in my house",
    eventDate: today.add(
      const Duration(days: 21),
    ),
    eventTextStyle: eventTextStyle,
  ),
  CalendarEvent(
    eventName: "Medical Checkup",
    eventDate: today.add(const Duration(days: 30)),
    eventBackgroundColor: Colors.red,
    eventTextStyle: eventTextStyle,
  ),
  CalendarEvent(
    eventName: "Gym",
    eventDate: today.add(const Duration(days: 42)),
    eventBackgroundColor: Colors.indigoAccent,
    eventTextStyle: eventTextStyle,
  ),
];

class _CalendarScreenState extends State<CalendarScreen> {
  late String assetImage;
  late Brightness brightness;
  Color textColor = Colors.white;
  Color backgroundColor = Colors.black;
  late Color containerColor = Colors.black;
  late String istanbulKodluyorImage;
  final cellCalendarPageController = CellCalendarPageController();

  @override
  void didChangeDependencies() {
    // TODO: implement didChangeDependencies
    super.didChangeDependencies();
    brightness = MediaQuery.of(context).platformBrightness;

    if (brightness == Brightness.dark) {
      assetImage = 'assets/images/tobeto-logo.png';
      textColor = Colors.white;
      backgroundColor = Colors.black;
      containerColor = Colors.grey.withOpacity(0.1);
      istanbulKodluyorImage = 'assets/images/istanbul-kodluyor-dark.png';
    } else {
      assetImage = 'assets/images/tobeto-logo.png';
      istanbulKodluyorImage = 'assets/images/istanbul-kodluyor-light.png';
      textColor = Colors.black;
      backgroundColor = Colors.white;
      containerColor = backgroundColor;
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<CalendarBloc, CalendarBlocState>(
      listener: (context, state) {},
      child: Scaffold(
        appBar: AppBar(flexibleSpace: AppBarLogo(brightness: brightness)),
        body: BlocBuilder<CalendarBloc, CalendarBlocState>(
          builder: (context, state) {
            if (state is InitializePage) {
              context.read<CalendarBloc>().add(LoadCalender());
              return const Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CircularProgressIndicator(),
                    Text("Takvim yükleniyor")
                  ],
                ),
              );
            }
            if (state is LoadedPage) {
              return RefreshIndicator(
                onRefresh: () async {},
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Container(
                        decoration: BoxDecoration(
                            border: Border.all(color: textColor, width: 2)),
                        height: MediaQuery.of(context).size.height / 2,
                        // width: MediaQuery.of(context).size.width / 1.1,
                        child: CellCalendar(
                          cellCalendarPageController:
                              cellCalendarPageController,
                          events: state.calendarEvents,
                          daysOfTheWeekBuilder: ((dayIndex) {
                            final labels = [
                              "Pt",
                              "Sa",
                              "Ça",
                              "Pe",
                              "Cu",
                              "Ct",
                              "Pa"
                            ];
                            return Padding(
                              padding: EdgeInsets.all(16),
                              child: Text(labels[dayIndex],
                                  textAlign: TextAlign.center),
                            );
                          }),
                          monthYearLabelBuilder: (datetime) {
                            final year = datetime!.year.toString();
                            final month = datetime.month.monthName;
                            return Padding(
                              padding: const EdgeInsets.symmetric(vertical: 4),
                              child: Row(
                                children: [
                                  const SizedBox(width: 16),
                                  Text(
                                    "$year $month",
                                    style: const TextStyle(
                                      fontSize: 24,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  const Spacer(),
                                  Container(
                                    decoration: BoxDecoration(
                                        border: Border.all(
                                            color: textColor, width: 1),
                                        borderRadius:
                                            BorderRadius.circular(24)),
                                    child: TextButton(
                                      child: Text("Bugün"),
                                      // icon: const Icon(Icons.calendar_today),
                                      onPressed: () {
                                        cellCalendarPageController
                                            .animateToDate(
                                          DateTime.now(),
                                          curve: Curves.linear,
                                          duration:
                                              const Duration(milliseconds: 300),
                                        );
                                      },
                                    ),
                                  )
                                ],
                              ),
                            );
                          },
                          onCellTapped: (date) {
                            final eventsOnTheDate =
                                state.calendarEvents.where((event) {
                              final eventDate = event.eventDate;
                              return eventDate.year == date.year &&
                                  eventDate.month == date.month &&
                                  eventDate.day == date.day;
                            }).toList();
                            showDialog(
                                context: context,
                                builder: (_) => AlertDialog(
                                      title: Text(
                                          "${date.day} ${date.month.monthName}"),
                                      content: Column(
                                        mainAxisSize: MainAxisSize.min,
                                        children: eventsOnTheDate
                                            .map(
                                              (event) => Container(
                                                width: double.infinity,
                                                padding:
                                                    const EdgeInsets.all(4),
                                                margin: const EdgeInsets.only(
                                                    bottom: 12),
                                                color:
                                                    event.eventBackgroundColor,
                                                child: Text(
                                                  event.eventName,
                                                  style:
                                                      TextStyle(fontSize: 16),
                                                ),
                                              ),
                                            )
                                            .toList(),
                                      ),
                                    ));
                          },
                          onPageChanged: (firstDate, lastDate) {
                            /// Called when the page was changed
                            /// Fetch additional events by using the range between [firstDate] and [lastDate] if you want
                          },
                        ),
                      ),
                    ),
                  ],
                ),
              );
            } else {
              return Text("data");
            }
          },
        ),
      ),
    );
  }
}
