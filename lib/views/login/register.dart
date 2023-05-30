import 'dart:developer';
import 'package:coindcx/constant/pop_up.dart';
import 'package:coindcx/constant/routes.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class Registerpage extends StatefulWidget {
  const Registerpage({super.key});

  @override
  State<Registerpage> createState() => _RegisterpageState();
}

class _RegisterpageState extends State<Registerpage> {
  late final TextEditingController _email;
  late final TextEditingController _uname;
  late final TextEditingController _password;
  late bool _passwordVisible;

  @override
  void initState() {
    _passwordVisible = false;
    _uname = TextEditingController();
    _email = TextEditingController();
    _password = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    _uname.dispose();
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
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Padding(
              padding: EdgeInsets.only(bottom: 32.0, top: 8),
              child: Text(
                "Create an account",
                style: TextStyle(
                  fontWeight: FontWeight.w500,
                  fontSize: 22,
                ),
              ),
            ),
            TextFormField(
              controller: _uname,
              autocorrect: false,
              enableSuggestions: false,
              decoration: InputDecoration(
                contentPadding: const EdgeInsets.fromLTRB(12, 15.0, 12, 15.0),
                hintText: "Full name (as per PAN)",
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(5),
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            TextFormField(
              controller: _email,
              autocorrect: false,
              keyboardType: TextInputType.emailAddress,
              enableSuggestions: false,
              decoration: InputDecoration(
                contentPadding: const EdgeInsets.fromLTRB(12, 15.0, 12, 15.0),
                hintText: "Email ID",
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
                    color: Colors.black,
                  ),
                ),
                contentPadding: const EdgeInsets.fromLTRB(12, 15.0, 12, 15.0),
                hintText: "Create password",
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(5),
                ),
              ),
            ),
            const SizedBox(
              height: 15,
            ),
            Wrap(
              // direction: Axis.vertical,
              alignment: WrapAlignment.center,
              children: const [
                Text(
                  "By proceeding , you agree to ",
                  style: TextStyle(
                    fontSize: 11,
                    color: Color.fromARGB(255, 110, 110, 110),
                  ),
                ),
                Text(
                  "Terms of Service ",
                  style: TextStyle(
                    fontSize: 11,
                    decoration: TextDecoration.underline,
                    color: Color.fromARGB(255, 110, 110, 110),
                  ),
                ),
                Text(
                  "and ",
                  style: TextStyle(
                    fontSize: 11,
                    color: Color.fromARGB(255, 110, 110, 110),
                  ),
                ),
                Text(
                  "Privacy Policy",
                  style: TextStyle(
                    fontSize: 11,
                    decoration: TextDecoration.underline,
                    color: Color.fromARGB(255, 110, 110, 110),
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 35,
            ),
            ElevatedButton(
              onPressed: () async {
                var email = _email.text;
                var password = _password.text;
                try {
                  await FirebaseAuth.instance.createUserWithEmailAndPassword(
                      email: email, password: password);
                  FirebaseAuth.instance.currentUser?.sendEmailVerification();
                  if (!mounted) return;
                  Navigator.pushNamedAndRemoveUntil(
                      context, verifyRoute, (route) => false);
                } on FirebaseAuthException catch (e) {
                  if (e.code == "email-already-in-use") {
                    Dialogbox().popup(context, "Email Already Exists");
                    log("Email Already Exists");
                  } else if (e.code == "invalid-email") {
                    Dialogbox()
                        .popup(context, "Invalid email/format Not Correct");
                    log("Invalid email/format Not Correct");
                  } else if (e.code == "weak-password") {
                    Dialogbox().popup(context, "Weak Password");
                    log("Weak Password");
                  } else {
                    Dialogbox().popup(context, "Something went wrong");
                    log(e.code);
                  }
                } catch (e) {
                  Dialogbox().popup(context, e.toString());
                  log(e.toString());
                }
              },
              style: ElevatedButton.styleFrom(
                  backgroundColor: const Color.fromARGB(255, 41, 85, 196),
                  minimumSize: Size(MediaQuery.of(context).size.width, 48)),
              child: const Text(
                "Continue",
                style: TextStyle(fontSize: 15),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
