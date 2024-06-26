import 'package:coindcx/constant/routes.dart';
import 'package:coindcx/firebase_options.dart';
import 'package:coindcx/views/home/info_page.dart';
import 'package:coindcx/views/home/setting.dart';
import 'package:coindcx/views/home/spash.dart';
import 'package:coindcx/views/login/forgot.dart';
import 'package:coindcx/views/login/login_screen.dart';
import 'package:coindcx/views/login/option_page.dart';
import 'package:coindcx/views/login/register.dart';
import 'package:coindcx/views/login/verify.dart';
import 'package:coindcx/views/main/flow.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'views/home/homepage.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Coindcx',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      routes: {
        homeRoute: (context) => const MyHomePage(),
        startRoute: (context) => const Startingpage(),
        loginRoute: (context) => const Loginpage(),
        registerRoute: (context) => const Registerpage(),
        verifyRoute: (context) => const Verify(),
        forgotRoute: (context) => const ForgetPassword(),
        settingRoute: (context) => const Settingpage(),
        structureRoute: (context) => const Structure(),
        infoRoute: (context) => const InfoPage(),
      },
      home: const Initialize(),
    );
  }
}

class Initialize extends StatefulWidget {
  const Initialize({super.key});

  @override
  State<Initialize> createState() => _InitializeState();
}

class _InitializeState extends State<Initialize> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder(
        future: Firebase.initializeApp(
          options: DefaultFirebaseOptions.currentPlatform,
        ),
        builder: (context, snapshot) {
          switch (snapshot.connectionState) {
            case ConnectionState.done:
              final user = FirebaseAuth.instance.currentUser;
              if (user != null) {
                if (user.emailVerified) {
                  return const Structure();
                } else {
                  return const Loginpage();
                }
              } else {
                return const Splash();
              }
            default:
              return const CircularProgressIndicator();
          }
        },
      ),
    );
  }
}
