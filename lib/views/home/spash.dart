import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../../constant/routes.dart';

class Splash extends StatefulWidget {
  const Splash({super.key});

  @override
  State<Splash> createState() => SsplashState();
}

class SsplashState extends State<Splash> {
  @override
  void initState() {
    super.initState();
    timer();
  }

  var stream = startRoute;
  void timer() async {
    await Future.delayed(const Duration(milliseconds: 3000));
    final user = FirebaseAuth.instance.currentUser;
    if (user?.emailVerified ?? false) {
      setState(() {
        stream = homeRoute;
      });
    }
    if (!mounted) return;
    Navigator.of(context).pushNamedAndRemoveUntil(stream, (route) => false);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset("assets/splash.png"),
        ],
      )),
    );
  }
}
