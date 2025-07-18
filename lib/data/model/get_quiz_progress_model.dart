import 'dart:convert';

import 'subject_list_model.dart';

class GetQuizProgressModel {
  final List<QuizProgressData>? quizProgressData;
  final Meta? meta;

  GetQuizProgressModel({
    this.quizProgressData,
    this.meta,
  });

  GetQuizProgressModel copyWith({
    List<QuizProgressData>? data,
    Meta? meta,
  }) =>
      GetQuizProgressModel(
        quizProgressData: data ?? quizProgressData,
        meta: meta ?? this.meta,
      );

  factory GetQuizProgressModel.fromJson(String str) =>
      GetQuizProgressModel.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory GetQuizProgressModel.fromMap(Map<String, dynamic> json) => GetQuizProgressModel(
        quizProgressData: json["data"] != null
            ? List<QuizProgressData>.from(json["data"].map((x) => QuizProgressData.fromMap(x)))
            : null,
        meta: json["meta"] != null ? Meta.fromMap(json["meta"]) : null,
      );

  Map<String, dynamic> toMap() => {
        "data": quizProgressData != null
            ? List<dynamic>.from(quizProgressData!.map((x) => x.toMap()))
            : null,
        "meta": meta?.toMap(),
      };
}

class QuizProgressData {
  final int? id;
  final String? documentId;
  final List<Map<String, bool>>? quizProgress;
  final Video? video;

  QuizProgressData({
    this.id,
    this.documentId,
    this.quizProgress,
    this.video,
  });

  QuizProgressData copyWith({
    int? id,
    String? documentId,
    List<Map<String, bool>>? quizProgress,
    Video? video,
  }) =>
      QuizProgressData(
        id: id ?? this.id,
        documentId: documentId ?? this.documentId,
        quizProgress: quizProgress ?? this.quizProgress,
        video: video ?? this.video,
      );

  factory QuizProgressData.fromJson(String str) => QuizProgressData.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory QuizProgressData.fromMap(Map<String, dynamic> json) => QuizProgressData(
        id: json["id"],
        documentId: json["documentId"],
        quizProgress: json["quizProgress"] != null
            ? List<Map<String, bool>>.from(json["quizProgress"]
                .map((x) => Map.from(x).map((k, v) => MapEntry<String, bool>(k, v))))
            : null,
        video: json["video"] != null ? Video.fromMap(json["video"]) : null,
      );

  Map<String, dynamic> toMap() => {
        "id": id,
        "documentId": documentId,
        "quizProgress": quizProgress != null
            ? List<dynamic>.from(quizProgress!
                .map((x) => Map.from(x).map((k, v) => MapEntry<String, dynamic>(k, v))))
            : null,
        "video": video?.toMap(),
      };
}

class Video {
  final int? id;
  final String? documentId;
  final String? name;
  final String? videoUrl;
  final dynamic description;

  Video({
    this.id,
    this.documentId,
    this.name,
    this.videoUrl,
    this.description,
  });

  Video copyWith({
    int? id,
    String? documentId,
    String? name,
    String? videoUrl,
    dynamic description,
  }) =>
      Video(
        id: id ?? this.id,
        documentId: documentId ?? this.documentId,
        name: name ?? this.name,
        videoUrl: videoUrl ?? this.videoUrl,
        description: description ?? this.description,
      );

  factory Video.fromJson(String str) => Video.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Video.fromMap(Map<String, dynamic> json) => Video(
        id: json["id"],
        documentId: json["documentId"],
        name: json["name"],
        videoUrl: json["video_url"],
        description: json["description"],
      );

  Map<String, dynamic> toMap() => {
        "id": id,
        "documentId": documentId,
        "name": name,
        "video_url": videoUrl,
        "description": description,
      };
}
