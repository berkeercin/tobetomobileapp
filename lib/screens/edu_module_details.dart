import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:tobetomobileapp/models/home_page/education_content.dart';
import 'package:tobetomobileapp/screens/video_screen.dart';

class EduModuleDetails extends StatefulWidget {
  const EduModuleDetails(
      {Key? key, required this.eduContentList, required this.moduleTitle})
      : super(key: key);
  final List<EducationContent> eduContentList;
  final String moduleTitle;
  @override
  _EduModuleDetailsState createState() => _EduModuleDetailsState();
}

class _EduModuleDetailsState extends State<EduModuleDetails> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Text(
        widget.moduleTitle,
        textAlign: TextAlign.center,
      )),
      body: ListView.builder(
        itemCount: widget.eduContentList.length,
        itemBuilder: (context, index) {
          print(widget.eduContentList[index].isFinished);
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: InkWell(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) =>
                          VideoScreen(eduContent: widget.eduContentList[index]),
                    ));
              },
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Icon(widget.eduContentList[index].isFinished
                      ? Iconsax.tick_circle
                      : null),
                  Text(widget.eduContentList[index].title)
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
