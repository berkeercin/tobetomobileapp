import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tobetomobileapp/blocs/home/home_bloc.dart';
import 'package:tobetomobileapp/blocs/home/home_event.dart';
import 'package:tobetomobileapp/blocs/home/home_state.dart';
import 'package:tobetomobileapp/constants/global/tobeto_icons.dart';
import 'package:tobetomobileapp/functions/homepage/boxes_alert.dart';
import 'package:tobetomobileapp/models/home_page/page_content.dart';
import 'package:tobetomobileapp/models/user.dart';
import 'package:tobetomobileapp/screens/edit_profile_screen.dart';
import 'package:tobetomobileapp/screens/reviews_screen.dart';
import 'package:tobetomobileapp/constants/global/text_const.dart';
import 'package:tobetomobileapp/widgets/global_widgets/tobeto_app_bar.dart';
import 'package:tobetomobileapp/widgets/homepage/home_exam.dart';
import 'package:tobetomobileapp/widgets/homepage/home_toptext.dart';
import 'package:tobetomobileapp/widgets/homepage/homebutton_create.dart';
import 'package:tobetomobileapp/widgets/homepage/tobeto_footer.dart';
import 'package:tobetomobileapp/widgets/homepage/tabbar/applicationstab.dart';
import 'package:tobetomobileapp/widgets/homepage/gradient_boxes.dart';
import 'package:tobetomobileapp/widgets/global_widgets/swing_method.dart';
import 'package:tobetomobileapp/widgets/global_widgets/tobeto_drawer.dart';
import 'package:tobetomobileapp/widgets/homepage/toptext_widget.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key, required this.user});
  final UserData user;
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int selectedButton = 1;
  Widget menu = Container();
  late String assetImage;
  late Brightness brightness;
  bool isRefreshed = false;
  Color textColor = Colors.white;
  Color backgroundColor = Colors.black;
  late Color containerColor = Colors.black;
  late String istanbulKodluyorImage;
  PageContent pageContent = PageContent(
      applicationList: [], newsList: [], surveyList: [], educationList: []);
  final iconsax = TobetoIcons();
  final constText = TobetoText();
  @override
  void initState() {
    super.initState();
  }

  @override
  void didChangeDependencies() {
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

    menu = ApplicationsTab(applicationsList: pageContent.applicationList);
  }

  void updateMenu(Widget newMenu, int id) {
    setState(() {
      selectedButton = id;
      menu = newMenu;
    });
  }

  void refreshPage() {
    context.read<HomeBloc>().add(RefreshPage());
    isRefreshed = true;
  }

  @override
  Widget build(BuildContext context) {
    void pagePathFunc(Widget widget) {
      Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => widget,
          ));
    }

    return BlocListener<HomeBloc, HomeState>(
      listener: (context, state) {
        if (state is LoadedPage) {
          setState(() {
            pageContent = PageContent(
                applicationList: state.pageContent.applicationList,
                newsList: state.pageContent.newsList,
                surveyList: state.pageContent.surveyList,
                educationList: state.pageContent.educationList);
            menu =
                ApplicationsTab(applicationsList: pageContent.applicationList);
          });
        }
      },
      child: Scaffold(
        backgroundColor: backgroundColor.withOpacity(0.95),
        appBar: const TobetoAppBarV2(title: "HomePage"),
        drawer: const TobetoDrawer(),
        floatingActionButton: const SwingMethod(),
        floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
        body: RefreshIndicator(
          onRefresh: () async {
            refreshPage();
          },
          child: BlocBuilder<HomeBloc, HomeState>(
            builder: (context, state) {
              if (state is InitializePage) {
                context.read<HomeBloc>().add(LoadPage());
                return const Center(
                  child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        CircularProgressIndicator(),
                        Text("Sayfa yükleniyor")
                      ]),
                );
              }
              if (state is LoadedPage) {
                if (!isRefreshed) {
                  refreshPage();
                }
                return SingleChildScrollView(
                  scrollDirection: Axis.vertical,
                  child: Column(
                    children: [
                      const SizedBox(
                        height: 20,
                      ),
                      TopTextWidget(
                        textColor: textColor,
                        user: widget.user,
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      Container(
                        width: double.infinity,
                        decoration: BoxDecoration(
                          color: containerColor,
                        ),
                        child: Column(
                          children: [
                            Image(
                              height: 200,
                              width: 200,
                              image: AssetImage(istanbulKodluyorImage),
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.only(left: 32, right: 32),
                              child: Column(
                                children: [
                                  const HomeToptext(),
                                  Row(
                                    children: [
                                      HomeButtonCreator(
                                        pagecontent: pageContent,
                                        name: "Başvurularım",
                                        buttonId: 1,
                                        textColor: textColor,
                                        selectedButton: selectedButton,
                                        onPressed: (newWidget, number) {
                                          updateMenu(newWidget, number);
                                        },
                                      ),
                                      HomeButtonCreator(
                                        pagecontent: pageContent,
                                        name: "Eğitimlerim",
                                        buttonId: 2,
                                        textColor: textColor,
                                        selectedButton: selectedButton,
                                        onPressed: (newWidget, number) {
                                          updateMenu(newWidget, number);
                                        },
                                      )
                                    ],
                                  ),
                                  Row(
                                    children: [
                                      HomeButtonCreator(
                                        pagecontent: pageContent,
                                        name: "Duyuru ve Haberlerim",
                                        buttonId: 3,
                                        textColor: textColor,
                                        selectedButton: selectedButton,
                                        onPressed: (newWidget, number) {
                                          updateMenu(newWidget, number);
                                        },
                                      ),
                                      HomeButtonCreator(
                                        pagecontent: pageContent,
                                        name: "Anketlerim",
                                        buttonId: 4,
                                        textColor: textColor,
                                        selectedButton: selectedButton,
                                        onPressed: (newWidget, number) {
                                          updateMenu(newWidget, number);
                                        },
                                      )
                                    ],
                                  ),
                                  menu,
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      Container(
                        color: containerColor,
                        width: 150,
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      Container(
                        color: containerColor,
                        width: double.infinity,
                        child: const HomeExam(),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          child: Row(
                            verticalDirection: VerticalDirection.up,
                            children: [
                              GradientBoxes(
                                boxName: constText.boxText1,
                                boxButton: boxButtonF("start1", () {
                                  pagePathFunc(const EditProfileScreen());
                                }),
                              ),
                              //2
                              const SizedBox(
                                width: 10,
                              ),
                              GradientBoxes(
                                boxName: constText.boxText2,
                                boxButton: boxButtonF("start2", () {
                                  pagePathFunc(const ReviewsScreen());
                                }),
                              ),
                              //3
                              const SizedBox(
                                width: 10,
                              ),

                              GradientBoxes(
                                boxName: constText.boxText3,
                                boxButton: boxButtonF("start3", () {
                                  const BoxesAlert(
                                    errorMes: "404 Sayfa Bulunamadı",
                                  ).errormessage(context);
                                }),
                              ),
                              const SizedBox(
                                width: 10,
                              ),
                            ],
                          ),
                        ),
                      ),
                      TobetoFooter(
                        assetImage: assetImage,
                        backgroundColor: backgroundColor,
                        textColor: textColor,
                      )
                    ],
                  ),
                );
              } else {
                return const Center(
                  child: Text("Beklenmedik hata"),
                );
              }
            },
          ),
        ),
      ),
    );
  }
}
