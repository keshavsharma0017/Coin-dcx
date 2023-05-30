import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../../constant/routes.dart';

class Profilepage extends StatefulWidget {
  const Profilepage({super.key});

  @override
  State<Profilepage> createState() => _ProfilepageState();
}

class _ProfilepageState extends State<Profilepage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.25,
              child: const Center(
                child: Text("Profile Image"),
              ),
            ),
            Container(
              height: MediaQuery.of(context).size.height * 0.1,
              decoration: const BoxDecoration(
                border: Border(bottom: BorderSide(color: Colors.grey)),
              ),
              child: const Center(
                child: Text(
                  "Keshav Sharma",
                  style: TextStyle(fontSize: 24),
                ),
              ),
            ),
            const SizedBox(
              height: 15,
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.5,
              child: ListView.builder(
                itemCount: _list.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    contentPadding: EdgeInsets.all(
                        MediaQuery.of(context).size.height * 0.01),
                    onTap: () {
                      if (index == 3) {
                        FirebaseAuth.instance.signOut();
                        Navigator.pushNamed(context, startRoute);
                      }
                    },
                    title: Center(
                        child: Text(
                      _list[index],
                      style: const TextStyle(fontSize: 18, color: Colors.blue),
                    )),
                  );
                },
              ),
            ),
          ],
        ),
      )),
    );
  }
}

List<String> _list = ["Account", "Information", "Settings", "Logout"];
