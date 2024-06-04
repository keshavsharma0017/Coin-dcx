import 'dart:developer' as devtools show log;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:coindcx/constant/pop_up.dart';
import 'package:coindcx/constant/routes.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import '../../constant/info.dart';

String? _url;

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
  bool loading = false;
  bool loadingdone = false;

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
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Padding(
                padding: EdgeInsets.only(bottom: 8.0, top: 8),
                child: Text(
                  "Create an account",
                  style: TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: 22,
                  ),
                ),
              ),
              // loading
              //     ? const Center(
              //         child: CircularProgressIndicator(),
              //       )
              //     : loadingdone
              //         ? Padding(
              //             padding: const EdgeInsets.all(16.0),
              //             child: Center(
              //               child: Container(
              //                 width: 100,
              //                 height: 100,
              //                 decoration: BoxDecoration(
              //                   shape: BoxShape.circle,
              //                   border: Border.all(
              //                     color: Colors.grey,
              //                   ),
              //                 ),
              //                 child: GestureDetector(
              //                   child: Image.network(_url!),
              //                   onTap: () async {
              //                     await pickImage();
              //                     setState(() {
              //                       loading = true;
              //                     });
              //                     _url = await uploadImageToStorage();
              //                     devtools.log(_url!);
              //                     devtools.log("7");
              //                     setState(() {
              //                       loading = false;
              //                       loadingdone = true;
              //                     });
              //                   },
              //                 ),
              //               ),
              //             ),
              //           )
              //         : Padding(
              //             padding: const EdgeInsets.all(16.0),
              //             child: Center(
              //               child: Container(
              //                 width: 100,
              //                 height: 100,
              //                 decoration: BoxDecoration(
              //                   shape: BoxShape.circle,
              //                   border: Border.all(
              //                     color: Colors.grey,
              //                   ),
              //                 ),
              //                 child: IconButton(
              //                   onPressed: () async {
              //                     await pickImage();
              //                     // final ImagePicker picker = await ImagePicker();
              //                     // final XFile? image = await picker.pickImage(source: ImageSource.gallery);
              //                     setState(() {
              //                       loading = true;
              //                     });
              //                     _url = await uploadImageToStorage();
              //                     devtools.log(_url!);
              //                     devtools.log("7");
              //                     setState(() {
              //                       loading = false;
              //                       loadingdone = true;
              //                     });
              //                   },
              //                   icon: const Icon(Icons.add_a_photo_outlined),
              //                 ),
              //               ),
              //             ),
              //           ),
              TextFormField(
                controller: _uname,
                autocorrect: false,
                enableSuggestions: false,
                decoration: InputDecoration(
                  contentPadding: const EdgeInsets.fromLTRB(12, 15.0, 12, 15.0),
                  hintText: "Full name",
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
                      _passwordVisible
                          ? Icons.visibility
                          : Icons.visibility_off,
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
              const Wrap(
                // direction: Axis.vertical,
                alignment: WrapAlignment.center,
                children: [
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
                  var uname = _uname.text;
                  devtools.log("$email,$password,$uname,$_url");

                  try {
                    setState(() {
                      loading = true;
                    });
                    UserCredential userCredential = await FirebaseAuth.instance
                        .createUserWithEmailAndPassword(
                            email: email, password: password);
                    FirebaseAuth.instance.currentUser?.sendEmailVerification();
                    User user = userCredential.user!;
                    await FirebaseFirestore.instance
                        .collection('users')
                        .doc(user.uid)
                        .set({
                      'name': uname,
                      'image_url': _url,
                    });
                    if (!mounted) return;
                    Navigator.pushNamedAndRemoveUntil(
                        context, verifyRoute, (route) => false);
                  } on FirebaseAuthException catch (e) {
                    setState(() {
                      loading = false;
                    });
                    if (e.code == "email-already-in-use") {
                      Dialogbox().popup(context, "Email Already Exists");
                      devtools.log("Email Already Exists");
                    } else if (e.code == "invalid-email") {
                      Dialogbox()
                          .popup(context, "Invalid email/format Not Correct");
                      devtools.log("Invalid email/format Not Correct");
                    } else if (e.code == "weak-password") {
                      Dialogbox().popup(context, "Weak Password");
                      devtools.log("Weak Password");
                    } else {
                      Dialogbox().popup(context, "Something went wrong");
                      devtools.log(e.code);
                    }
                  } catch (e) {
                    setState(() {
                      loading = false;
                    });
                    Dialogbox().popup(context, e.toString());
                    devtools.log(e.toString());
                  }
                },
                style: ElevatedButton.styleFrom(
                    backgroundColor: const Color.fromARGB(255, 41, 85, 196),
                    minimumSize: Size(MediaQuery.of(context).size.width, 48)),
                child: loading
                    ? const CircularProgressIndicator()
                    : const Text(
                        "Continue",
                        style: TextStyle(fontSize: 15, color: Colors.white),
                      ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
