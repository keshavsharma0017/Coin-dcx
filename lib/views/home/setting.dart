import 'package:coindcx/constant/routes.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class Settingpage extends StatefulWidget {
  const Settingpage({super.key});

  @override
  State<Settingpage> createState() => _SettingpageState();
}

class _SettingpageState extends State<Settingpage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(color: Colors.black),
        backgroundColor: Colors.white,
        title: const Text(
          "Settings",
          style: TextStyle(color: Colors.black),
        ),
      ),
      body: SafeArea(
          child: Column(
        children: [
          Center(
            child: TextButton(
              onPressed: () async {
                // final user = FirebaseAuth.instance.currentUser;
                // print(user);
                await FirebaseAuth.instance.signOut();
                if (!mounted) {}
                Navigator.of(context)
                    .pushNamedAndRemoveUntil(startRoute, (route) => false);
              },
              child: const Text(
                "Logout",
                style: TextStyle(fontSize: 18),
              ),
            ),
          ),
        ],
      )),
    );
  }
}
