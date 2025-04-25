import 'dart:convert';

import 'package:edtech_app/data/model/videos_list_model.dart';

class BlogModel {
  final List<BlogList> bloglist;
  final Meta meta;

  BlogModel({
    required this.bloglist,
    required this.meta,
  });

  BlogModel copyWith({
    List<BlogList>? data,
    Meta? meta,
  }) =>
      BlogModel(
        bloglist: data ?? bloglist,
        meta: meta ?? this.meta,
      );

  factory BlogModel.fromJson(String str) => BlogModel.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory BlogModel.fromMap(Map<String, dynamic> json) => BlogModel(
        bloglist: List<BlogList>.from(json["data"].map((x) => BlogList.fromMap(x))),
        meta: Meta.fromMap(json["meta"]),
      );

  Map<String, dynamic> toMap() => {
        "data": List<dynamic>.from(bloglist.map((x) => x.toMap())),
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
  final User user;

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
    required this.user,
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
        user: User.fromMap(json["user"]),
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
        "user": user.toMap(),
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
  final int id;
  final String documentId;
  final String firstName;
  final String lastName;

  User({
    required this.id,
    required this.documentId,
    required this.firstName,
    required this.lastName,
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
