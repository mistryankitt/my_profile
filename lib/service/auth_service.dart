import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:my_profile/utils/ui_const.dart';

class AuthService {
  static Future<void> loginWithGoogleS() async {
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

    // Extract the first and last name from the display name (if available)
    final displayName = googleSignInAccount?.displayName;
    final nameArray = displayName?.split(" ");
    final firstName = nameArray?.isNotEmpty == true ? nameArray![0] : '';
    final lastName = nameArray?.length == 2 ? nameArray![1] : '';



  }

  void signOutGoogle() async {
    await GoogleSignIn().signOut();
    log("User signed out");
  }
}
