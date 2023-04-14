import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:sabaqtwit/screens/account_screen.dart';
import 'package:sabaqtwit/screens/home_screen.dart';
import 'package:sabaqtwit/screens/login_screen.dart';
import 'package:sabaqtwit/screens/reset_password_screen.dart';
import 'package:sabaqtwit/screens/signup_screen.dart';
import 'package:sabaqtwit/screens/verify_email_screen.dart';
import 'package:sabaqtwit/services/firebase_stream.dart';
import 'package:firebase_app_check/firebase_app_check.dart';

// Firebase Авторизация - Сценарии:
//    Войти - Почта / Пароль
//    Личный кабинет
//    Зарегистрироваться - Почта / Пароль два раза
//        Подтвердить почту - Отправить письмо снова / Отменить
//    Сбросить пароль - Почта

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        pageTransitionsTheme: const PageTransitionsTheme(builders: {
          TargetPlatform.android: CupertinoPageTransitionsBuilder(),
        }),
      ),
      routes: {
        '/': (context) => const FirebaseStream(),
        '/home': (context) => const HomeScreen(),
        '/account': (context) => const AccountScreen(),
        '/login': (context) => const LoginScreen(),
        '/signup': (context) => const SignUpScreen(),
        '/reset_password': (context) => const ResetPasswordScreen(),
        '/verify_email': (context) => const VerifyEmailScreen(),
      },
      initialRoute: '/',
    );
  }
}

// final user = FirebaseAuth.instance.currentUser;