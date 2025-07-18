import 'dart:convert';

class SubjectListModel {
  final List<SubjectList>? subjectList;
  final Meta? meta;

  SubjectListModel({
    this.subjectList,
    this.meta,
  });

  SubjectListModel copyWith({
    List<SubjectList>? data,
    Meta? meta,
  }) =>
      SubjectListModel(
        subjectList: data ?? subjectList,
        meta: meta ?? this.meta,
      );

  factory SubjectListModel.fromJson(String str) => SubjectListModel.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory SubjectListModel.fromMap(Map<String, dynamic> json) => SubjectListModel(
        subjectList: json["data"] != null
            ? List<SubjectList>.from(json["data"].map((x) => SubjectList.fromMap(x)))
            : null,
        meta: json["meta"] != null ? Meta.fromMap(json["meta"]) : null,
      );

  Map<String, dynamic> toMap() => {
        "data": subjectList != null ? List<dynamic>.from(subjectList!.map((x) => x.toMap())) : null,
        "meta": meta?.toMap(),
      };
}

class SubjectList {
  final int? id;
  final String? documentId;
  final String? name;
  final String? description;
  final String? imageUrl;

  SubjectList({
    this.id,
    this.documentId,
    this.name,
    this.description,
    this.imageUrl,
  });

  SubjectList copyWith({
    int? id,
    String? documentId,
    String? name,
    String? description,
    String? imageUrl,
  }) =>
      SubjectList(
        id: id ?? this.id,
        documentId: documentId ?? this.documentId,
        name: name ?? this.name,
        description: description ?? this.description,
        imageUrl: imageUrl ?? this.imageUrl,
      );

  factory SubjectList.fromJson(String str) => SubjectList.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory SubjectList.fromMap(Map<String, dynamic> json) => SubjectList(
        id: json["id"],
        documentId: json["documentId"],
        name: json["name"],
        description: json["Description"],
        imageUrl: json["image_url"],
      );

  Map<String, dynamic> toMap() => {
        "id": id,
        "documentId": documentId,
        "name": name,
        "Description": description,
        "image_url": imageUrl,
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
