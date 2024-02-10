// catalog_repository.dart

import 'package:flutter/material.dart';
import 'package:tobetomobileapp/models/catalog_page/catalog_item.dart';
import 'package:tobetomobileapp/themes/dark_light_theme.dart';

class CatalogRepository {
  CatalogRepository({required this.brightness});
  final Brightness brightness;
  late String assetImage;
  late Color textColor;
  late Color backgroundColor;
  List<String> categoryList = [];
  List<String> educationList = [];
  List<String> eduLevelList = [];
  List<String> eduTopicList = [];
  List<String> eduTypeList = [];
  List<String> eduSoftwareList = [];
  List<String> instructiorsList = [];
  List<String> statusList = [];
  void darkLightTheme() {
    if (brightness == Brightness.dark) {
      assetImage = DarkThemeStyle().darkThemeImage;
      textColor = DarkThemeStyle().darkTextColor;
      backgroundColor = DarkThemeStyle().darkBackgroundColor;
    } else if (brightness == Brightness.light) {
      assetImage = LightThemeStyle().lightThemeImage;
      textColor = LightThemeStyle().lightTextColor;
      backgroundColor = LightThemeStyle().lightBackgroundColor;
    }
  }

  List<dynamic> loadCatalogItems(
      String? filter, List<CatalogItem> catalogItem) {
    darkLightTheme();
    List<Widget> catalogItemWidgets = [];
    print("test");
    List<String> categories_ = [];
    List<String> educations_ = [];
    List<String> eduLevel_ = [];
    List<String> eduTopic_ = [];
    List<String> eduType_ = [];
    List<String> eduSoftware_ = [];
    List<String> instructors_ = [];
    List<String> status_ = [];
    List<CatalogItem> catalogItems = [];
    for (var element in catalogItem) {
      print("this element: " + element.toString());
      // print("this filter: " + filter);
      if (filter == null || filter == "") {
        categories_.add(element.category);
        educations_.add(element.title);
        eduLevel_.add(element.eduLevel);
        eduTopic_.add(element.eduTopic);
        eduType_.add(element.eduType);
        eduSoftware_.add(element.softwareLang);
        instructors_.add(element.instructor);
        status_.add(element.status);
        catalogItems.add(element);
        Widget item = InkWell(
          onTap: () {},
          child: Padding(
            padding: const EdgeInsets.all(12),
            child: Container(
              height: 250,
              width: 400,
              child: Card(
                child: Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(16),
                      image: DecorationImage(
                          fit: BoxFit.cover,
                          image: NetworkImage(element.imgURL))),
                  child: Align(
                    alignment: Alignment.bottomCenter,
                    child: Container(
                      color: backgroundColor.withOpacity(.9),
                      width: double.infinity,
                      height: 250 / 4,
                      child: Column(
                        children: [
                          Text(
                            element.title,
                            style: TextStyle(color: textColor),
                          ),
                          const Spacer(),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Icon(
                                Icons.person,
                                color: textColor,
                              ),
                              Text(
                                element.instructor,
                                style: TextStyle(color: textColor),
                              ),
                              const SizedBox(
                                width: 15,
                              ),
                              Icon(
                                Icons.alarm_sharp,
                                color: textColor,
                              ),
                              Text(
                                element.duration,
                                style: TextStyle(color: textColor),
                              )
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
        );
        catalogItemWidgets.add(item);
      } else {
        if (element.title.contains(filter) ||
            element.title.toLowerCase().contains(filter.toLowerCase()) ||
            element.title.toUpperCase().contains(filter.toUpperCase())) {
          // print("its filtered!");
          Widget item = InkWell(
            onTap: () {},
            child: Padding(
              padding: const EdgeInsets.all(12),
              child: Container(
                height: 250,
                width: 400,
                child: Card(
                  child: Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(16),
                        image: DecorationImage(
                            fit: BoxFit.cover,
                            image: NetworkImage(element.imgURL))),
                    child: Align(
                      alignment: Alignment.bottomCenter,
                      child: Container(
                        color: backgroundColor.withOpacity(.9),
                        width: double.infinity,
                        height: 250 / 4,
                        child: Column(
                          children: [
                            Text(
                              element.title,
                            ),
                            const Spacer(),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                const Icon(Icons.person),
                                Text(element.instructor),
                                const SizedBox(
                                  width: 15,
                                ),
                                const Icon(Icons.alarm_sharp),
                                Text(element.duration)
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          );
          catalogItemWidgets.add(item);
        }
      }
    }

    // Set the values and return the list
    categoryList = categories_;
    educations_ = educations_.toSet().toList();
    educationList = educations_;
    eduLevelList = eduLevel_;
    eduTopicList = eduTopic_;
    eduTypeList = eduType_;
    eduSoftwareList = eduSoftware_;
    instructiorsList = instructors_;
    statusList = status_;

    return [
      catalogItemWidgets,
      categoryList,
      educationList,
      eduLevelList,
      eduTopicList,
      eduTypeList,
      eduSoftwareList,
      instructiorsList,
      statusList,
      catalogItems
    ];
  }

  List<dynamic> loadFilteredCatalogItems(
      String? category,
      String? eduTitle,
      String? eduType,
      String? eduLevel,
      String? eduTopic,
      String? eduSoftwareLang,
      String? eduInstructor,
      String? eduStatus,
      List<CatalogItem> catalogItems) {
    darkLightTheme();
    List<Widget> catalogItemWidgets = [];
    List<CatalogItem> catalogItems_ = [];
    List<String> categories_ = [];
    List<String> eduTitle_ = [];
    List<String> eduLevel_ = [];
    List<String> eduTopic_ = [];
    List<String> eduType_ = [];
    List<String> eduSoftwareLang_ = [];
    List<String> eduInstructors_ = [];
    List<String> eduStatus_ = [];

    for (var element in catalogItems) {
      if (((category == null || category == "") ||
              category == element.category) &&
          ((eduTitle == null || eduTitle == "") || eduTitle == element.title) &&
          ((eduType == null || eduType == "") || eduType == element.eduType) &&
          ((eduLevel == null || eduLevel == "") ||
              eduLevel == element.eduLevel) &&
          ((eduTopic == null || eduTopic == "") ||
              eduTopic == element.eduTopic) &&
          ((eduSoftwareLang == null || eduSoftwareLang == "") ||
              eduSoftwareLang == element.softwareLang) &&
          ((eduInstructor == null || eduInstructor == "") ||
              eduInstructor == element.instructor) &&
          ((eduStatus == null || eduStatus == "") ||
              eduStatus == element.status)) {
        catalogItems_.add(element);
        Widget item = InkWell(
          onTap: () {},
          child: Padding(
            padding: const EdgeInsets.all(12),
            child: Container(
              height: 250,
              width: 400,
              child: Card(
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(16),
                    image: DecorationImage(
                      fit: BoxFit.cover,
                      image: NetworkImage(element.imgURL),
                    ),
                  ),
                  child: Align(
                    alignment: Alignment.bottomCenter,
                    child: Container(
                      color: backgroundColor.withOpacity(.9),
                      width: double.infinity,
                      height: 250 / 4,
                      child: Column(
                        children: [
                          Text(element.title),
                          const Spacer(),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              const Icon(Icons.person),
                              Text(element.instructor),
                              const SizedBox(width: 15),
                              const Icon(Icons.alarm_sharp),
                              Text(element.duration),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
        );
        catalogItemWidgets.add(item);
      }
    }
    categoryList = categories_;
    eduTitle_ = eduTitle_.toSet().toList();
    educationList = eduTitle_;
    eduLevelList = eduLevel_;
    eduTopicList = eduTopic_;
    eduTypeList = eduType_;
    eduSoftwareList = eduSoftwareLang_;
    instructiorsList = eduInstructors_;
    statusList = eduStatus_;

    return [
      catalogItemWidgets,
      categoryList,
      educationList,
      eduLevelList,
      eduTopicList,
      eduTypeList,
      eduSoftwareList,
      instructiorsList,
      statusList,
      catalogItems_
    ];
  }
}
