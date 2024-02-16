import 'package:tobetomobileapp/models/home_page/education.dart';
import 'package:tobetomobileapp/models/home_page/educationlist_content.dart';
import 'package:tobetomobileapp/models/home_page/education_content.dart';

List<Education> dummyEduList = [
  Education(
    isActive: true,
    eduTitle: "Dr. Ecmel Ayral'dan Hoşgeldin Mesajı",
    eduId: "1",
    eduThumbnailUrl:
        "https://tobeto.s3.cloud.ngn.com.tr/23_EAH_1_45f7232003.jpg",
    startDate: DateTime(2023, 9, 21, 15, 20),
    endDate: DateTime(2024, 9, 21, 15, 20),
    isFinished: true,
    content: [
      EducationContentList(contentTitle: "", isModule: false, subContent: [
        EducationContent(
            title: "Dr. Ecmel Ayral'dan Hoşgeldin Mesajı",
            videoDuration: "2 dakika",
            videoURL: "videoURL",
            isFinished: true)
      ])
    ],
  ),
  Education(
    isActive: false,
    eduTitle: "Eğitimlere Nasıl Katılırım",
    eduId: "2",
    eduThumbnailUrl:
        "https://tobeto.s3.cloud.ngn.com.tr/23_EAH_1_45f7232003.jpg",
    startDate: DateTime(2023, 9, 8, 17, 6),
    endDate: DateTime(2024, 9, 8, 17, 6),
    isFinished: false,
    content: [
      EducationContentList(
          contentTitle: "Eğitimlere Nasıl Katılırım",
          isModule: true,
          subContent: [
            EducationContent(
                title: "Eğitimlere Nasıl Katılırım",
                videoDuration: "2 dakika",
                videoURL: "videoURL",
                isFinished: false),
            EducationContent(
                title: "Eğitimlere Nasıl Katılırım",
                videoDuration: "2 dakika",
                videoURL: "videoURL",
                isFinished: false),
          ])
    ],
  )
];
