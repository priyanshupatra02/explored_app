import 'dart:convert';

class BlogsCategoriesModel {
  final List<BlogsCategoriesList> blogsCategoriesList;
  final Meta meta;

  BlogsCategoriesModel({
    required this.blogsCategoriesList,
    required this.meta,
  });

  BlogsCategoriesModel copyWith({
    List<BlogsCategoriesList>? data,
    Meta? meta,
  }) =>
      BlogsCategoriesModel(
        blogsCategoriesList: data ?? blogsCategoriesList,
        meta: meta ?? this.meta,
      );

  factory BlogsCategoriesModel.fromJson(String str) =>
      BlogsCategoriesModel.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory BlogsCategoriesModel.fromMap(Map<String, dynamic> json) => BlogsCategoriesModel(
        blogsCategoriesList:
            List<BlogsCategoriesList>.from(json["data"].map((x) => BlogsCategoriesList.fromMap(x))),
        meta: Meta.fromMap(json["meta"]),
      );

  Map<String, dynamic> toMap() => {
        "data": List<dynamic>.from(blogsCategoriesList.map((x) => x.toMap())),
        "meta": meta.toMap(),
      };
}

class BlogsCategoriesList {
  final int id;
  final String documentId;
  final String name;
  final String? slug;
  final dynamic description;

  BlogsCategoriesList({
    required this.id,
    required this.documentId,
    required this.name,
    this.slug,
    required this.description,
  });

  BlogsCategoriesList copyWith({
    int? id,
    String? documentId,
    String? name,
    String? slug,
    dynamic description,
  }) =>
      BlogsCategoriesList(
        id: id ?? this.id,
        documentId: documentId ?? this.documentId,
        name: name ?? this.name,
        slug: slug ?? this.slug,
        description: description ?? this.description,
      );

  factory BlogsCategoriesList.fromJson(String str) => BlogsCategoriesList.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory BlogsCategoriesList.fromMap(Map<String, dynamic> json) => BlogsCategoriesList(
        id: json["id"],
        documentId: json["documentId"],
        name: json["name"],
        slug: json["slug"],
        description: json["description"],
      );

  Map<String, dynamic> toMap() => {
        "id": id,
        "documentId": documentId,
        "name": name,
        "slug": slug,
        "description": description,
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
