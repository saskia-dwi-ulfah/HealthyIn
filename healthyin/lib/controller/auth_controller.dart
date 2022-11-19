// ignore_for_file: prefer_const_constructors, duplicate_ignore
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:healthyin/screens/Main%20Page/healthyin_main_page.dart';
import 'package:healthyin/screens/Login%20Page/healthyin_login_page.dart';

//must accesible from all pages: globally
class AuthController extends GetxController {
  //AuthController.instance => To be able to call from other pages
  static final AuthController instance = Get.find();
  //coming from Firebase authentication and save user information
  FirebaseAuth auth = FirebaseAuth.instance;
  //for storing user info into Firestore
  CollectionReference users = FirebaseFirestore.instance.collection('users');

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

  // ignore: duplicate_ignore
  _initialScreen(User? user) {
    // ignore: duplicate_ignore, duplicate_ignore
    if (user == null) {
      //nobody tries to login
      Get.offAll(() => HealthyInLoginScreen());
    } else {
      Get.offAll(() => HealthyInMainPage(email: user.email!));
    }
  }

  void register(String name, String email, password) async {
    try {
      await auth.createUserWithEmailAndPassword(
          email: email, password: password);

      await users.add({
        'authenticated_user_id': auth.currentUser!.uid,
        'email': auth.currentUser!.email,
        'name': name,
      });
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

  /*void signInAndLogInWithGoogle() async {
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
        // ignore: unused_local_variable
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
  } */

  void logout() async {
    await auth.signOut();
  }
}
