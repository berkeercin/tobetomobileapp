import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:tobetomobileapp/models/home_page/application.dart';
import 'package:tobetomobileapp/models/home_page/news.dart';
import 'package:tobetomobileapp/models/home_page/survey.dart';

class HomeRepository {
  final FirebaseFirestore _firebaseFireStore;
  final FirebaseAuth _firebaseAuth;
  HomeRepository(
      {FirebaseFirestore? firebaseFirestore, FirebaseAuth? firebaseAuth})
      : _firebaseFireStore = firebaseFirestore ?? FirebaseFirestore.instance,
        _firebaseAuth = firebaseAuth ?? FirebaseAuth.instance;
  List<News> loadNews() {
    return [
      // News(
      //     isNews: false,
      //     projectName: "projectName",
      //     notifTitle: "notifTitle",
      //     notifContent: "notifContent",
      //     notifTime: DateTime(2024),
      //     notifId: "notifId"),
      // News(
      //     isNews: false,
      //     projectName: "projectName",
      //     notifTitle: "notifTitle",
      //     notifContent: "notifContent",
      //     notifTime: DateTime(2024),
      //     notifId: "notifId")
    ];
  }

  List<Survey> loadSurveys() {
    return [];
  }

  Future<List<Application>> loadApplcations() async {
    try {
      print("loadApplications running");
      List<Application> applicationList_ = [];
      // print(FirebaseAuth.instance.currentUser?.uid);
      final snapshot =
          await _firebaseFireStore.collection("applicationList").get();
      for (var doc in snapshot.docs) {
        // print(doc.data());
        if (doc.data().containsKey("userID") &&
            doc.get("userID") == FirebaseAuth.instance.currentUser?.uid) {
          var array = doc.get("applicationListArray");
          List array_ = array;
          for (var element in array_) {
            List<Map<dynamic, dynamic>> subApplicationList = [];
            List rawSubApplicationList_ = element['subApplicationList'];
            // print(rawSubApplicationList_);
            for (var element in rawSubApplicationList_) {
              Map item = {};
              if (element['title'] == null) {}
              if (element['status'] == null) {
              } else {
                item['title'] = element['title'];
                item['status'] = element['status'];
                subApplicationList.add(item);
              }
            }
            if (element['applicationTitle'] == null ||
                element['applicationStatus'] == null) {
              print("null!");
            }
            var item = Application(
                applicationTitle: element['applicationTitle'],
                applicationStatus: element['applicationStatus'],
                subAppliactionList: subApplicationList);
            applicationList_.add(item);
            // print(element['applicationTitle']);
          }
        }
      }

      return applicationList_;
    } catch (e) {
      print(e);
      return [];
    }
  }
}