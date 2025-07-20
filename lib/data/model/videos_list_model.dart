import 'dart:convert';

class VideosModel {
  final List<VideosList>? videosList;
  final Meta? meta;

  VideosModel({
    this.videosList,
    this.meta,
  });

  VideosModel copyWith({
    List<VideosList>? data,
    Meta? meta,
  }) =>
      VideosModel(
        videosList: data ?? videosList,
        meta: meta ?? this.meta,
      );

  factory VideosModel.fromJson(String str) => VideosModel.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory VideosModel.fromMap(Map<String, dynamic> json) => VideosModel(
        videosList: json["data"] != null
            ? List<VideosList>.from(json["data"].map((x) => VideosList.fromMap(x)))
            : null,
        meta: json["meta"] != null ? Meta.fromMap(json["meta"]) : null,
      );

  Map<String, dynamic> toMap() => {
        "data": videosList != null ? List<dynamic>.from(videosList!.map((x) => x.toMap())) : null,
        "meta": meta?.toMap(),
      };
}

class VideosList {
  final int? id;
  final String? documentId;
  final String? name;
  final String? videoUrl;
  final String? description;
  final String? thumbnailUrl;
  final Subject? subject;
  final List<QuizProgress>? quizProgresses;

  VideosList({
    this.id,
    this.documentId,
    this.name,
    this.videoUrl,
    this.description,
    this.thumbnailUrl,
    this.subject,
    this.quizProgresses,
  });

  VideosList copyWith({
    int? id,
    String? documentId,
    String? name,
    String? videoUrl,
    String? description,
    String? thumbnailUrl,
    Subject? subject,
    List<QuizProgress>? quizProgresses,
  }) =>
      VideosList(
        id: id ?? this.id,
        documentId: documentId ?? this.documentId,
        name: name ?? this.name,
        videoUrl: videoUrl ?? this.videoUrl,
        description: description ?? this.description,
        thumbnailUrl: thumbnailUrl ?? this.thumbnailUrl,
        subject: subject ?? this.subject,
        quizProgresses: quizProgresses ?? this.quizProgresses,
      );

  factory VideosList.fromJson(String str) => VideosList.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory VideosList.fromMap(Map<String, dynamic> json) => VideosList(
        id: json["id"],
        documentId: json["documentId"],
        name: json["name"],
        videoUrl: json["video_url"],
        description: json["description"],
        thumbnailUrl: json["thumbnail_url"],
        subject: json["subject"] != null ? Subject.fromMap(json["subject"]) : null,
        quizProgresses: json["quiz_progresses"] != null
            ? List<QuizProgress>.from(json["quiz_progresses"].map((x) => QuizProgress.fromMap(x)))
            : null,
      );

  Map<String, dynamic> toMap() => {
        "id": id,
        "documentId": documentId,
        "name": name,
        "video_url": videoUrl,
        "description": description,
        "thumbnail_url": thumbnailUrl,
        "subject": subject?.toMap(),
        "quiz_progresses": quizProgresses != null
            ? List<dynamic>.from(quizProgresses!.map((x) => x.toMap()))
            : null,
      };
}

class QuizProgress {
  final int? id;
  final String? documentId;
  final List<Map<String, bool>>? quizProgress;

  QuizProgress({
    this.id,
    this.documentId,
    this.quizProgress,
  });

  QuizProgress copyWith({
    int? id,
    String? documentId,
    List<Map<String, bool>>? quizProgress,
  }) =>
      QuizProgress(
        id: id ?? this.id,
        documentId: documentId ?? this.documentId,
        quizProgress: quizProgress ?? this.quizProgress,
      );

  factory QuizProgress.fromJson(String str) => QuizProgress.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory QuizProgress.fromMap(Map<String, dynamic> json) => QuizProgress(
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

class Subject {
  final int? id;
  final String? documentId;
  final String? name;
  final String? description;

  Subject({
    this.id,
    this.documentId,
    this.name,
    this.description,
  });

  Subject copyWith({
    int? id,
    String? documentId,
    String? name,
    String? description,
  }) =>
      Subject(
        id: id ?? this.id,
        documentId: documentId ?? this.documentId,
        name: name ?? this.name,
        description: description ?? this.description,
      );

  factory Subject.fromJson(String str) => Subject.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Subject.fromMap(Map<String, dynamic> json) => Subject(
        id: json["id"],
        documentId: json["documentId"],
        name: json["name"],
        description: json["Description"],
      );

  Map<String, dynamic> toMap() => {
        "id": id,
        "documentId": documentId,
        "name": name,
        "Description": description,
      };
}

class Meta {
  final Pagination? pagination;

  Meta({
    this.pagination,
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
        pagination: json["pagination"] != null ? Pagination.fromMap(json["pagination"]) : null,
      );

  Map<String, dynamic> toMap() => {
        "pagination": pagination?.toMap(),
      };
}

class Pagination {
  final int? page;
  final int? pageSize;
  final int? pageCount;
  final int? total;

  Pagination({
    this.page,
    this.pageSize,
    this.pageCount,
    this.total,
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
