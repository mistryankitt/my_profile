import 'dart:developer';

import 'package:hive/hive.dart';
import 'package:my_profile/model/user_model.dart';

class UserAccountDataBase {
  final myBox = Hive.box('users');

  List<dynamic> users = [
    UserModel(
      uid: "0",
      email: "ankitmistry1999@outlook.com",
      password: "ankitmistry",
      name: "ankit mistry",
      skills: "flutter, dart, hive, socket.io, firebase",
      experience: "i've 1.5 year experience in flutter",
    ),
  ];

  Future<void> updateDetails(UserModel userModel) async {
    log(userModel.name.toString());
    List<dynamic> users = myBox.get("USERSLIST");
    final userIndex =
        users.indexWhere((element) => element.uid == userModel.uid);
    log(userIndex.toString());
    users[userIndex] = userModel;
    await myBox.put("USERSLIST", users);

    for (UserModel user in users) {
      log("name : ${user.name}");

    }
  }

  void loadData() async {
    log("is user list is empty ?: ${await myBox.get("USERSLIST") == null}");

    if (await myBox.get("USERSLIST") == null) {
      // If the data is not present in Hive, initialize it
      myBox.put("USERSLIST", users);
    } else {
      // Load the data from Hive and cast it to List<UserModel>
      List<dynamic> users = myBox.get("USERSLIST");
      for (UserModel user in users) {
        log("Email: ${user.email}");
      }
    }
  }
}
