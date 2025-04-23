import 'dart:convert';

class LoginUserResponseModel {
    final String? jwt;
    final User? user;

    LoginUserResponseModel({
        this.jwt,
        this.user,
    });

    LoginUserResponseModel copyWith({
        String? jwt,
        User? user,
    }) => 
        LoginUserResponseModel(
            jwt: jwt ?? this.jwt,
            user: user ?? this.user,
        );

    factory LoginUserResponseModel.fromJson(String str) => LoginUserResponseModel.fromMap(json.decode(str));

    String toJson() => json.encode(toMap());

    factory LoginUserResponseModel.fromMap(Map<String, dynamic> json) => LoginUserResponseModel(
        jwt: json["jwt"],
        user: json["user"] == null ? null : User.fromMap(json["user"]),
    );

    Map<String, dynamic> toMap() => {
        "jwt": jwt,
        "user": user?.toMap(),
    };
}

class User {
    final int? id;
    final String? documentId;
    final String? username;
    final String? email;
    final bool? confirmed;
    final bool? blocked;
    final String? phone;
    final String? firstName;
    final String? lastName;
    final String? resetCode;
    final DateTime? expiryTime;
    final bool? isAdmin;

    User({
        this.id,
        this.documentId,
        this.username,
        this.email,
        this.confirmed,
        this.blocked,
        this.phone,
        this.firstName,
        this.lastName,
        this.resetCode,
        this.expiryTime,
        this.isAdmin,
    });

    User copyWith({
        int? id,
        String? documentId,
        String? username,
        String? email,
        bool? confirmed,
        bool? blocked,
        String? phone,
        String? firstName,
        String? lastName,
        String? resetCode,
        DateTime? expiryTime,
        bool? isAdmin,
    }) => 
        User(
            id: id ?? this.id,
            documentId: documentId ?? this.documentId,
            username: username ?? this.username,
            email: email ?? this.email,
            confirmed: confirmed ?? this.confirmed,
            blocked: blocked ?? this.blocked,
            phone: phone ?? this.phone,
            firstName: firstName ?? this.firstName,
            lastName: lastName ?? this.lastName,
            resetCode: resetCode ?? this.resetCode,
            expiryTime: expiryTime ?? this.expiryTime,
            isAdmin: isAdmin ?? this.isAdmin,
        );

    factory User.fromJson(String str) => User.fromMap(json.decode(str));

    String toJson() => json.encode(toMap());

    factory User.fromMap(Map<String, dynamic> json) => User(
        id: json["id"],
        documentId: json["documentId"],
        username: json["username"],
        email: json["email"],
        confirmed: json["confirmed"],
        blocked: json["blocked"],
        phone: json["phone"],
        firstName: json["firstName"],
        lastName: json["lastName"],
        resetCode: json["resetCode"],
        expiryTime: json["expiryTime"] == null ? null : DateTime.parse(json["expiryTime"]),
        isAdmin: json["isAdmin"],
    );

    Map<String, dynamic> toMap() => {
        "id": id,
        "documentId": documentId,
        "username": username,
        "email": email,
        "confirmed": confirmed,
        "blocked": blocked,
        "phone": phone,
        "firstName": firstName,
        "lastName": lastName,
        "resetCode": resetCode,
        "expiryTime": expiryTime?.toIso8601String(),
        "isAdmin": isAdmin,
    };
}
