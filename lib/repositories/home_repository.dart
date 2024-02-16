import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:tobetomobileapp/dummydata/video_list.dart';
import 'package:tobetomobileapp/models/home_page/application.dart';
import 'package:tobetomobileapp/models/home_page/educationlist_content.dart';
import 'package:tobetomobileapp/models/home_page/education_content.dart';
import 'package:tobetomobileapp/models/home_page/news.dart';
import 'package:tobetomobileapp/models/home_page/survey.dart';
import 'package:tobetomobileapp/models/home_page/education.dart';

class HomeRepository {
  final FirebaseFirestore _firebaseFireStore;
  final FirebaseAuth _firebaseAuth;
  HomeRepository(
      {FirebaseFirestore? firebaseFirestore, FirebaseAuth? firebaseAuth})
      : _firebaseFireStore = firebaseFirestore ?? FirebaseFirestore.instance,
        _firebaseAuth = firebaseAuth ?? FirebaseAuth.instance;
  var user = FirebaseAuth.instance.currentUser?.uid;

  Future<List<News>> loadNews() async {
    List<News> newsList = [];
    final snapshot = await _firebaseFireStore.collection("newsList").get();
    for (var doc in snapshot.docs) {
      if (doc.data().containsKey("userID")) {
        List userIdList = doc.get("userID");
        // print(doc.data());
        for (var element in userIdList) {
          if (element == user) {
            var docData = doc.data();
            Timestamp timestamp = docData['notifTime'];
            DateTime notifTime = timestamp.toDate().toLocal();
            String notifContent = docData['notifContent'];
            notifContent = notifContent.replaceAll("\\/", "\n");
            newsList.add(News(
                isNews: docData['isNews'],
                projectName: docData['projectName'],
                notifTitle: docData['notifTitle'],
                notifContent: notifContent,
                notifTime: notifTime,
                notifId: docData['notifId']));
          }
        }
      }
    }
    return newsList;
  }

  Future<List<Survey>> loadSurveys() async {
    return [];
  }

  Future<List<Education>> loadEducations() async {
    List<Education> eduList = [];
    final snapshot = await _firebaseFireStore.collection("educationList").get();
    for (var doc in snapshot.docs) {
      if ((doc.data().containsKey("activeUsers") &&
          doc.data().containsKey("inactiveUsers"))) {
        var docData = doc.data();
        List activeUserList = doc.get("activeUsers");
        List inactiveUserList = doc.get("inactiveUsers");
        List finishedUseList = doc.get("finishedUsers");
        if (activeUserList.contains(user) ||
            inactiveUserList.contains(user) ||
            finishedUseList.contains(user)) {
          bool isActive = false;
          bool isFinished = false;
          if (activeUserList.contains(user)) {
            isActive = true;
          }
          if (finishedUseList.contains(user)) {
            isFinished = true;
          }
          Timestamp startDateTimestamp = docData['startDate'];
          DateTime startDateDateTime = startDateTimestamp.toDate().toLocal();
          Timestamp endDateTimestamp = docData['endDate'];
          DateTime endDateDateTime = endDateTimestamp.toDate().toLocal();
          DateTime now = DateTime.now();
          List educationContent = docData['content'];
          if (now.isAfter(endDateDateTime)) {
            isActive = false;
          }
          List<EducationContentList> eduContentList = [];
          for (var content in educationContent) {
            String contentTitle = content['contentTitle'];
            bool isModule = content['isModule'];
            List subContent = content['subContent'];
            List<EducationContent> eduSubContent_ = [];
            for (var element in subContent) {
              bool isFinished = false;
              List finishedUseList = element["finishedUsers"];
              if (finishedUseList.contains(user)) {
                isFinished = true;
              }
              eduSubContent_.add(EducationContent(
                  title: element['title'],
                  videoDuration: element['videoDuration'],
                  videoURL: element['videoURL'],
                  isFinished: isFinished));
            }
            eduContentList.add(EducationContentList(
                contentTitle: contentTitle,
                isModule: isModule,
                subContent: eduSubContent_));
          }
          eduList.add(Education(
              eduTitle: docData['eduTitle'],
              eduId: docData['eduId'],
              eduThumbnailUrl: docData['eduThumbnailUrl'],
              startDate: startDateDateTime,
              endDate: endDateDateTime,
              isFinished: isFinished,
              content: eduContentList,
              isActive: isActive));
        }
      }
    }
    return eduList;
  }

  Future<List<Application>> loadApplcations() async {
    try {
      // print("loadApplications running");
      List<Application> applicationList_ = [];
      final snapshot =
          await _firebaseFireStore.collection("applicationList").get();
      for (var doc in snapshot.docs) {
        if (doc.data().containsKey("userID") && doc.get("userID") == user) {
          var array = doc.get("applicationListArray");
          List array_ = array;
          for (var element in array_) {
            List<Map<dynamic, dynamic>> subApplicationList = [];
            List rawSubApplicationList_ = element['subApplicationList'];
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
