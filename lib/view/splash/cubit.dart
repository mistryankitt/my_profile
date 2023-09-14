import 'dart:async';
import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:my_profile/service/database_helper.dart';
import 'package:my_profile/utils/const.dart';
import 'package:my_profile/view/app_routes.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'state.dart';

class SplashCubit extends Cubit<SplashState> {
  SplashCubit() : super(SplashState().init());
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
  UserAccountDataBase db = UserAccountDataBase();

  /// splash screen to navigate on Boarding screen
  loadSplashScreen() {
    db.loadData();
    Timer(const Duration(seconds: 2), () async {
      SharedPreferences preferences = await SharedPreferences.getInstance();
      if (preferences.getString(Constant.loginIdSaved) != null) {
        scaffoldKey.currentContext != null
            ? Navigator.pushNamedAndRemoveUntil(scaffoldKey.currentContext!,
                AppRoutes.homePage, (route) => false)
            : null;
      }else{
        scaffoldKey.currentContext != null
            ? Navigator.pushNamedAndRemoveUntil(scaffoldKey.currentContext!,
            AppRoutes.loginPage, (route) => false)
            : null;
      }
    });
  }
}
