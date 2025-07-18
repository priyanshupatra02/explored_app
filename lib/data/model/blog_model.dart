import 'dart:convert';

class BlogModel {
  final List<BlogList> blogList;
  final Meta meta;

  BlogModel({
    required this.blogList,
    required this.meta,
  });

  BlogModel copyWith({
    List<BlogList>? data,
    Meta? meta,
  }) =>
      BlogModel(
        blogList: data ?? blogList,
        meta: meta ?? this.meta,
      );

  factory BlogModel.fromJson(String str) => BlogModel.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory BlogModel.fromMap(Map<String, dynamic> json) => BlogModel(
        blogList: List<BlogList>.from(json["data"].map((x) => BlogList.fromMap(x))),
        meta: Meta.fromMap(json["meta"]),
      );

  Map<String, dynamic> toMap() => {
        "data": List<dynamic>.from(blogList.map((x) => x.toMap())),
        "meta": meta.toMap(),
      };
}

class BlogList {
  final int id;
  final String documentId;
  final String title;
  final String content;
  final DateTime createdAt;
  final DateTime updatedAt;
  final dynamic publishedAt;
  final dynamic locale;
  final Category category;
  final User? user;

  BlogList({
    required this.id,
    required this.documentId,
    required this.title,
    required this.content,
    required this.createdAt,
    required this.updatedAt,
    required this.publishedAt,
    required this.locale,
    required this.category,
    this.user,
  });

  BlogList copyWith({
    int? id,
    String? documentId,
    String? title,
    String? content,
    DateTime? createdAt,
    DateTime? updatedAt,
    dynamic publishedAt,
    dynamic locale,
    Category? category,
    User? user,
  }) =>
      BlogList(
        id: id ?? this.id,
        documentId: documentId ?? this.documentId,
        title: title ?? this.title,
        content: content ?? this.content,
        createdAt: createdAt ?? this.createdAt,
        updatedAt: updatedAt ?? this.updatedAt,
        publishedAt: publishedAt ?? this.publishedAt,
        locale: locale ?? this.locale,
        category: category ?? this.category,
        user: user ?? this.user,
      );

  factory BlogList.fromJson(String str) => BlogList.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory BlogList.fromMap(Map<String, dynamic> json) => BlogList(
        id: json["id"],
        documentId: json["documentId"],
        title: json["title"],
        content: json["content"],
        createdAt: DateTime.parse(json["createdAt"]),
        updatedAt: DateTime.parse(json["updatedAt"]),
        publishedAt: json["publishedAt"],
        locale: json["locale"],
        category: Category.fromMap(json["category"]),
        user: json["user"] != null ? User.fromMap(json["user"]) : null,
      );

  Map<String, dynamic> toMap() => {
        "id": id,
        "documentId": documentId,
        "title": title,
        "content": content,
        "createdAt": createdAt.toIso8601String(),
        "updatedAt": updatedAt.toIso8601String(),
        "publishedAt": publishedAt,
        "locale": locale,
        "category": category.toMap(),
        "user": user?.toMap(),
      };
}

class Category {
  final int id;
  final String documentId;
  final String name;
  final dynamic description;

  Category({
    required this.id,
    required this.documentId,
    required this.name,
    required this.description,
  });

  Category copyWith({
    int? id,
    String? documentId,
    String? name,
    dynamic description,
  }) =>
      Category(
        id: id ?? this.id,
        documentId: documentId ?? this.documentId,
        name: name ?? this.name,
        description: description ?? this.description,
      );

  factory Category.fromJson(String str) => Category.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Category.fromMap(Map<String, dynamic> json) => Category(
        id: json["id"],
        documentId: json["documentId"],
        name: json["name"],
        description: json["description"],
      );

  Map<String, dynamic> toMap() => {
        "id": id,
        "documentId": documentId,
        "name": name,
        "description": description,
      };
}

class User {
  final int? id;
  final String? documentId;
  final String? firstName;
  final String? lastName;

  User({
    this.id,
    this.documentId,
    this.firstName,
    this.lastName,
  });

  User copyWith({
    int? id,
    String? documentId,
    String? firstName,
    String? lastName,
  }) =>
      User(
        id: id ?? this.id,
        documentId: documentId ?? this.documentId,
        firstName: firstName ?? this.firstName,
        lastName: lastName ?? this.lastName,
      );

  factory User.fromJson(String str) => User.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory User.fromMap(Map<String, dynamic> json) => User(
        id: json["id"],
        documentId: json["documentId"],
        firstName: json["firstName"],
        lastName: json["lastName"],
      );

  Map<String, dynamic> toMap() => {
        "id": id,
        "documentId": documentId,
        "firstName": firstName,
        "lastName": lastName,
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