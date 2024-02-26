import 'package:flutter/material.dart';
import 'package:tobetomobileapp/dummydata/video_list.dart';
import 'package:tobetomobileapp/models/home_page/application.dart';
import 'package:tobetomobileapp/models/home_page/news.dart';
import 'package:tobetomobileapp/models/home_page/page_content.dart';
import 'package:tobetomobileapp/models/home_page/survey.dart';
import 'package:tobetomobileapp/models/home_page/education.dart';
import 'package:tobetomobileapp/widgets/homepage/tabbar/surveystab.dart';
import 'package:tobetomobileapp/widgets/homepage/tabbar/applicationstab.dart';
import 'package:tobetomobileapp/widgets/homepage/tabbar/newstab.dart';
import 'package:tobetomobileapp/widgets/homepage/tabbar/educationstab.dart';

class HomeButtonCreator extends StatefulWidget {
  const HomeButtonCreator(
      {Key? key,
      required this.name,
      required this.buttonId,
      required this.textColor,
      required this.selectedButton,
      required this.onPressed,
      required this.pagecontent})
      : super(key: key);
  final String name;
  final int buttonId;
  final Color textColor;
  final int selectedButton;
  final PageContent pagecontent;
  final void Function(Widget newWidget, int number) onPressed;
  @override
  State<HomeButtonCreator> createState() => _HomeButtonCreatorState();
}

class _HomeButtonCreatorState extends State<HomeButtonCreator> {
  Widget container1 = ApplicationsTab(
    applicationsList: [],
  );
  Widget container2 = EducationsTab(
    eduList: [],
  );
  Widget container3 = const NewsTab(
    newsList: [],
  );
  Widget container4 = const SurveysTab(
    surveyList: [],
  );

  @override
  Widget build(BuildContext context) {
    Color notSelectedTextColor = widget.textColor.withOpacity(0.3);
    Color selectedTextColor = widget.textColor;
    int selectedButton = widget.selectedButton;
    return Column(
      children: [
        TextButton(
          onPressed: () {
            setState(() {
              selectedButton = widget.buttonId;
              if (selectedButton == 1) {
                widget.onPressed(
                    ApplicationsTab(
                        applicationsList: widget.pagecontent.applicationList),
                    selectedButton);
              } else if (selectedButton == 2) {
                widget.onPressed(
                    EducationsTab(
                      eduList: widget.pagecontent.educationList,
                    ),
                    selectedButton);
              } else if (selectedButton == 3) {
                widget.onPressed(NewsTab(newsList: widget.pagecontent.newsList),
                    selectedButton);
              } else if (selectedButton == 4) {
                widget.onPressed(
                    SurveysTab(surveyList: widget.pagecontent.surveyList),
                    selectedButton);
              } else {
                widget.onPressed(Container(), 1);
              }
            });
          },
          child: Text(
            widget.name,
            style: TextStyle(
              color: (selectedButton == widget.buttonId)
                  ? selectedTextColor
                  : notSelectedTextColor,
            ),
          ),
        ),
        if (selectedButton == widget.buttonId)
          SizedBox(
            height: 1,
            width: 120,
            child: Container(
              color: widget.textColor,
            ),
          ),
      ],
    );
  }
}
