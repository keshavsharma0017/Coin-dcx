import 'dart:developer';
import 'package:coindcx/constant/pop_up.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class ForgetPassword extends StatefulWidget {
  const ForgetPassword({super.key});

  @override
  State<ForgetPassword> createState() => _ForgetPasswordState();
}

class _ForgetPasswordState extends State<ForgetPassword> {
  late final TextEditingController _emaill;

  @override
  void initState() {
    _emaill = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    _emaill.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        iconTheme: const IconThemeData(color: Colors.black),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Padding(
              padding: EdgeInsets.only(top: 8.0, bottom: 32),
              child: Text(
                "Reset Password",
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
            TextFormField(
              controller: _emaill,
              autocorrect: false,
              keyboardType: TextInputType.emailAddress,
              enableSuggestions: false,
              decoration: InputDecoration(
                contentPadding: const EdgeInsets.fromLTRB(12, 15.0, 12, 15.0),
                hintText: "Email address",
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(5),
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            ElevatedButton(
              onPressed: () async {
                try {
                  await FirebaseAuth.instance
                      .sendPasswordResetEmail(email: _emaill.toString());
                } on FirebaseAuthException catch (e) {
                  if (e.code == "invalid-email") {
                    Dialogbox().popup(context, "Invalid Email");
                    log("invaild email:${e.code}");
                  } else {
                    Dialogbox().popup(context, "Something went wrong");
                    log(e.code);
                  }
                }
              },
              style: ElevatedButton.styleFrom(
                  backgroundColor: const Color.fromARGB(255, 41, 85, 196),
                  minimumSize: Size(MediaQuery.of(context).size.width, 48)),
              child: const Text(
                "Send",
                style: TextStyle(fontSize: 15),
              ),
            )
          ],
        ),
      ),
    );
  }
}
