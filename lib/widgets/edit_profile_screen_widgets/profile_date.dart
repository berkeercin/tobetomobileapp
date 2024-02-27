import 'package:flutter/material.dart';
import 'package:tobetomobileapp/constants/global/tobeto_icons.dart';

class ProfileDate extends StatefulWidget {
  const ProfileDate({super.key});

  @override
  State<ProfileDate> createState() => _ProfileDateState();
}

class _ProfileDateState extends State<ProfileDate> {
  late DateTime selectedDate;

  @override
  void initState() {
    super.initState();
    selectedDate = DateTime.now();
  }

  @override
  Widget build(BuildContext context) {
    final double phoneWidth = MediaQuery.of(context).size.width;
    final double phoneHeight = MediaQuery.of(context).size.height;
    return Container(
      width: phoneWidth * 0.9,
      height: phoneHeight * 0.07,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5),
          border: Border.all(style: BorderStyle.solid, color: Colors.black38)),
      child: Row(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              style: const TextStyle(
                fontSize: 16,
              ),
              "${selectedDate.day} . ${selectedDate.month} . ${selectedDate.year}",
            ),
          ),
          const Spacer(),
          InkWell(
            onTap: () async {
              final DateTime? dateTime = await showDatePicker(
                context: context,
                initialDate: selectedDate,
                firstDate: DateTime(1940),
                lastDate: DateTime(2030),
              );
              if (dateTime != null) {
                setState(() {
                  selectedDate = dateTime;
                });
              }
            },
            child: MyIconsax().calendar,
          ),
        ],
      ),
    );
  }
}
