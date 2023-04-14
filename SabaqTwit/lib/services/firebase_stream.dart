import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:sabaqtwit/screens/bottom_nav.dart';
import 'package:sabaqtwit/screens/home_screen.dart';
import 'package:sabaqtwit/screens/verify_email_screen.dart';
import 'package:firebase_app_check/firebase_app_check.dart';

class FirebaseStream extends StatelessWidget {
  const FirebaseStream({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return StreamBuilder<User?>(
      stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context, snapshot) {
        if (snapshot.hasError) {
          return const Scaffold(
            body: Center(child: Text('Что то пошло не так!'),),);
        } else if (snapshot.hasData) {
          if (!snapshot.data!.emailVerified) {
            return const VerifyEmailScreen();
          }
          return const MyStatefulWidget();
        } else {
          return const MyStatefulWidget();
        }
      }
    );
  }
}
