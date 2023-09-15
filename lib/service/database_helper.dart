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
      profile: "data:image/jpeg;base64,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",
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
