import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tobetomobileapp/blocs/catalog/catalog_bloc.dart';
import 'package:tobetomobileapp/blocs/catalog/catalog_event.dart';
import 'package:tobetomobileapp/blocs/catalog/catalog_state.dart';
import 'package:tobetomobileapp/themes/dark_light_theme.dart';
import 'package:tobetomobileapp/widgets/global_widgets/tobeto_app_bar.dart';
import 'package:tobetomobileapp/widgets/global_widgets/dropdown_creator.dart';
import 'package:tobetomobileapp/widgets/homepage/tabbar/applicationstab.dart';

class CatalogScreen extends StatefulWidget {
  const CatalogScreen({super.key});

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
                child: const Icon(Icons.refresh),
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
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              decoration: const BoxDecoration(
                                  image: DecorationImage(
                                      image: AssetImage(
                                "assets/images/catalog-screen-top.png",
                              ))),
                              height: MediaQuery.of(context).size.height / 3,
                              width: MediaQuery.of(context).size.width,
                              child: Center(
                                  child: Container(
                                decoration: BoxDecoration(
                                    color: backgroundColor.withOpacity(.5)),
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
                            style: ElevatedButton.styleFrom(
                                backgroundColor: tobetoColor.iconColor),
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
                                                style: ElevatedButton.styleFrom(
                                                    backgroundColor:
                                                        tobetoColor.iconColor),
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
                                                child: Text(
                                                  "Filtrele",
                                                  style: TextStyle(
                                                      color: tobetoColor
                                                          .cardColor),
                                                ),
                                              ))
                                        ],
                                      )),
                                    ),
                                  );
                                },
                              );
                            },
                            child: Text(
                              "Filtrele",
                              style: TextStyle(color: tobetoColor.cardColor),
                            ),
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
}
