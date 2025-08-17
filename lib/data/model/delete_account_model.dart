import 'dart:convert';

import 'package:edtech_app/data/model/blog_model.dart';

class DeleteAccountModel {
  final DeleteAccountData? deleteAccountData;
  final Meta? meta;

  DeleteAccountModel({
    this.deleteAccountData,
    this.meta,
  });

  DeleteAccountModel copyWith({
    DeleteAccountData? data,
    Meta? meta,
  }) =>
      DeleteAccountModel(
        deleteAccountData: data ?? deleteAccountData,
        meta: meta ?? this.meta,
      );

  factory DeleteAccountModel.fromJson(String str) => DeleteAccountModel.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory DeleteAccountModel.fromMap(Map<String, dynamic> json) => DeleteAccountModel(
        deleteAccountData: json["data"] != null ? DeleteAccountData.fromMap(json["data"]) : null,
        meta: json["meta"] != null ? Meta.fromMap(json["meta"]) : null,
      );

  Map<String, dynamic> toMap() => {
        "data": deleteAccountData?.toMap(),
        "meta": meta?.toMap(),
      };
}

class DeleteAccountData {
  final int? id;
  final String? documentId;
  final String? type;
  final String? comment;
  final String? status;
  final User? user;

  DeleteAccountData({
    this.id,
    this.documentId,
    this.type,
    this.comment,
    this.status,
    this.user,
  });

  DeleteAccountData copyWith({
    int? id,
    String? documentId,
    String? type,
    String? comment,
    String? status,
    User? user,
  }) =>
      DeleteAccountData(
        id: id ?? this.id,
        documentId: documentId ?? this.documentId,
        type: type ?? this.type,
        comment: comment ?? this.comment,
        status: status ?? this.status,
        user: user ?? this.user,
      );

  factory DeleteAccountData.fromJson(String str) => DeleteAccountData.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory DeleteAccountData.fromMap(Map<String, dynamic> json) => DeleteAccountData(
        id: json["id"],
        documentId: json["documentId"],
        type: json["type"],
        comment: json["comment"],
        status: json["status"],
        user: json["user"] != null ? User.fromMap(json["user"]) : null,
      );

  Map<String, dynamic> toMap() => {
        "id": id,
        "documentId": documentId,
        "type": type,
        "comment": comment,
        "status": status,
        "user": user?.toMap(),
      };
}

class User {
  final int? id;
  final String? documentId;
  final String? firstName;
  final String? email;

  User({
    this.id,
    this.documentId,
    this.firstName,
    this.email,
  });

  User copyWith({
    int? id,
    String? documentId,
    String? firstName,
    String? email,
  }) =>
      User(
        id: id ?? this.id,
        documentId: documentId ?? this.documentId,
        firstName: firstName ?? this.firstName,
        email: email ?? this.email,
      );

  factory User.fromJson(String str) => User.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory User.fromMap(Map<String, dynamic> json) => User(
        id: json["id"],
        documentId: json["documentId"],
        firstName: json["firstName"],
        email: json["email"],
      );

  Map<String, dynamic> toMap() => {
        "id": id,
        "documentId": documentId,
        "firstName": firstName,
        "email": email,
      };
}
