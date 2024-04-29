import 'package:chat_fire/firebase_options.dart';
import 'package:chat_fire/screen/chat.dart';
import 'package:chat_fire/screen/signin.dart';
import 'package:chat_fire/screen/signup.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {
        ChatPage.id: (context) => ChatPage(),
        Sign_in.id: (context) => Sign_in(),
        Sign_up.id: (context) => Sign_up()
      },
      title: 'Flutter Demo',
      initialRoute: Sign_in.id,
    );
  }
}
