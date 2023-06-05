import 'dart:developer';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:coindcx/constant/pop_up.dart';
import 'package:coindcx/constant/routes.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class Loginpage extends StatefulWidget {
  const Loginpage({super.key});

  @override
  State<Loginpage> createState() => LloginStatepage();
}

class LloginStatepage extends State<Loginpage> {
  late final TextEditingController _email;
  late final TextEditingController _password;
  late bool _passwordVisible;

  @override
  void initState() {
    _passwordVisible = false;

    _email = TextEditingController();
    _password = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    _email.dispose();
    _password.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(color: Colors.black),
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Padding(
              padding: EdgeInsets.only(bottom: 32.0, top: 8),
              child: Text(
                "Login to your account",
                style: TextStyle(
                  fontWeight: FontWeight.w500,
                  fontSize: 22,
                ),
              ),
            ),
            TextFormField(
              controller: _email,
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
            TextFormField(
              controller: _password,
              autocorrect: false,
              enableSuggestions: false,
              obscureText: !_passwordVisible,
              decoration: InputDecoration(
                suffixIcon: IconButton(
                  onPressed: () {
                    setState(() {
                      _passwordVisible = !_passwordVisible;
                    });
                  },
                  icon: Icon(
                    _passwordVisible ? Icons.visibility : Icons.visibility_off,
                    color: Theme.of(context).primaryColorDark,
                  ),
                ),
                contentPadding: const EdgeInsets.fromLTRB(12, 15.0, 12, 15.0),
                hintText: "Password",
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(5),
                ),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                TextButton(
                    onPressed: () async {
                      // var email = _email.toString();
                      // await FirebaseAuth.instance
                      //     .sendPasswordResetEmail(email: email);
                      // if (!mounted) return;
                      Navigator.pushNamed(context, forgotRoute);
                    },
                    child: const Text(
                      "Forgot Password",
                      style: TextStyle(color: Color.fromARGB(255, 41, 85, 196)),
                    ))
              ],
            ),
            const SizedBox(
              height: 10,
            ),
            ElevatedButton(
              onPressed: () async {
                try {
                  await FirebaseAuth.instance.signInWithEmailAndPassword(
                    email: _email.text,
                    password: _password.text,
                  );
                  User user = FirebaseAuth.instance.currentUser!;
                  await FirebaseFirestore.instance
                      .collection('users')
                      .doc(user.uid)
                      .get();
                  if (user.emailVerified != false) {
                    if (!mounted) return;
                    Navigator.pushNamedAndRemoveUntil(
                        context, structureRoute, (route) => false);
                  } else {
                    Dialogbox().popup(context, "Email not verified");
                  }
                } on FirebaseAuthException catch (e) {
                  if (e.code == "wrong-password") {
                    Dialogbox().popup(context, "password wrong");
                    log("password wrong");
                    log(" Error0 ${e.code}");
                  } else if (e.code == "user-not-found") {
                    Dialogbox().popup(context, "user hi nhi h");
                    log("Error1 ${e.code}");
                    log("user hi nhi h");
                  } else if (e.code == "invalid-email") {
                    Dialogbox().popup(context, "Email Format galat h");
                    log("Error2 ${e.code}");
                    log("Email Format Not Correct");
                  } else {
                    Dialogbox().popup(context, e.code);
                    log(e.code);
                  }
                } catch (e) {
                  Dialogbox().popup(context, e.toString());
                  log("Error2 $e");
                }
              },
              style: ElevatedButton.styleFrom(
                  backgroundColor: const Color.fromARGB(255, 41, 85, 196),
                  minimumSize: Size(MediaQuery.of(context).size.width, 48)),
              child: const Text(
                "Continue",
                style: TextStyle(fontSize: 15),
              ),
            )
          ],
        ),
      ),
    );
  }
}
