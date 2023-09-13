import 'dart:developer';

import 'package:hive/hive.dart';
import 'package:my_profile/model/user_model.dart';

class UserAccountDataBase {
  List users = [];


  // run this method if this is the 1st time ever opening this app
  void createInitialData() {
    users = [
      UserModel(
        uid: "0",
        username: "ankitmistry1999@gmail.com",
        password: "ankitmistry",
      ),
      UserModel(
        uid: "1",
        username: "ankit",
        password: "mistry",
      ),
      UserModel(
        uid: "2",
        username: "mistry",
        password: "ankit",
      )
    ];
    updateDataBase();

  }

  // load the data from database
  void loadData() async {
    final box = Hive.box("users");

    users = await box.get("USERSLIST");
    updateDataBase();
  }

  // update the database
  void updateDataBase() async {
    final box = Hive.box("users");
    box.put("USERSLIST", users);
    log("${await box.get("USERSLIST")}");
  }








}
