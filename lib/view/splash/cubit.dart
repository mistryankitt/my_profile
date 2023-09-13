import 'dart:async';
import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:my_profile/service/database_helper.dart';
import 'package:my_profile/view/app_routes.dart';

import 'state.dart';

class SplashCubit extends Cubit<SplashState> {
  SplashCubit() : super(SplashState().init());
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
  UserAccountDataBase db = UserAccountDataBase();

  /// splash screen to navigate on Boarding screen
  void loadSplashScreen() {
    db.createInitialData();
    Timer(const Duration(seconds: 2), () async {
      scaffoldKey.currentContext != null
          ? Navigator.pushNamedAndRemoveUntil(scaffoldKey.currentContext!,
              AppRoutes.loginPage, (route) => false)
          :     log("message");

    });
  }
}
