import 'dart:convert';

class BlogCommentModel {
  final List<BlogCommentData> blogCommentData;
  final Meta meta;

  BlogCommentModel({
    required this.blogCommentData,
    required this.meta,
  });

  BlogCommentModel copyWith({
    List<BlogCommentData>? data,
    Meta? meta,
  }) =>
      BlogCommentModel(
        blogCommentData: data ?? blogCommentData,
        meta: meta ?? this.meta,
      );

  factory BlogCommentModel.fromJson(String str) => BlogCommentModel.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory BlogCommentModel.fromMap(Map<String, dynamic> json) => BlogCommentModel(
        blogCommentData:
            List<BlogCommentData>.from(json["data"].map((x) => BlogCommentData.fromMap(x))),
        meta: Meta.fromMap(json["meta"]),
      );

  Map<String, dynamic> toMap() => {
        "data": List<dynamic>.from(blogCommentData.map((x) => x.toMap())),
        "meta": meta.toMap(),
      };
}

class BlogCommentData {
  final int id;
  final String documentId;
  final String comment;
  final dynamic blog;

  BlogCommentData({
    required this.id,
    required this.documentId,
    required this.comment,
    required this.blog,
  });

  BlogCommentData copyWith({
    int? id,
    String? documentId,
    String? comment,
    dynamic blog,
  }) =>
      BlogCommentData(
        id: id ?? this.id,
        documentId: documentId ?? this.documentId,
        comment: comment ?? this.comment,
        blog: blog ?? this.blog,
      );

  factory BlogCommentData.fromJson(String str) => BlogCommentData.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory BlogCommentData.fromMap(Map<String, dynamic> json) => BlogCommentData(
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
