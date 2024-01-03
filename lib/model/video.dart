import 'dart:convert';

class Video {
  const Video({
    required this.videoName,
    required this.videoId,
    required this.videoThumbnail,
    required this.videoDate,
  });
  final String videoName;
  final String videoId;
  final String videoThumbnail;
  final DateTime videoDate;

  Video copyWith({
    String? videoName,
    String? videoId,
    String? videoThumbnail,
    DateTime? videoDate,
  }) {
    return Video(
      videoName: videoName ?? this.videoName,
      videoId: videoId ?? this.videoId,
      videoThumbnail: videoThumbnail ?? this.videoThumbnail,
      videoDate: videoDate ?? this.videoDate,
    );
  }

  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};

    result.addAll({'videoName': videoName});
    result.addAll({'videoId': videoId});
    result.addAll({'videoThumbnail': videoThumbnail});
    result.addAll({'videoDate': videoDate.millisecondsSinceEpoch});

    return result;
  }

  factory Video.fromMap(Map<String, dynamic> map) {
    return Video(
      videoName: map['videoName'] ?? '',
      videoId: map['videoId'] ?? '',
      videoThumbnail: map['videoThumbnail'] ?? '',
      videoDate: DateTime.fromMillisecondsSinceEpoch(map['videoDate']),
    );
  }

  String toJson() => json.encode(toMap());

  factory Video.fromJson(String source) => Video.fromMap(json.decode(source));

  @override
  String toString() {
    return 'Video(videoName: $videoName, videoId: $videoId, videoThumbnail: $videoThumbnail, videoDate: $videoDate)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is Video &&
        other.videoName == videoName &&
        other.videoId == videoId &&
        other.videoThumbnail == videoThumbnail &&
        other.videoDate == videoDate;
  }

  @override
  int get hashCode {
    return videoName.hashCode ^
        videoId.hashCode ^
        videoThumbnail.hashCode ^
        videoDate.hashCode;
  }
}
