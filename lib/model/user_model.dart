import 'package:hive/hive.dart';

import 'dart:convert';

UserModel userModelFromJson(String str) => UserModel.fromJson(json.decode(str));

String userModelToJson(UserModel data) => json.encode(data.toJson());

@HiveType(typeId: 0)
class UserModel {
  UserModel({
    this.uid,
    this.username,
    this.password,
    this.userLogbook,
  });

  @HiveField(0)
  String? uid;
  @HiveField(1)
  String? username;
  @HiveField(2)
  String? password;
  @HiveField(3)
  List<dynamic>? userLogbook;

  factory UserModel.fromJson(Map<String, dynamic> json) => UserModel(
        uid: json["uid"],
        username: json["username"],
        password: json["password"],
        userLogbook: json["userLogbook"] == null
            ? []
            : List<UserLogbook>.from(
                json["userLogbook"]!.map((x) => UserLogbook.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "uid": uid,
        "username": username,
        "password": password,
        "userLogbook": userLogbook == null
            ? []
            : List<dynamic>.from(userLogbook!.map((x) => x.toJson())),
      };
}

@HiveType(typeId: 1)
class UserLogbook {
  UserLogbook({
    required this.shippingProvider,
    required this.noOfBox,
    required this.createdAt,
    required this.comment,
    required this.uid,
  });

  @HiveField(0)
  String? shippingProvider;
  @HiveField(1)
  String? uid;
  @HiveField(2)
  String? noOfBox;
  @HiveField(3)
  String? createdAt;
  @HiveField(4)
  String? comment;

  factory UserLogbook.fromJson(Map<String, dynamic> json) => UserLogbook(
        shippingProvider: json["shipping_provider"],
        noOfBox: json["no_of_box"],
        createdAt: json["created_at"],
        comment: json["comment"],
        uid: json["uid"],
      );

  Map<String, dynamic> toJson() => {
        "shipping_provider": shippingProvider,
        "no_of_box": noOfBox,
        "created_at": createdAt,
        "comment": comment,
        "uid": uid,
      };
}

class UserModelAdapter extends TypeAdapter<UserModel> {
  @override
  final int typeId = 0;

  @override
  UserModel read(BinaryReader reader) {
    // Implement deserialization here
    // For example:
    final uid = reader.readString();
    final username = reader.readString();
    final password = reader.readString();
    final userLogbook = reader.readList();
    return UserModel(
        uid: uid, username: username, password: password, userLogbook: userLogbook);
  }

  @override
  void write(BinaryWriter writer, UserModel obj) {
    // Implement serialization here
    // For example:
    writer.writeString(obj.uid!);
    writer.writeString(obj.username!);
    writer.writeString(obj.password!);
    writer.writeList(obj.userLogbook!);
  }
}

class UserLogbookAdapter extends TypeAdapter<UserLogbook> {
  @override
  final int typeId = 1;

  @override
  UserLogbook read(BinaryReader reader) {
    // Implement deserialization here
    // For example:
    final uid = reader.readString();
    final provider = reader.readString();
    final box = reader.readString();
    final comment = reader.readString();
    final date = reader.readString();
    return UserLogbook(
        shippingProvider: provider,
        noOfBox: box,
        createdAt: date,
        comment: comment,
        uid: uid);
  }

  @override
  void write(BinaryWriter writer, UserLogbook obj) {
    // Implement serialization here
    // For example:
    writer.writeString(obj.uid!);
    writer.writeString(obj.shippingProvider!);
    writer.writeString(obj.noOfBox!);
    writer.writeString(obj.comment!);
    writer.writeString(obj.createdAt!);
  }
}
