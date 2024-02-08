import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tobetomobileapp/blocs/catalog/catalog_bloc.dart';
import 'package:tobetomobileapp/blocs/catalog/catalog_event.dart';
import 'package:tobetomobileapp/blocs/catalog/catalog_state.dart';
import 'package:tobetomobileapp/themes/dark_light_theme.dart';
import 'package:tobetomobileapp/widgets/global_widgets/tobeto_app_bar.dart';
import 'package:tobetomobileapp/widgets/global_widgets/dropdown_creator.dart';

class CatalogScreen extends StatefulWidget {
  const CatalogScreen({Key? key}) : super(key: key);

  @override
  _CatalogScreenState createState() => _CatalogScreenState();
}

class _CatalogScreenState extends State<CatalogScreen> {
  late Brightness brightness;
  late String assetImage;
  late Color textColor;
  late Color backgroundColor;
  TextEditingController filterController = TextEditingController();
  List<String> categoryList = [];
  List<String> educationList = [];
  List<String> eduLevelList = [];
  List<String> eduTopicList = [];
  List<String> eduSoftwareList = [];
  List<String> instructiorsList = [];
  List<String> statusList = [];
  String? category;
  String? education;
  String? eduLevel;
  String? eduTopic;
  String? eduSoftware;
  String? instructor;
  String? status;
  String? eduType;
  @override
  void didChangeDependencies() {
    // TODO: implement didChangeDependencies
    super.didChangeDependencies();
    darkLightTheme(context);
  }

  void chooseFilter(List<String> list) {
    setState(() {
      if (list[0] == "Kategori") {
        category = list[1];
      } else if (list[0] == "Eğitimler") {
        education = list[1];
      } else if (list[0] == "Seviye") {
        eduLevel = list[1];
      } else if (list[0] == "Konu") {
        eduTopic = list[1];
      } else if (list[0] == "Yazılım Dili") {
        eduSoftware = list[1];
      } else if (list[0] == "Eğitmen") {
        instructor = list[1];
      } else if (list[0] == "Durum") {
        status = list[1];
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<CatalogBloc, CatalogState>(
      listener: (context, state) {},
      child: Scaffold(
        appBar: AppBar(
          flexibleSpace: TobetoAppBar(brightness: brightness),
          actions: [
            Padding(
              padding: const EdgeInsets.only(bottom: 2, right: 16),
              child: InkWell(
                child: Icon(Icons.refresh),
                onTap: () {
                  context
                      .read<CatalogBloc>()
                      .add(LoadCatalog(brightness, null));
                },
              ),
            )
          ],
        ),
        body: BlocBuilder<CatalogBloc, CatalogState>(
          builder: (context, state) {
            if (state is Initialize) {
              context.read<CatalogBloc>().add(LoadCatalog(brightness, null));
              return const Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CircularProgressIndicator(),
                    Text("Sayfa Yükleniyor...")
                  ],
                ),
              );
            } else if (state is LoadedPage) {
              return SingleChildScrollView(
                child: Wrap(
                  children: [
                    Column(
                      children: [
                        Row(
                          children: [
                            Container(
                              decoration: const BoxDecoration(
                                  image: DecorationImage(
                                      image: AssetImage(
                                "assets/images/catalog-screen-top.png",
                              ))),
                              height: MediaQuery.of(context).size.height / 2.5,
                              width: MediaQuery.of(context).size.width,
                              child: Center(
                                  child: Container(
                                decoration: BoxDecoration(
                                    color: Colors.black.withOpacity(.5)),
                                child: SizedBox(
                                  height:
                                      MediaQuery.of(context).size.height / 7.5,
                                  width:
                                      MediaQuery.of(context).size.width / 1.2,
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Column(
                                      children: [
                                        const Text(
                                          "Öğrenmeye başla!",
                                          style: TextStyle(
                                              fontSize: 20,
                                              color: Colors.white),
                                        ),
                                        Container(
                                          decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(16),
                                            color: backgroundColor,
                                          ),
                                          child: Row(
                                            children: [
                                              Expanded(
                                                child: TextField(
                                                  controller: filterController,
                                                  decoration:
                                                      const InputDecoration(
                                                          border:
                                                              InputBorder.none),
                                                  style: TextStyle(
                                                    color: textColor,
                                                  ),
                                                ),
                                              ),
                                              InkWell(
                                                onTap: () {
                                                  if (filterController.text ==
                                                      "") {
                                                    context
                                                        .read<CatalogBloc>()
                                                        .add(LoadCatalog(
                                                            brightness, ""));
                                                  } else {
                                                    context
                                                        .read<CatalogBloc>()
                                                        .add(LoadCatalog(
                                                            brightness,
                                                            filterController
                                                                .text));
                                                    // loadCatalogItems(
                                                    //     filterController.text,
                                                    //     state.catalogItems);
                                                  }
                                                },
                                                child: const Icon(Icons.search),
                                              )
                                            ],
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                              )),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 50,
                          width: MediaQuery.of(context).size.width / 1.2,
                          child: ElevatedButton(
                            onPressed: () {
                              setState(() {
                                category = null;
                                education = null;
                                eduLevel = null;
                                eduTopic = null;
                                eduSoftware = null;
                                instructor = null;
                                status = null;
                              });
                              showDialog(
                                context: context,
                                builder: (context) {
                                  return AlertDialog(
                                    content: SizedBox(
                                      height:
                                          MediaQuery.of(context).size.height /
                                              2,
                                      width:
                                          MediaQuery.of(context).size.width / 2,
                                      child: SingleChildScrollView(
                                          child: Column(
                                        children: [
                                          CreateTobetoDropdown(
                                              title: "Kategori",
                                              dropdownList: state.categoryList,
                                              onChoose: chooseFilter),
                                          CreateTobetoDropdown(
                                              title: "Eğitimler",
                                              dropdownList: state.educationList,
                                              onChoose: chooseFilter),
                                          CreateTobetoDropdown(
                                              title: "Seviye",
                                              dropdownList: state.eduLevelList,
                                              onChoose: chooseFilter),
                                          CreateTobetoDropdown(
                                              title: "Konu",
                                              dropdownList: state.eduTopicList,
                                              onChoose: chooseFilter),
                                          CreateTobetoDropdown(
                                              title: "Yazılım Dili",
                                              dropdownList:
                                                  state.eduSoftwareList,
                                              onChoose: chooseFilter),
                                          CreateTobetoDropdown(
                                              title: "Eğitim Türü",
                                              dropdownList: state.eduTypeList,
                                              onChoose: chooseFilter),
                                          CreateTobetoDropdown(
                                              title: "Eğitmen",
                                              dropdownList:
                                                  state.instructiorsList,
                                              onChoose: chooseFilter),
                                          CreateTobetoDropdown(
                                              title: "Durum",
                                              dropdownList: state.statusList,
                                              onChoose: chooseFilter),
                                          SizedBox(
                                              height: 50,
                                              width: MediaQuery.of(context)
                                                      .size
                                                      .width /
                                                  1.2,
                                              child: ElevatedButton(
                                                onPressed: () {
                                                  context
                                                      .read<CatalogBloc>()
                                                      .add(LoadFilteredCatalog(
                                                          category,
                                                          eduLevel,
                                                          eduSoftware,
                                                          eduTopic,
                                                          education,
                                                          eduType,
                                                          instructor,
                                                          status,
                                                          brightness));
                                                  Navigator.pop(context);
                                                },
                                                child: const Text("Filtrele"),
                                              ))
                                        ],
                                      )),
                                    ),
                                  );
                                },
                              );
                            },
                            child: const Text("Filtrele"),
                          ),
                        ),
                        Column(children: state.catalogWidgets)
                      ],
                    )
                  ],
                ),
              );
            } else {
              return const Center(
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [Text("Bilinmedik hata")]),
              );
            }
          },
        ),
      ),
    );
  }

  void darkLightTheme(BuildContext context) {
    brightness = MediaQuery.of(context).platformBrightness;
    if (brightness == Brightness.dark) {
      setState(() {
        assetImage = DarkThemeStyle().darkThemeImage;
        textColor = DarkThemeStyle().darkTextColor;
        backgroundColor = DarkThemeStyle().darkBackgroundColor;
      });
    } else if (brightness == Brightness.light) {
      setState(() {
        assetImage = LightThemeStyle().lightThemeImage;
        textColor = LightThemeStyle().lightTextColor;
        backgroundColor = LightThemeStyle().lightBackgroundColor;
      });
    }
  }

  // void loadCatalogItems(String filter, List<CatalogItem> catalogItem) {
  //   List<Widget> itemList = [];
  //   print("test");
  //   List<String> _categories = [];
  //   List<String> _educations = [];
  //   List<String> _eduLevel = [];
  //   List<String> _eduTopic = [];
  //   List<String> _eduSoftware = [];
  //   List<String> _instructiors = [];
  //   List<String> _status = [];
  //   catalogItem.forEach(
  //     (element) {
  //       if (filter == "") {
  //         _categories.add(element.category);
  //         _educations.add(element.eduType);
  //         _eduLevel.add(element.eduLevel);
  //         _eduTopic.add(element.eduTopic);
  //         _eduSoftware.add(element.softwareLang);
  //         _instructiors.add(element.instructor);
  //         _status.add(element.status);
  //         Widget item = InkWell(
  //           onTap: () {},
  //           child: Padding(
  //             padding: const EdgeInsets.all(12),
  //             child: Container(
  //               height: 250,
  //               width: 400,
  //               child: Card(
  //                 child: Container(
  //                   decoration: BoxDecoration(
  //                       borderRadius: BorderRadius.circular(16),
  //                       image: DecorationImage(
  //                           fit: BoxFit.cover,
  //                           image: NetworkImage(element.imgURL))),
  //                   // color: Colors.red,
  //                   child: Align(
  //                     alignment: Alignment.bottomCenter,
  //                     child: Container(
  //                       color: backgroundColor.withOpacity(.9),
  //                       width: double.infinity,
  //                       height: 250 / 4,
  //                       child: Column(
  //                         children: [
  //                           Text(
  //                             element.title,
  //                           ),
  //                           const Spacer(),
  //                           Row(
  //                             mainAxisAlignment: MainAxisAlignment.start,
  //                             children: [
  //                               const Icon(Icons.person),
  //                               Text(element.instructor),
  //                               const SizedBox(
  //                                 width: 15,
  //                               ),
  //                               const Icon(Icons.alarm_sharp),
  //                               Text(element.duration)
  //                             ],
  //                           ),
  //                         ],
  //                       ),
  //                     ),
  //                   ),
  //                 ),
  //               ),
  //             ),
  //           ),
  //         );
  //         itemList.add(item);
  //       } else {
  //         if (element.title.contains(filter)) {
  //           Widget item = InkWell(
  //             onTap: () {},
  //             child: Padding(
  //               padding: const EdgeInsets.all(12),
  //               child: Container(
  //                 height: 250,
  //                 width: 400,
  //                 child: Card(
  //                   child: Container(
  //                     decoration: BoxDecoration(
  //                         borderRadius: BorderRadius.circular(16),
  //                         image: DecorationImage(
  //                             fit: BoxFit.cover,
  //                             image: NetworkImage(element.imgURL))),
  //                     // color: Colors.red,
  //                     child: Align(
  //                       alignment: Alignment.bottomCenter,
  //                       child: Container(
  //                         color: backgroundColor.withOpacity(.9),
  //                         width: double.infinity,
  //                         height: 250 / 4,
  //                         child: Column(
  //                           children: [
  //                             Text(
  //                               element.title,
  //                             ),
  //                             const Spacer(),
  //                             Row(
  //                               mainAxisAlignment: MainAxisAlignment.start,
  //                               children: [
  //                                 const Icon(Icons.person),
  //                                 Text(element.instructor),
  //                                 const SizedBox(
  //                                   width: 15,
  //                                 ),
  //                                 const Icon(Icons.alarm_sharp),
  //                                 Text(element.duration)
  //                               ],
  //                             ),
  //                           ],
  //                         ),
  //                       ),
  //                     ),
  //                   ),
  //                 ),
  //               ),
  //             ),
  //           );
  //           itemList.add(item);
  //         }
  //       }
  //     },
  //   );
  //   setState(() {
  //     _catalogItems = itemList;
  //     categoryList = _categories;
  //     educationList = _educations;
  //     eduLevelList = _eduLevel;
  //     eduTopicList = _eduTopic;
  //     eduSoftwareList = _eduSoftware;
  //     instructiorsList = _instructiors;
  //     statusList = _status;
  //   });
  // }
}

// List<CatalogItem> rawCatalogItems = [
  // CatalogItem(
  //     author: "test",
  //     duration: "2 Hr 2 min",
  //     title: "Test Video",
  //     imgURL: "https://tobeto.s3.cloud.ngn.com.tr/ENK_36573_a8546fa0ff.jpg",
  //     category: "Ücretli Eğitimler",
  //     eduLevel: "Medium",
  //     eduTopic: "Topic",
  //     eduType: "Type",
  //     instructor: "A",
  //     softwareLang: "C++",
  //     status: "Active"),
//   CatalogItem(
//       // author: "example",
//       duration: "1 Hr 30 min",
//       title: "Example Course",
//       imgURL: "https://tobeto.s3.cloud.ngn.com.tr/ENK_36573_a8546fa0ff.jpg",
//       category: "Ücretli Eğitimler",
//       eduLevel: "Beginner",
//       eduTopic: "Programming",
//       eduType: "Video Lecture",
//       instructor: "B",
//       softwareLang: "Java",
//       status: "Active"),
//   CatalogItem(
//       author: "instructorX",
//       duration: "3 Hr 45 min",
//       title: "Advanced Programming",
//       imgURL: "https://tobeto.s3.cloud.ngn.com.tr/ENK_36573_a8546fa0ff.jpg",
//       category: "Ücretli Eğitimler",
//       eduLevel: "Advanced",
//       eduTopic: "Software Development",
//       eduType: "Workshop",
//       instructor: "X",
//       softwareLang: "C++",
//       status: "Upcoming"),
//   CatalogItem(
//       author: "educator123",
//       duration: "1 Hr",
//       title: "Introduction to Python",
//       imgURL: "https://tobeto.s3.cloud.ngn.com.tr/ENK_36573_a8546fa0ff.jpg",
//       category: "Ücretli Eğitimler",
//       eduLevel: "Beginner",
//       eduTopic: "Python Programming",
//       eduType: "Tutorial",
//       instructor: "C",
//       softwareLang: "Python",
//       status: "Active"),
//   CatalogItem(
//       author: "codingMaster",
//       duration: "2 Hr 30 min",
//       title: "Web Development Essentials",
//       imgURL: "https://tobeto.s3.cloud.ngn.com.tr/ENK_36573_a8546fa0ff.jpg",
//       category: "Ücretli Eğitimler",
//       eduLevel: "Intermediate",
//       eduTopic: "Web Development",
//       eduType: "Online Course",
//       instructor: "D",
//       softwareLang: "HTML, CSS, JavaScript",
//       status: "Active"),
//   CatalogItem(
//       author: "test",
//       duration: "2 Hr 2 min",
//       title: "Test Video",
//       imgURL: "https://tobeto.s3.cloud.ngn.com.tr/ENK_36573_a8546fa0ff.jpg",
//       category: "Ücretsiz Eğitimler",
//       eduLevel: "Medium",
//       eduTopic: "Topic",
//       eduType: "Type",
//       instructor: "A",
//       softwareLang: "C++",
//       status: "Active")
// ];
