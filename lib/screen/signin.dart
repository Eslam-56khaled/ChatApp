import 'package:chat_fire/constant/constant.dart';
import 'package:chat_fire/screen/chat.dart';
import 'package:chat_fire/screen/signup.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

class Sign_in extends StatefulWidget {
  static String id = "Sign_in";
  Sign_in({super.key});

  @override
  State<Sign_in> createState() => _Sign_inState();
}

class _Sign_inState extends State<Sign_in> {
  GlobalKey<FormState> _globalKey = GlobalKey();

  bool isload = false;

  String? email, pass;

  @override
  Widget build(BuildContext context) {
    return ModalProgressHUD(
      inAsyncCall: isload,
      child: Scaffold(
        backgroundColor: kprimarycolor,
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Center(
              child: Form(
                key: _globalKey,
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
                          "Sign in",
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
                        pass = p0;
                      },
                      text: "Password",
                      op: true,
                    ),
                    SizedBox(
                      height: 32,
                    ),
                    custom_button(
                      ontap: () async {
                        if (_globalKey.currentState!.validate()) {
                          setState(() {
                            isload = true;
                          });
                          try {
                            await signin_method();
                            Navigator.pushNamed(context, ChatPage.id,
                                arguments: email);
                          } on FirebaseAuthException catch (e) {
                            if (e.code == 'user-not-found') {
                              show_snackbar(context, "user-not-found");
                            } else if (e.code == 'wrong-password') {
                              show_snackbar(context,
                                  "Wrong password provided for that user.");
                            }
                          } catch (e) {
                            show_snackbar(context, "error");
                          }
                          setState(() {
                            isload = false;
                          });
                        }
                      },
                      text: "Sign in",
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Don't Have an account",
                          style: TextStyle(color: Colors.white),
                        ),
                        TextButton(
                            onPressed: () {
                              Navigator.of(context).pushNamed(Sign_up.id);
                            },
                            child: Text(
                              "Sign up",
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

  Future<void> signin_method() async {
    final credential = await FirebaseAuth.instance
        .signInWithEmailAndPassword(email: email!, password: pass!);
  }
}
