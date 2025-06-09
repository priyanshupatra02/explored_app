import 'dart:convert';

import 'package:edtech_app/data/model/videos_list_model.dart';

class SingleVideoModel {
  final SingleVideoData singleVideoData;
  final Meta meta;

  SingleVideoModel({
    required this.singleVideoData,
    required this.meta,
  });

  SingleVideoModel copyWith({
    SingleVideoData? data,
    Meta? meta,
  }) =>
      SingleVideoModel(
        singleVideoData: data ?? singleVideoData,
        meta: meta ?? this.meta,
      );

  factory SingleVideoModel.fromJson(String str) => SingleVideoModel.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory SingleVideoModel.fromMap(Map<String, dynamic> json) => SingleVideoModel(
        singleVideoData: SingleVideoData.fromMap(json["data"]),
        meta: Meta.fromMap(json["meta"]),
      );

  Map<String, dynamic> toMap() => {
        "data": singleVideoData.toMap(),
        "meta": meta.toMap(),
      };
}

class SingleVideoData {
  final int id;
  final String documentId;
  final String name;
  final String videoUrl;
  final Subject subject;
  final List<dynamic> quizProgresses;

  SingleVideoData({
    required this.id,
    required this.documentId,
    required this.name,
    required this.videoUrl,
    required this.subject,
    required this.quizProgresses,
  });

  SingleVideoData copyWith({
    int? id,
    String? documentId,
    String? name,
    String? videoUrl,
    Subject? subject,
    List<dynamic>? quizProgresses,
  }) =>
      SingleVideoData(
        id: id ?? this.id,
        documentId: documentId ?? this.documentId,
        name: name ?? this.name,
        videoUrl: videoUrl ?? this.videoUrl,
        subject: subject ?? this.subject,
        quizProgresses: quizProgresses ?? this.quizProgresses,
      );

  factory SingleVideoData.fromJson(String str) => SingleVideoData.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory SingleVideoData.fromMap(Map<String, dynamic> json) => SingleVideoData(
        id: json["id"],
        documentId: json["documentId"],
        name: json["name"],
        videoUrl: json["video_url"],
        subject: Subject.fromMap(json["subject"]),
        quizProgresses: List<dynamic>.from(json["quiz_progresses"].map((x) => x)),
      );

  Map<String, dynamic> toMap() => {
        "id": id,
        "documentId": documentId,
        "name": name,
        "video_url": videoUrl,
        "subject": subject.toMap(),
        "quiz_progresses": List<dynamic>.from(quizProgresses.map((x) => x)),
      };
}

class Subject {
  final String name;
  final String description;

  Subject({
    required this.name,
    required this.description,
  });

  Subject copyWith({
    String? name,
    String? description,
  }) =>
      Subject(
        name: name ?? this.name,
        description: description ?? this.description,
      );

  factory Subject.fromJson(String str) => Subject.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Subject.fromMap(Map<String, dynamic> json) => Subject(
        name: json["name"],
        description: json["Description"],
      );

  Map<String, dynamic> toMap() => {
        "name": name,
        "Description": description,
      };
}
