import 'dart:developer';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';
import 'package:my_profile/model/user_model.dart';
import 'package:my_profile/service/database_helper.dart';
import 'package:my_profile/service/service_locator.dart';
import 'package:my_profile/utils/const.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'state.dart';

class EditCubit extends Cubit<EditState> {
  TextEditingController emailController = TextEditingController();
  TextEditingController nameController = TextEditingController();
  TextEditingController skillsController = TextEditingController();
  TextEditingController experienceController = TextEditingController();

  String? imagePath;

  EditCubit() : super(EditState().init());

  void updateProfile() async {
    SharedPreferences pref = await SharedPreferences.getInstance();

    locator.get<UserAccountDataBase>().updateDetails(UserModel(
        uid: pref.getString(Constant.loginIdSaved),
        email: emailController.text,
        experience: experienceController.text,
        skills: skillsController.text,
        name: nameController.text,
        profile: imagePath));
    Navigator.of(navigatorKey.currentContext!).pop();
  }

  Future<UserModel> getUserInfo() async {
    final SharedPreferences preferences = await SharedPreferences.getInstance();
    final uid = preferences.getString(Constant.loginIdSaved);
    final userList = locator.get<UserAccountDataBase>().myBox.get("USERSLIST");
    log("uid===> $uid");
    final user = userList.firstWhere(
        (user) => user.uid == preferences.getString(Constant.loginIdSaved));
    emailController.text = user.email;
    nameController.text = user.name;
    skillsController.text = user.skills;
    experienceController.text = user.experience;
    imagePath = user.profile;
    if (user != null) {
      return user;
    } else {
      throw Exception(
          'User with uid ${preferences.getString(Constant.loginIdSaved)} not found.');
    }
  }

  void showDialogM() {
    showDialog(
      context: navigatorKey.currentContext!,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text("Confirm Discard?"),
          content: const Text("Do you want to discard your changes?"),
          actions: <Widget>[
            TextButton(
              child: const Text("Discard"),
              onPressed: () {
                Navigator.of(context).pop();
                Navigator.of(context).pop();
              },
            ),
            TextButton(
              child: const Text("Save"),
              onPressed: () async {
                Navigator.of(context).pop();
                Navigator.of(context).pop();

                SharedPreferences pref = await SharedPreferences.getInstance();

                locator.get<UserAccountDataBase>().updateDetails(UserModel(
                    uid: pref.getString(Constant.loginIdSaved),
                    email: emailController.text,
                    experience: experienceController.text,
                    skills: skillsController.text,
                    name: nameController.text,
                    profile: imagePath));
              },
            ),
          ],
        );
      },
    );
  }
}
