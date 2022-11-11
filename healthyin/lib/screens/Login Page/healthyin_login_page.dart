import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:healthyin/screens/Signup%20Page/healthyin_signup_page.dart';
import 'package:healthyin/controller/auth_controller.dart';

class HealthyInLoginScreen extends StatefulWidget {
  const HealthyInLoginScreen({super.key});

  @override
  State<HealthyInLoginScreen> createState() => _HealthyInLoginScreenState();
}

class _HealthyInLoginScreenState extends State<HealthyInLoginScreen> {
  var emailController = TextEditingController();
  var passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    double w = MediaQuery.of(context).size.width;
    double h = MediaQuery.of(context).size.height;

    return Scaffold(
        resizeToAvoidBottomInset: false,
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
            height: 0.5 * h,
            color: Colors.white,
            margin: const EdgeInsets.only(left: 20, right: 20),
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text("Selamat Datang Kembali",
                      style: GoogleFonts.lato(
                          textStyle: const TextStyle(
                              fontSize: 26,
                              fontWeight: FontWeight.bold,
                              color: Color.fromARGB(1000, 134, 22, 87)))),
                  const SizedBox(
                    height: 4,
                  ),
                  Text("Gunakan akun Anda untuk masuk",
                      style: GoogleFonts.lato(
                          textStyle: TextStyle(
                              fontSize: 18, color: Colors.grey[500]))),
                  const SizedBox(
                    height: 50,
                  ),
                  Align(
                      alignment: Alignment.topLeft,
                      child: Text(
                        "Email",
                        style: GoogleFonts.lato(
                            textStyle: const TextStyle(
                                fontSize: 16,
                                color: Color.fromARGB(1000, 18, 18, 18)),
                            fontWeight: FontWeight.bold),
                      )),
                  const SizedBox(
                    height: 5,
                  ),
                  Container(
                    width: w,
                    height: 55,
                    decoration: BoxDecoration(
                        color: const Color.fromARGB(1000, 241, 241, 241),
                        borderRadius: BorderRadius.circular(12)),
                    child: TextField(
                      controller: emailController,
                      decoration: InputDecoration(
                          focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(12),
                              borderSide: const BorderSide(
                                  color: Color.fromARGB(1000, 18, 18, 18),
                                  width: 1.5)),
                          enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(12),
                              borderSide: const BorderSide(
                                  color: Colors.white, width: 1.0)),
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(12))),
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Align(
                      alignment: Alignment.topLeft,
                      child: Text(
                        "Password",
                        style: GoogleFonts.lato(
                            textStyle: const TextStyle(
                                fontSize: 16,
                                color: Color.fromARGB(1000, 18, 18, 18)),
                            fontWeight: FontWeight.bold),
                      )),
                  const SizedBox(
                    height: 5,
                  ),
                  Container(
                    width: w,
                    height: 55,
                    decoration: BoxDecoration(
                        color: const Color.fromARGB(1000, 241, 241, 241),
                        borderRadius: BorderRadius.circular(12)),
                    child: TextField(
                      controller: passwordController,
                      obscureText: true,
                      decoration: InputDecoration(
                          focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(12),
                              borderSide: const BorderSide(
                                  color: Color.fromARGB(1000, 18, 18, 18),
                                  width: 1.5)),
                          enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(12),
                              borderSide: const BorderSide(
                                  color: Colors.white, width: 1.0)),
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(12))),
                    ),
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: Container(),
                      ),
                      Text("Lupa Kata Sandi?",
                          style: GoogleFonts.lato(
                              textStyle: const TextStyle(
                                  fontSize: 16,
                                  color: Color.fromARGB(1000, 4, 167, 119)),
                              fontWeight: FontWeight.bold))
                    ],
                  )
                ]),
          ),
          const SizedBox(
            height: 10,
          ),
          GestureDetector(
            onTap: () {
              AuthController.instance.login(
                  emailController.text.trim(), passwordController.text.trim());
            },
            child: Container(
              width: w,
              height: 55,
              margin: const EdgeInsets.only(left: 20, right: 20),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  gradient: const LinearGradient(
                      begin: Alignment.bottomLeft,
                      end: Alignment.topRight,
                      colors: [
                        Color.fromARGB(1000, 134, 22, 87),
                        Color.fromARGB(1000, 193, 31, 126)
                      ])),
              child: Center(
                child: Text("Masuk",
                    style: GoogleFonts.lato(
                        textStyle: const TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                        color: Colors.white)),
              ),
            ),
          ),
          /*const SizedBox(height: 20),
                  Container(
            width: w,
            height: 0.1 * h,
            margin: const EdgeInsets.only(left: 20, right: 20),
            color: Colors.white,
            child: Align(
              alignment: Alignment.topCenter,
              child: Column(children: [
                Text(
                  "--------- atau masuk masuk melalui ---------",
                  style: GoogleFonts.lato(
                      fontSize: 16,
                      color: const Color.fromARGB(1000, 170, 170, 170)),
                ),
                const SizedBox(height: 5),
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
                                offset: const Offset(0, 1))
                          ]),
                      child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Image.asset("assets/icons/logo_google.png"),
                            Text(
                              "Google",
                              style: GoogleFonts.lato(
                                  textStyle: const TextStyle(
                                      fontSize: 18,
                                      color: Color.fromARGB(1000, 18, 18, 18),
                                      fontWeight: FontWeight.bold)),
                            )
                          ])),
                ),
              ]),
            ),
          )*/
          const SizedBox(height: 10),
          RichText(
              text: TextSpan(
                  text: "Belum memiliki akun?",
                  style: GoogleFonts.lato(
                      color: const Color.fromARGB(1000, 170, 170, 170),
                      fontSize: 16),
                  children: [
                TextSpan(
                    text: " Buat akun sekarang",
                    style: GoogleFonts.lato(
                        textStyle: const TextStyle(
                            color: Color.fromARGB(1000, 4, 167, 119),
                            fontSize: 16,
                            fontWeight: FontWeight.bold)),
                    recognizer: TapGestureRecognizer()
                      ..onTap = () => Get.to(
                          () => const HealthyInSignupScreen(),
                          transition: Transition.zoom))
              ])),
          const SizedBox(height: 30),
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

/*
More improvement:
- How to make code less repetition?
- Handle google sign-in
 */
