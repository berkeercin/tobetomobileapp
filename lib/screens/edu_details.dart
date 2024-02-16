import 'package:flutter/material.dart';
import 'package:tobetomobileapp/dummydata/profilepage/education.dart';
import 'package:tobetomobileapp/models/home_page/education.dart';
import 'package:tobetomobileapp/screens/edu_module_details.dart';

class EduDetails extends StatefulWidget {
  const EduDetails({Key? key, required this.education}) : super(key: key);
  final Education education;
  @override
  _EduDetailsState createState() => _EduDetailsState();
}

class _EduDetailsState extends State<EduDetails> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(widget.education.eduTitle)),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: GridView.builder(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2),
          itemCount: widget.education.content.length,
          itemBuilder: (context, index) {
            return InkWell(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => EduModuleDetails(
                          eduContentList:
                              widget.education.content[index].subContent,
                          moduleTitle:
                              widget.education.content[index].contentTitle),
                    ));
              },
              child: Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    color: Colors.blueGrey),
                child: Center(
                  child: Text(
                    widget.education.content[index].contentTitle,
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
