import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
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

  Future<List<News>> loadNews() async {
    var user = FirebaseAuth.instance.currentUser?.uid;

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

  Future<Education> loadEducation(String documentId) async {
    var user = FirebaseAuth.instance.currentUser?.uid;

    final snapshot = await _firebaseFireStore.collection("educationList").get();
    Education education_ = Education(
      eduTitle: "",
      eduId: "",
      documentId: "",
      eduThumbnailUrl: "",
      startDate: DateTime.now(),
      endDate: DateTime.now(),
      content: [],
      isActive: true,
      isFinished: false,
    );

    if (snapshot.docs.isEmpty) {
      return education_;
    }

    for (var doc in snapshot.docs) {
      String docId = doc.id;
      if (docId == documentId) {
        if (doc.data().containsKey("activeUsers") &&
            doc.data().containsKey("inactiveUsers")) {
          var docData = doc.data();
          List activeUserList = doc.get("activeUsers");
          List inactiveUserList = doc.get("inactiveUsers");
          List finishedUserList = doc.get("finishedUsers");
          if (activeUserList.contains(user) ||
              inactiveUserList.contains(user) ||
              finishedUserList.contains(user)) {
            bool isActive = activeUserList.contains(user);
            bool isFinished = finishedUserList.contains(user);
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
              String contentId = content['contentId'];
              bool isModule = content['isModule'];
              List subContent = content['subContent'];
              bool isContentFinished = false;
              List finishedUseList = content["finishedUsers"];
              if (finishedUseList.contains(user)) {
                isContentFinished = true;
              }
              List<EducationContent> eduSubContent_ = [];
              for (var element in subContent) {
                bool isFinished = false;
                List finishedUseList = element["finishedUsers"];
                if (finishedUseList.contains(user)) {
                  isFinished = true;
                }
                eduSubContent_.add(EducationContent(
                  videoId: element['videoId'],
                  title: element['title'],
                  videoDuration: element['videoDuration'],
                  videoURL: element['videoURL'],
                  isFinished: isFinished,
                ));
              }
              eduContentList.add(EducationContentList(
                isFinished: isContentFinished,
                contentId: contentId,
                contentTitle: contentTitle,
                isModule: isModule,
                subContent: eduSubContent_,
              ));
            }
            return Education(
              documentId: docId,
              eduTitle: docData['eduTitle'],
              eduId: docData['eduId'],
              eduThumbnailUrl: docData['eduThumbnailUrl'],
              startDate: startDateDateTime,
              endDate: endDateDateTime,
              isFinished: isFinished,
              content: eduContentList,
              isActive: isActive,
            );
          }
        }
      }
    }
    // Return default education if no matching document is found
    return education_;
  }

  // Future<EduContent

  void addUsertoFinishedVideo(
      String documentId, String contentId, String videoId) async {
    final docRef =
        _firebaseFireStore.collection('educationList').doc(documentId);

    // Get the current value of 'content' field
    final docSnapshot = await docRef.get();
    final currentContent = docSnapshot.data()?['content'] ?? [];

    // Find the content that needs to be updated
    final updatedContent = currentContent.map((content) {
      if (content['contentId'] == contentId) {
        final updatedSubContent = content['subContent'].map((subContent) {
          if (subContent['videoId'] == videoId) {
            // Check if the user already exists in finishedUsers
            final finishedUsers =
                List<String>.from(subContent['finishedUsers']);
            if (!finishedUsers.contains(_firebaseAuth.currentUser?.uid)) {
              finishedUsers.add(_firebaseAuth.currentUser!.uid);
            }
            return {...subContent, 'finishedUsers': finishedUsers};
          }
          return subContent;
        }).toList();
        return {...content, 'subContent': updatedSubContent};
      }
      return content;
    }).toList();

    // Update the document with the modified content
    await docRef.update({'content': updatedContent});
  }

  void addUsertoFinishedContent(String documentId, String contentId) async {
    final docRef =
        _firebaseFireStore.collection('educationList').doc(documentId);

// Get the current value of 'content' field
    final docSnapshot = await docRef.get();
    final currentContent = docSnapshot.data()?['content'] ?? [];

// Find the content that needs to be updated
    final updatedContent = currentContent.map((content) {
      if (content['contentId'] == contentId) {
        // Check if the user already exists in finishedUsers
        final finishedUsers = List<String>.from(content['finishedUsers']);
        if (!finishedUsers.contains(_firebaseAuth.currentUser?.uid)) {
          finishedUsers.add(_firebaseAuth.currentUser!.uid);
        }
        return {...content, 'finishedUsers': finishedUsers};
      }
      return content;
    }).toList();

// Update the document with the modified content
    await docRef.update({'content': updatedContent});
  }

  void addUsertoFinishedEducation(String documentId) async {
    final docRef =
        _firebaseFireStore.collection('educationList').doc(documentId);

// Get the current value of 'content' field
    final docSnapshot = await docRef.get();
    final finishedUsers = List<String>.from(docSnapshot['finishedUsers']);
    if (!finishedUsers.contains(_firebaseAuth.currentUser?.uid)) {
      finishedUsers.add(_firebaseAuth.currentUser!.uid);
    }

// Update the document with the modified content
    await docRef.update({'finishedUsers': finishedUsers});
  }

  Future<List<Education>> loadEducations() async {
    var user = FirebaseAuth.instance.currentUser?.uid;

    List<Education> eduList = [];
    final snapshot = await _firebaseFireStore.collection("educationList").get();
    for (var doc in snapshot.docs) {
      String docId = doc.id;
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
            bool isContentFinished = false;

            String contentTitle = content['contentTitle'];
            String contentId = content['contentId'];
            List finishedUseList = content["finishedUsers"];
            if (finishedUseList.contains(user)) {
              isContentFinished = true;
            }
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
                  videoId: element['videoId'],
                  title: element['title'],
                  videoDuration: element['videoDuration'],
                  videoURL: element['videoURL'],
                  isFinished: isFinished));
            }
            eduContentList.add(EducationContentList(
                isFinished: isContentFinished,
                contentId: contentId,
                contentTitle: contentTitle,
                isModule: isModule,
                subContent: eduSubContent_));
          }
          eduList.add(Education(
              documentId: docId,
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
      var user = FirebaseAuth.instance.currentUser?.uid;

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
      return [];
    }
  }
}
