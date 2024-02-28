import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tobetomobileapp/blocs/calendar/calendar_bloc.dart';
import 'package:tobetomobileapp/blocs/calendar/calendar_event.dart';
import 'package:tobetomobileapp/blocs/calendar/calendar_state.dart';
import 'package:tobetomobileapp/packages/cell_calendar/cell_calendar.dart';
import 'package:tobetomobileapp/widgets/global_widgets/tobeto_app_bar.dart';
import 'package:tobetomobileapp/widgets/homepage/tabbar/applicationstab.dart';

class CalendarScreen extends StatefulWidget {
  const CalendarScreen({super.key});

  @override
  _CalendarScreenState createState() => _CalendarScreenState();
}

final today = DateTime.now();
//

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
    super.didChangeDependencies();
    brightness = MediaQuery.of(context).platformBrightness;

    if (brightness == Brightness.dark) {
      assetImage = 'assets/images/tobeto-logo.png';
      textColor = Colors.white;
      backgroundColor = Colors.black;
      containerColor = Colors.grey.withOpacity(0.1);
    } else {
      assetImage = 'assets/images/tobeto-logo.png';
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
        appBar: AppBar(flexibleSpace: TobetoAppBar(brightness: brightness)),
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
                  children: [
                    Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                          border: Border.all(color: textColor, width: 2)),
                      height: MediaQuery.of(context).size.height / 1.3,
                      // width: MediaQuery.of(context).size.width / 1.1,
                      child: CellCalendar(
                        cellCalendarPageController: cellCalendarPageController,
                        events: state.calendarEvents.toList(),
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
                          return Column(
                            //etkinlik liste
                            children: [
                              Text(labels[dayIndex],
                                  style: TextStyle(
                                      fontSize: 18,
                                      color: tobetoColor.reviewColor2,
                                      fontWeight: FontWeight.bold),
                                  textAlign: TextAlign.center),
                            ],
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
                                  style: TextStyle(
                                    color: tobetoColor.iconColor,
                                    fontSize: 28,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                const Spacer(),
                                TextButton(
                                  child: Text(
                                    "Bugün",
                                    style: TextStyle(
                                      color: tobetoColor.iconColor,
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  onPressed: () {
                                    cellCalendarPageController.animateToDate(
                                      DateTime.now(),
                                      curve: Curves.linear,
                                      duration:
                                          const Duration(milliseconds: 300),
                                    );
                                  },
                                ),
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
                                    backgroundColor: tobetoColor.reviewColor2
                                        .withOpacity(0.89),
                                    title: Text(
                                        style:
                                            TextStyle(color: backgroundColor),
                                        "${date.day} ${date.month.monthName}"),
                                    content: Column(
                                      mainAxisSize: MainAxisSize.min,
                                      children: eventsOnTheDate
                                          .map(
                                            (event) => Column(
                                              children: [
                                                Container(
                                                  width: double.infinity,
                                                  padding:
                                                      const EdgeInsets.all(4),
                                                  margin: const EdgeInsets.only(
                                                      bottom: 12),
                                                  color: event
                                                      .eventBackgroundColor,
                                                  child: Text(
                                                    event.eventName,
                                                    style: TextStyle(
                                                        color: backgroundColor,
                                                        fontSize: 16),
                                                  ),
                                                ),
                                              ],
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
                  ],
                ),
              );
            } else {
              return const Text("data");
            }
          },
        ),
      ),
    );
  }
}
