import 'package:coindcx/constant/routes.dart';
import 'package:flutter/material.dart';

class Verify extends StatefulWidget {
  const Verify({super.key});

  @override
  State<Verify> createState() => _VerifyState();
}

class _VerifyState extends State<Verify> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        iconTheme: const IconThemeData(color: Colors.black),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.fromLTRB(
              20.0,
              30.0,
              20.0,
              20.0,
            ),
            child: Column(
              children: [
                SizedBox(
                  height: MediaQuery.of(context).size.height - 220,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: const [
                      Text(
                        "Check Your Email in Spam",
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      Text(
                        "and verify",
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      SizedBox(
                        height: 50,
                      ),
                      Center(
                        child: Text(
                          "Didn't receive mail? wait for sometime",
                          style: TextStyle(
                            fontSize: 15,
                            color: Colors.grey,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Padding(
                      padding: EdgeInsets.only(bottom: 15.0),
                      child: Text(
                        "Never share your OTP with anyone",
                        style: TextStyle(
                          fontSize: 13,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ),
                    ElevatedButton(
                        onPressed: () async {
                          Navigator.of(context).pushNamedAndRemoveUntil(
                              startRoute, (route) => false);
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.white,
                          elevation: 0,
                          side: const BorderSide(
                              color: Color.fromARGB(255, 41, 85, 196)),
                          minimumSize:
                              Size(MediaQuery.of(context).size.width, 48),
                        ),
                        child: const Text(
                          "Login again",
                          style: TextStyle(
                              color: Color.fromARGB(255, 41, 85, 196)),
                        ))
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
