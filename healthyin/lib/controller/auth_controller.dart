import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:healthyin/screens/Main%20Page/healthyin_main_page.dart';
import 'package:healthyin/screens/Login%20Page/healthyin_login_page.dart';

//must accesible from all pages: globally
class AuthController extends GetxController {
  //AuthController.instance => To be able to call from other pages
  static final AuthController instance = Get.find();
  //coming from Firebase authentication and save user information
  FirebaseAuth auth = FirebaseAuth.instance;

  //for Google sign in method
  final GoogleSignIn googleSignIn = GoogleSignIn();

  //declare Firebase user
  late Rx<User?> _user;

  @override
  void onReady() {
    super.onReady();
    _user = Rx<User?>(auth.currentUser);
    //our user would be notified
    _user.bindStream(auth.userChanges());
    ever(_user, _initialScreen);
  }

  _initialScreen(User? user) {
    if (user == null) {
      //nobody tries to login
      print("login page");
      Get.offAll(() => HealthyInLoginScreen());
    } else {
      Get.offAll(() => HealthyInMainPage(email: user.email!));
    }
  }

  void register(String email, password) async {
    try {
      await auth.createUserWithEmailAndPassword(
          email: email, password: password);
    } catch (e) {
      Get.snackbar("About User", "User message",
          backgroundColor: Colors.redAccent,
          snackPosition: SnackPosition.BOTTOM,
          titleText: Text("Account creation failed",
              style: TextStyle(color: Colors.white)),
          messageText: Text(
            e.toString(),
            style: TextStyle(color: Colors.white),
          ));
    }
  }

  void login(String email, password) async {
    try {
      await auth.signInWithEmailAndPassword(email: email, password: password);
    } catch (e) {
      Get.snackbar("About Login", "Login message",
          backgroundColor: Colors.redAccent,
          snackPosition: SnackPosition.BOTTOM,
          titleText:
              Text("Login failed", style: TextStyle(color: Colors.white)),
          messageText: Text(
            e.toString(),
            style: TextStyle(color: Colors.white),
          ));
    }
  }

  void signInAndLogInWithGoogle() async {
    final GoogleSignInAccount? googleSignInAccount =
        await googleSignIn.signIn();

    if (googleSignInAccount != null) {
      final GoogleSignInAuthentication googleSignInAuthentication =
          await googleSignInAccount.authentication;

      final AuthCredential credential = GoogleAuthProvider.credential(
        accessToken: googleSignInAuthentication.accessToken,
        idToken: googleSignInAuthentication.idToken,
      );

      try {
        final UserCredential userCredential =
            await auth.signInWithCredential(credential);
      } on FirebaseAuthException catch (e) {
        if (e.code == 'account-exists-with-different-credential') {
          Get.snackbar("About Login", "Login message",
              backgroundColor: Colors.redAccent,
              snackPosition: SnackPosition.BOTTOM,
              titleText:
                  Text("Login failed", style: TextStyle(color: Colors.white)),
              messageText: Text(
                e.toString(),
                style: TextStyle(color: Colors.white),
              ));
        } else if (e.code == 'invalid-credential') {
          Get.snackbar("About Login", "Login message",
              backgroundColor: Colors.redAccent,
              snackPosition: SnackPosition.BOTTOM,
              titleText:
                  Text("Login failed", style: TextStyle(color: Colors.white)),
              messageText: Text(
                e.toString(),
                style: TextStyle(color: Colors.white),
              )); // handle the error here
        }
      } catch (e) {
        Get.snackbar("About Login", "Login message",
            backgroundColor: Colors.redAccent,
            snackPosition: SnackPosition.BOTTOM,
            titleText:
                Text("Login failed", style: TextStyle(color: Colors.white)),
            messageText: Text(
              e.toString(),
              style: TextStyle(color: Colors.white),
            )); // handle the error here
      }
    }
  }

  void logout() async {
    await auth.signOut();
  }
}

/* To do:
Fixing error Google Login
*/