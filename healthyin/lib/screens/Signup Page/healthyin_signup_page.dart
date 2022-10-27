import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:healthyin/controller/auth_controller.dart';

//https://stackoverflow.com/questions/58722426/text-input-value-is-disappearing-flutter
var emailController = TextEditingController();
var passwordController = TextEditingController();

class HealthyInSignupScreen extends StatelessWidget {
  const HealthyInSignupScreen({super.key});

  @override
  Widget build(BuildContext context) {
    double w = MediaQuery.of(context).size.width;
    double h = MediaQuery.of(context).size.height;

    return Scaffold(
        backgroundColor: Colors.white,
        body: Column(children: [
          Container(
            height: 0.2 * h,
            width: w,
            color: Colors.white,
            child: Stack(
              children: [
                Center(
                  child: Image.asset("assets/icons/logo_healthyin_x2.png",
                      scale: 1.5),
                ),
                Align(
                    alignment: Alignment.topRight,
                    child: Image.asset("assets/images/login_top_right.png",
                        scale: 1))
              ],
            ),
          ),
          Container(
            width: w,
            height: 0.42 * h,
            color: Colors.white,
            margin: const EdgeInsets.only(left: 20, right: 20),
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text("Buat Akun Baru",
                      style: GoogleFonts.lato(
                          textStyle: TextStyle(
                              fontSize: 26,
                              fontWeight: FontWeight.bold,
                              color: Color.fromARGB(1000, 134, 22, 87)))),
                  SizedBox(
                    height: 4,
                  ),
                  Text("Buat akun menggunakan email",
                      style: GoogleFonts.lato(
                          textStyle: TextStyle(
                              fontSize: 18, color: Colors.grey[500]))),
                  SizedBox(
                    height: 50,
                  ),
                  Align(
                      alignment: Alignment.topLeft,
                      child: Text(
                        "Email",
                        style: GoogleFonts.lato(
                            textStyle: TextStyle(
                                fontSize: 16,
                                color: Color.fromARGB(1000, 18, 18, 18)),
                            fontWeight: FontWeight.bold),
                      )),
                  SizedBox(
                    height: 5,
                  ),
                  Container(
                    width: w,
                    height: 55,
                    decoration: BoxDecoration(
                        color: Color.fromARGB(1000, 241, 241, 241),
                        borderRadius: BorderRadius.circular(12)),
                    child: TextField(
                      controller: emailController,
                      decoration: InputDecoration(
                          focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(12),
                              borderSide: BorderSide(
                                  color: Color.fromARGB(1000, 18, 18, 18),
                                  width: 1.5)),
                          enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(12),
                              borderSide:
                                  BorderSide(color: Colors.white, width: 1.0)),
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(12))),
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Align(
                      alignment: Alignment.topLeft,
                      child: Text(
                        "Password",
                        style: GoogleFonts.lato(
                            textStyle: TextStyle(
                                fontSize: 16,
                                color: Color.fromARGB(1000, 18, 18, 18)),
                            fontWeight: FontWeight.bold),
                      )),
                  SizedBox(
                    height: 5,
                  ),
                  Container(
                    width: w,
                    height: 55,
                    decoration: BoxDecoration(
                        color: Color.fromARGB(1000, 241, 241, 241),
                        borderRadius: BorderRadius.circular(12)),
                    child: TextField(
                      controller: passwordController,
                      obscureText: true,
                      decoration: InputDecoration(
                          focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(12),
                              borderSide: BorderSide(
                                  color: Color.fromARGB(1000, 18, 18, 18),
                                  width: 1.5)),
                          enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(12),
                              borderSide:
                                  BorderSide(color: Colors.white, width: 1.0)),
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(12))),
                    ),
                  )
                ]),
          ),
          SizedBox(
            height: 10,
          ),
          GestureDetector(
            onTap: () {
              AuthController.instance
                  .register(emailController.text, passwordController.text);
            },
            child: Container(
              width: w,
              height: 55,
              margin: const EdgeInsets.only(left: 20, right: 20),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  gradient: LinearGradient(
                      begin: Alignment.bottomLeft,
                      end: Alignment.topRight,
                      colors: [
                        Color.fromARGB(1000, 134, 22, 87),
                        Color.fromARGB(1000, 193, 31, 126)
                      ])),
              child: Center(
                child: Text("Buat Akun",
                    style: GoogleFonts.lato(
                        textStyle: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                        color: Colors.white)),
              ),
            ),
          ),
          SizedBox(height: 20),
          Container(
            width: w,
            height: 0.1 * h,
            margin: const EdgeInsets.only(left: 20, right: 20),
            color: Colors.white,
            child: Align(
              alignment: Alignment.topCenter,
              child: Column(children: [
                Text(
                  "--------- atau buat akun melalui ---------",
                  style: GoogleFonts.lato(
                      fontSize: 16, color: Color.fromARGB(1000, 170, 170, 170)),
                ),
                SizedBox(height: 5),
                GestureDetector(
                  onTap: () {
                    //AuthController.instance.signInAndLogInWithGoogle();
                  },
                  child: Container(
                      height: 37,
                      width: 135,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(12),
                          boxShadow: [
                            BoxShadow(
                                color: Colors.grey.withOpacity(0.5),
                                spreadRadius: 1,
                                blurRadius: 1,
                                offset: Offset(0, 1))
                          ]),
                      child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Image.asset("assets/icons/logo_google.png"),
                            Text(
                              "Google",
                              style: GoogleFonts.lato(
                                  textStyle: TextStyle(
                                      fontSize: 18,
                                      color: Color.fromARGB(1000, 18, 18, 18),
                                      fontWeight: FontWeight.bold)),
                            )
                          ])),
                ),
              ]),
            ),
          ),
          SizedBox(height: 10),
          RichText(
              text: TextSpan(
                  text: "Sudah memiliki akun?",
                  style: GoogleFonts.lato(
                      color: Color.fromARGB(1000, 170, 170, 170), fontSize: 16),
                  children: [
                TextSpan(
                  recognizer: TapGestureRecognizer()..onTap = () => Get.back(),
                  text: " Masuk",
                  style: GoogleFonts.lato(
                      textStyle: TextStyle(
                          color: Color.fromARGB(1000, 4, 167, 119),
                          fontSize: 16,
                          fontWeight: FontWeight.bold)),
                )
              ])),
          Container(
            height: 0.125 * h,
            color: Colors.white,
            child: Align(
              alignment: Alignment.bottomLeft,
              child: Image.asset("assets/images/login_bottom_left.png"),
            ),
          )
        ]));
  }
}
