import 'dart:convert';

class VideosModel {
  final List<VideosList> videosList;
  final Meta meta;

  VideosModel({
    required this.videosList,
    required this.meta,
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
        videosList: List<VideosList>.from(json["data"].map((x) => VideosList.fromMap(x))),
        meta: Meta.fromMap(json["meta"]),
      );

  Map<String, dynamic> toMap() => {
        "data": List<dynamic>.from(videosList.map((x) => x.toMap())),
        "meta": meta.toMap(),
      };
}

class VideosList {
  final int id;
  final String documentId;
  final String name;
  final String videoUrl;
  final Subject subject;

  VideosList({
    required this.id,
    required this.documentId,
    required this.name,
    required this.videoUrl,
    required this.subject,
  });

  VideosList copyWith({
    int? id,
    String? documentId,
    String? name,
    String? videoUrl,
    Subject? subject,
  }) =>
      VideosList(
        id: id ?? this.id,
        documentId: documentId ?? this.documentId,
        name: name ?? this.name,
        videoUrl: videoUrl ?? this.videoUrl,
        subject: subject ?? this.subject,
      );

  factory VideosList.fromJson(String str) => VideosList.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory VideosList.fromMap(Map<String, dynamic> json) => VideosList(
        id: json["id"],
        documentId: json["documentId"],
        name: json["name"],
        videoUrl: json["video_url"],
        subject: Subject.fromMap(json["subject"]),
      );

  Map<String, dynamic> toMap() => {
        "id": id,
        "documentId": documentId,
        "name": name,
        "video_url": videoUrl,
        "subject": subject.toMap(),
      };
}

class Subject {
  final int id;
  final String documentId;
  final String name;
  final String description;

  Subject({
    required this.id,
    required this.documentId,
    required this.name,
    required this.description,
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
        pagination: json["pagination"] == null ? null : Pagination.fromMap(json["pagination"]),
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
