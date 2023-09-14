import 'package:hive/hive.dart';

part 'user_model.g.dart';

@HiveType(typeId: 0)
class UserModel extends HiveObject {
  UserModel({
    this.uid,
    this.email,
    this.password,
    this.name,
    this.skills,
    this.experience,
    this.profile,
  });

  @HiveField(0)
  String? uid;
  @HiveField(1)
  String? email;
  @HiveField(2)
  String? password;
  @HiveField(3)
  String? name;
  @HiveField(4)
  String? profile;
  @HiveField(5)
  String? skills;
  @HiveField(6)
  String? experience;

  factory UserModel.fromJson(Map<String, dynamic> json) => UserModel(
        uid: json["uid"],
        email: json["email"],
        password: json["password"],
        name: json["name"],
        profile: json["profile"],
        skills: json["skills"],
        experience: json["experience"],
      );

  Map<String, dynamic> toJson() => {
        "uid": uid,
        "email": email,
        "password": password,
        "name": name,
        "profile": profile,
        "skills": skills,
        "experience": experience,
      };
}
