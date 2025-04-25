import 'dart:convert';

class QuizModel {
  final List<QuizDataList> quizDataList;
  final Meta meta;

  QuizModel({
    required this.quizDataList,
    required this.meta,
  });

  QuizModel copyWith({
    List<QuizDataList>? data,
    Meta? meta,
  }) =>
      QuizModel(
        quizDataList: data ?? quizDataList,
        meta: meta ?? this.meta,
      );

  factory QuizModel.fromJson(String str) => QuizModel.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory QuizModel.fromMap(Map<String, dynamic> json) => QuizModel(
        quizDataList: List<QuizDataList>.from(json["data"].map((x) => QuizDataList.fromMap(x))),
        meta: Meta.fromMap(json["meta"]),
      );

  Map<String, dynamic> toMap() => {
        "data": List<dynamic>.from(quizDataList.map((x) => x.toMap())),
        "meta": meta.toMap(),
      };
}

class QuizDataList {
  final int id;
  final String documentId;
  final String question;
  final String explanation;
  final int correctAnswerIndex;
  final List<QuizOption> quizOptions;
  final Video video;

  QuizDataList({
    required this.id,
    required this.documentId,
    required this.question,
    required this.explanation,
    required this.correctAnswerIndex,
    required this.quizOptions,
    required this.video,
  });

  QuizDataList copyWith({
    int? id,
    String? documentId,
    String? question,
    String? explanation,
    int? correctAnswerIndex,
    List<QuizOption>? options,
    Video? video,
  }) =>
      QuizDataList(
        id: id ?? this.id,
        documentId: documentId ?? this.documentId,
        question: question ?? this.question,
        explanation: explanation ?? this.explanation,
        correctAnswerIndex: correctAnswerIndex ?? this.correctAnswerIndex,
        quizOptions: options ?? quizOptions,
        video: video ?? this.video,
      );

  factory QuizDataList.fromJson(String str) => QuizDataList.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory QuizDataList.fromMap(Map<String, dynamic> json) => QuizDataList(
        id: json["id"],
        documentId: json["documentId"],
        question: json["question"],
        explanation: json["explanation"],
        correctAnswerIndex: json["correct_answer_index"],
        quizOptions: List<QuizOption>.from(json["options"].map((x) => QuizOption.fromMap(x))),
        video: Video.fromMap(json["video"]),
      );

  Map<String, dynamic> toMap() => {
        "id": id,
        "documentId": documentId,
        "question": question,
        "explanation": explanation,
        "correct_answer_index": correctAnswerIndex,
        "options": List<dynamic>.from(quizOptions.map((x) => x.toMap())),
        "video": video.toMap(),
      };
}

class QuizOption {
  final int id;
  final String name;

  QuizOption({
    required this.id,
    required this.name,
  });

  QuizOption copyWith({
    int? id,
    String? name,
  }) =>
      QuizOption(
        id: id ?? this.id,
        name: name ?? this.name,
      );

  factory QuizOption.fromJson(String str) => QuizOption.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory QuizOption.fromMap(Map<String, dynamic> json) => QuizOption(
        id: json["id"],
        name: json["name"],
      );

  Map<String, dynamic> toMap() => {
        "id": id,
        "name": name,
      };
}

class Video {
  final int id;
  final String documentId;

  Video({
    required this.id,
    required this.documentId,
  });

  Video copyWith({
    int? id,
    String? documentId,
  }) =>
      Video(
        id: id ?? this.id,
        documentId: documentId ?? this.documentId,
      );

  factory Video.fromJson(String str) => Video.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Video.fromMap(Map<String, dynamic> json) => Video(
        id: json["id"],
        documentId: json["documentId"],
      );

  Map<String, dynamic> toMap() => {
        "id": id,
        "documentId": documentId,
      };
}

class Meta {
  final Pagination pagination;

  Meta({
    required this.pagination,
  });

  Meta copyWith({
    Pagination? pagination,
  }) =>
      Meta(
        pagination: pagination ?? this.pagination,
      );

  factory Meta.fromJson(String str) => Meta.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Meta.fromMap(Map<String, dynamic> json) => Meta(
        pagination: Pagination.fromMap(json["pagination"]),
      );

  Map<String, dynamic> toMap() => {
        "pagination": pagination.toMap(),
      };
}

class Pagination {
  final int page;
  final int pageSize;
  final int pageCount;
  final int total;

  Pagination({
    required this.page,
    required this.pageSize,
    required this.pageCount,
    required this.total,
  });

  Pagination copyWith({
    int? page,
    int? pageSize,
    int? pageCount,
    int? total,
  }) =>
      Pagination(
        page: page ?? this.page,
        pageSize: pageSize ?? this.pageSize,
        pageCount: pageCount ?? this.pageCount,
        total: total ?? this.total,
      );

  factory Pagination.fromJson(String str) => Pagination.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Pagination.fromMap(Map<String, dynamic> json) => Pagination(
        page: json["page"],
        pageSize: json["pageSize"],
        pageCount: json["pageCount"],
        total: json["total"],
      );

  Map<String, dynamic> toMap() => {
        "page": page,
        "pageSize": pageSize,
        "pageCount": pageCount,
        "total": total,
      };
}
