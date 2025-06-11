import 'dart:convert';

class BlogCommentResponseModel {
  final Data? data;
  final Meta? meta;

  BlogCommentResponseModel({
    this.data,
    this.meta,
  });

  BlogCommentResponseModel copyWith({
    Data? data,
    Meta? meta,
  }) =>
      BlogCommentResponseModel(
        data: data ?? this.data,
        meta: meta ?? this.meta,
      );

  factory BlogCommentResponseModel.fromJson(String str) =>
      BlogCommentResponseModel.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory BlogCommentResponseModel.fromMap(Map<String, dynamic> json) => BlogCommentResponseModel(
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
  final String? comment;
  final dynamic blog;

  Data({
    this.id,
    this.documentId,
    this.comment,
    this.blog,
  });

  Data copyWith({
    int? id,
    String? documentId,
    String? comment,
    dynamic blog,
  }) =>
      Data(
        id: id ?? this.id,
        documentId: documentId ?? this.documentId,
        comment: comment ?? this.comment,
        blog: blog ?? this.blog,
      );

  factory Data.fromJson(String str) => Data.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Data.fromMap(Map<String, dynamic> json) => Data(
        id: json["id"],
        documentId: json["documentId"],
        comment: json["comment"],
        blog: json["blog"],
      );

  Map<String, dynamic> toMap() => {
        "id": id,
        "documentId": documentId,
        "comment": comment,
        "blog": blog,
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
