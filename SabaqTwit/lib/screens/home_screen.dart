import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:sabaqtwit/screens/account_screen.dart';
import 'package:sabaqtwit/screens/home.dart';
import 'package:sabaqtwit/screens/login_screen.dart';
import 'package:sabaqtwit/screens/no_content.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final user = FirebaseAuth.instance.currentUser;

    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: Center(
          child: (user == null)
              ? const NoContent()
              : const HomeDisplay(),
          //child: Text('Контент для НЕ зарегистрированных в системе'),
        ),
      ),
    );
  }
}