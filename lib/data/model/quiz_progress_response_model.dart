import 'dart:convert';

class QuizProgressResponseModel {
  final QuizProgressResponseData? quizProgressResponseData;
  final Meta? meta;

  QuizProgressResponseModel({
    this.quizProgressResponseData,
    this.meta,
  });

  QuizProgressResponseModel copyWith({
    QuizProgressResponseData? data,
    Meta? meta,
  }) =>
      QuizProgressResponseModel(
        quizProgressResponseData: data ?? quizProgressResponseData,
        meta: meta ?? this.meta,
      );

  factory QuizProgressResponseModel.fromJson(String str) =>
      QuizProgressResponseModel.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory QuizProgressResponseModel.fromMap(Map<String, dynamic> json) => QuizProgressResponseModel(
        quizProgressResponseData:
            json["data"] != null ? QuizProgressResponseData.fromMap(json["data"]) : null,
        meta: json["meta"] != null ? Meta.fromMap(json["meta"]) : null,
      );

  Map<String, dynamic> toMap() => {
        "data": quizProgressResponseData?.toMap(),
        "meta": meta?.toMap(),
      };
}

class QuizProgressResponseData {
  final int? id;
  final String? documentId;
  final List<Map<String, bool>>? quizProgress;

  QuizProgressResponseData({
    this.id,
    this.documentId,
    this.quizProgress,
  });

  QuizProgressResponseData copyWith({
    int? id,
    String? documentId,
    List<Map<String, bool>>? quizProgress,
  }) =>
      QuizProgressResponseData(
        id: id ?? this.id,
        documentId: documentId ?? this.documentId,
        quizProgress: quizProgress ?? this.quizProgress,
      );

  factory QuizProgressResponseData.fromJson(String str) =>
      QuizProgressResponseData.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory QuizProgressResponseData.fromMap(Map<String, dynamic> json) => QuizProgressResponseData(
        id: json["id"],
        documentId: json["documentId"],
        quizProgress: json["quizProgress"] != null
            ? List<Map<String, bool>>.from(json["quizProgress"]
                .map((x) => Map.from(x).map((k, v) => MapEntry<String, bool>(k, v))))
            : null,
      );

  Map<String, dynamic> toMap() => {
        "id": id,
        "documentId": documentId,
        "quizProgress": quizProgress != null
            ? List<dynamic>.from(quizProgress!
                .map((x) => Map.from(x).map((k, v) => MapEntry<String, dynamic>(k, v))))
            : null,
      };
}

class Meta {
  Meta();

  Meta copyWith() => Meta();

  factory Meta.fromJson(String str) => Meta.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Meta.fromMap(Map<String, dynamic> json) => Meta();

  Map<String, dynamic> toMap() => {};
}
