import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:my_profile/service/auth_service.dart';

import 'state.dart';

class LoginCubit extends Cubit<LoginState> {
  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  LoginCubit() : super(LoginState().init());

  TextEditingController usernameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  String myEmail = "ankitmistry1999@gmail.com";
  String password = "ankitmistry";

  void loginUserM() {
    if (formKey.currentState!.validate()) {
      if (myEmail == usernameController.text &&
          password == passwordController.text) {
      } else {
        log("user not found");
      }
    }
  }

  void googleSignInM() async {
    AuthService.loginWithGoogleS();
  }
}
