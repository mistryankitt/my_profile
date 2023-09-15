import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive/hive.dart';
import 'package:my_profile/model/user_model.dart';
import 'package:my_profile/service/auth_service.dart';
import 'package:my_profile/service/database_helper.dart';
import 'package:my_profile/service/service_locator.dart';
import 'package:my_profile/utils/const.dart';
import 'package:my_profile/utils/ui_const.dart';
import 'package:my_profile/view/app_routes.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'state.dart';

class LoginCubit extends Cubit<LoginState> {
  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  LoginCubit() : super(LoginState().init());

  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  String myEmail = "ankitmistry1999@gmail.com";
  String password = "ankitmistry";
  final _myBox = Hive.box('users');

  void loginUserM() async {
    if (formKey.currentState!.validate()) {
      final SharedPreferences prefs = await SharedPreferences.getInstance();

      log("${db.users.indexWhere((user) => user.email == emailController.text && user.password == passwordController.text)}");
      log(emailController.text);
      log(passwordController.text);
      if (db.users.indexWhere((user) =>
              user.email == emailController.text &&
              user.password == passwordController.text) >=
          0) {
        prefs.setString(Constant.loginIdSaved, "0");

        Navigator.pushNamedAndRemoveUntil(
            navigatorKey.currentContext!, AppRoutes.homePage, (route) => false);
      } else {
        log("user not found");
        UiConstant.customToastShow("User not found");
      }
    }
  }

  UserAccountDataBase db = UserAccountDataBase();

  void googleSignInM() async {
    AuthService.loginWithGoogleS().then((value) async {
      final SharedPreferences prefs = await SharedPreferences.getInstance();

      if (value != null) {
        List<dynamic> usersList = _myBox.get("USERSLIST");
        bool emailExists =
            usersList.any((user) => user.email == value.user?.email);
        log("get uuid google ${value.user?.email}");
        if (!emailExists) {
          // Email doesn't exist in the list, so add the new user
          usersList.add(
            UserModel(
              uid: value.user?.uid,
              email: value.user?.email,
              password: value.user?.uid,
              name: value.user?.displayName,
              profile: value.user?.photoURL,
              skills: "",
              experience: "",
            ),
          );
          // Save the updated list back to Hive
          _myBox.put("USERSLIST", usersList);
          prefs.setString(Constant.loginIdSaved, value.user?.uid ?? "");
        } else {
          prefs.setString(Constant.loginIdSaved, value.user?.uid ?? "");
        }

        Navigator.pushNamedAndRemoveUntil(
            navigatorKey.currentContext!, AppRoutes.homePage, (route) => false);
      }
    });
  }
}
