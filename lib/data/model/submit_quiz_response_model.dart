import 'dart:convert';

class SubmitQuizResponseModel {
  final Data? data;
  final Meta? meta;

  SubmitQuizResponseModel({
    this.data,
    this.meta,
  });

  SubmitQuizResponseModel copyWith({
    Data? data,
    Meta? meta,
  }) =>
      SubmitQuizResponseModel(
        data: data ?? this.data,
        meta: meta ?? this.meta,
      );

  factory SubmitQuizResponseModel.fromJson(String str) =>
      SubmitQuizResponseModel.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory SubmitQuizResponseModel.fromMap(Map<String, dynamic> json) => SubmitQuizResponseModel(
        data: json["data"] != null ? Data.fromMap(json["data"]) : null,
        meta: json["meta"] != null ? Meta.fromMap(json["meta"]) : null,
      );

  Map<String, dynamic> toMap() => {
        "data": data?.toMap(),
        "meta": meta?.toMap(),
      };
}

class Data {
  final int? id;
  final String? documentId;
  final List<Map<String, bool>>? quizProgress;

  Data({
    this.id,
    this.documentId,
    this.quizProgress,
  });

  Data copyWith({
    int? id,
    String? documentId,
    List<Map<String, bool>>? quizProgress,
  }) =>
      Data(
        id: id ?? this.id,
        documentId: documentId ?? this.documentId,
        quizProgress: quizProgress ?? this.quizProgress,
      );

  factory Data.fromJson(String str) => Data.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Data.fromMap(Map<String, dynamic> json) => Data(
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
