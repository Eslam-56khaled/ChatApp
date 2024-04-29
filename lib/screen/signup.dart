import 'package:chat_fire/constant/constant.dart';
import 'package:chat_fire/screen/signin.dart';
import 'package:chat_fire/screen/signup.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:awesome_snackbar_content/awesome_snackbar_content.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

class Sign_up extends StatefulWidget {
  Sign_up({super.key});
  static String id = "Sign_up";

  @override
  State<Sign_up> createState() => _Sign_upState();
}

class _Sign_upState extends State<Sign_up> {
  bool isloading = false;

  GlobalKey<FormState> keys = GlobalKey();

  String? email, password;

  @override
  Widget build(BuildContext context) {
    return ModalProgressHUD(
      inAsyncCall: isloading,
      child: Scaffold(
        backgroundColor: kprimarycolor,
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Center(
              child: Form(
                key: keys,
                child: Column(
                  children: [
                    SizedBox(
                      height: 160,
                    ),
                    Image.asset("assets/images/scholar.png"),
                    Text(
                      "Scholar Chat",
                      style: TextStyle(
                          fontSize: 32,
                          color: Colors.white,
                          fontFamily: "pacifico"),
                    ),
                    SizedBox(
                      height: 50,
                    ),
                    const Row(
                      children: [
                        Text(
                          "Register",
                          style: TextStyle(fontSize: 32, color: Colors.white),
                        )
                      ],
                    ),
                    const SizedBox(
                      height: 16,
                    ),
                    custom_text_form_field(
                      onchaged: (p0) {
                        email = p0;
                      },
                      op: false,
                      text: "Email",
                    ),
                    SizedBox(
                      height: 16,
                    ),
                    custom_text_form_field(
                      onchaged: (p0) {
                        password = p0;
                      },
                      text: "Password",
                      op: true,
                    ),
                    SizedBox(
                      height: 32,
                    ),
                    custom_button(
                      ontap: () async {
                        if (keys.currentState!.validate()) {
                          setState(() {
                            isloading = true;
                          });
                          try {
                            await register();
                            show_snackbar(context, "register successful");
                            Navigator.pop(context);
                          } on FirebaseAuthException catch (e) {
                            if (e.code == 'weak-password') {
                              show_snackbar(context,
                                  "The password provided is too weak.");
                            } else if (e.code == 'email-already-in-use') {
                              show_snackbar(context,
                                  "The account already exists for that email.");
                            }
                          } catch (e) {
                            show_snackbar(context, "error");
                          }
                          setState(() {
                            isloading = false;
                          });
                        }
                      },
                      text: "Register",
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Already  Have an account",
                          style: TextStyle(color: Colors.white),
                        ),
                        TextButton(
                            onPressed: () {
                              Navigator.pop(context);
                            },
                            child: Text(
                              "Sign In",
                              style:
                                  TextStyle(fontSize: 16, color: Colors.white),
                            ))
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Future<void> register() async {
    final credential =
        await FirebaseAuth.instance.createUserWithEmailAndPassword(
      email: email!,
      password: password!,
    );
  }
}
