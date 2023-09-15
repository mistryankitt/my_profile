import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:my_profile/utils/const.dart';
import 'package:my_profile/utils/ui_const.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthService {
  static Future<UserCredential?> loginWithGoogleS() async {
    try {
      GoogleSignInAccount? googleSignInAccount = await GoogleSignIn().signIn();

      if (googleSignInAccount == null) {
        UiConstant.customToastShow('Google Sign-In Canceled.');
      }

      // Get authentication data
      GoogleSignInAuthentication? authentication =
          await googleSignInAccount?.authentication;

      // Create credentials for Firebase Authentication
      AuthCredential authCredential = GoogleAuthProvider.credential(
        accessToken: authentication?.accessToken,
        idToken: authentication?.idToken,
      );

      // Sign in with Firebase using the credentials
      UserCredential userCredential =
          await FirebaseAuth.instance.signInWithCredential(authCredential);


      return userCredential;
    } catch (e) {
      // Handle any exceptions that may occur during the process.
      log('Error during Google Sign-In: $e');
      UiConstant.customToastShow('An error occurred during Google Sign-In.');
    }
    return null;
  }

  static signOutGoogle() async {
    await GoogleSignIn().signOut();
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.remove(Constant.loginIdSaved);

    log("User signed out");
  }
}
