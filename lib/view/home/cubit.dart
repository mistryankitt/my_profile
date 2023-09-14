import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:my_profile/model/user_model.dart';
import 'package:my_profile/service/auth_service.dart';
import 'package:my_profile/service/database_helper.dart';
import 'package:my_profile/service/service_locator.dart';
import 'package:my_profile/utils/const.dart';
import 'package:my_profile/view/app_routes.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit() : super(HomeState().init());

  UserAccountDataBase db = UserAccountDataBase();

  UserModel? userModel;

  Future<UserModel> getUserInfo() async {
    final SharedPreferences preferences = await SharedPreferences.getInstance();
    final uid = preferences.getString(Constant.loginIdSaved);
    final userList = db.myBox.get("USERSLIST");
    log("uid===> $uid");
    final user = userList.firstWhere(
        (user) => user.uid == preferences.getString(Constant.loginIdSaved));
    if (user != null) {
      emit(UserDataLoaded(user));
      return user;
    } else {
      throw Exception(
          'User with uid ${preferences.getString(Constant.loginIdSaved)} not found.');
    }
  }




  void signOut() {
    AuthService.signOutGoogle();
    Navigator.pushNamedAndRemoveUntil(
        navigatorKey.currentContext!, AppRoutes.loginPage, (route) => false);
  }


}
