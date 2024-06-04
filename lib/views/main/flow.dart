import 'dart:developer' as devtools show log;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:coindcx/constant/info.dart';
import 'package:coindcx/constant/routes.dart';
import 'package:coindcx/service/api_call.dart';
import 'package:coindcx/views/main/test.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../home/profile.dart';

class Structure extends StatefulWidget {
  const Structure({super.key});

  @override
  State<Structure> createState() => _StructureState();
}

class _StructureState extends State<Structure> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: FutureBuilder(
        future: dataCall(),
        builder: (context, AsyncSnapshot snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [CircularProgressIndicator(), Text("Loading...")],
              ),
            );
          }
          if (snapshot.connectionState == ConnectionState.none) {
            devtools.log("No connection\n Refresh");
            return const Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CircularProgressIndicator(),
                  Text("No connection\n Refresh")
                ],
              ),
            );
          }
          if (snapshot.hasError) {
            devtools.log('Error: ${snapshot.error}');
            return Center(
                child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const CircularProgressIndicator(
                  backgroundColor: Colors.white,
                ),
                const SizedBox(
                  height: 20,
                ),
                Text(
                  "Error: ${snapshot.error} \n   Try again after Few minutes",
                  style: const TextStyle(
                    fontSize: 14,
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                ElevatedButton(
                    onPressed: () async {
                      await FirebaseAuth.instance.signOut();
                      if (mounted) {
                        Navigator.pushNamed(context, loginRoute);
                      }
                    },
                    child: const Text('Back to Login/ Logout')),
              ],
            ));
          }
          if (snapshot.connectionState == ConnectionState.done) {
            devtools.log("Done");
            if (snapshot.hasData && snapshot.data != null) {
              devtools.log("100000\n10000");
              Apkdata.list = snapshot.data!;
              Apkdata.filteredList = snapshot.data!;
              return Scaffold(
                body: SafeArea(
                  child: StreamBuilder(
                      stream: FirebaseFirestore.instance
                          .collection("users")
                          .doc(auth.currentUser?.uid)
                          .snapshots(),
                      builder: (context, snapshot) {
                        if (snapshot.hasError) {
                          return Text('Error: ${snapshot.error}');
                        }
                        if (snapshot.connectionState ==
                            ConnectionState.waiting) {
                          return const Center(
                            child: Column(
                              children: [
                                CircularProgressIndicator(),
                                Text('Loading...'),
                              ],
                            ),
                          );
                        }
                        if (snapshot.hasData && snapshot.data != null) {
                          devtools.log(snapshot.data!['name'].toString());
                          devtools.log(snapshot.data!['image_url'].toString());
                          // devtools.log(snapshot.data.);
                          devtools.log(1234.toString());
                          return Testpage(
                            userImage: snapshot.data!['image_url'].toString(),
                            userName: snapshot.data!['name'].toString(),
                          );
                        }
                        return const Text('No user data found.');
                      }),
                ),
              );
            } else {
              devtools.log("No data");
              return const Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [CircularProgressIndicator(), Text("No data")],
                ),
              );
            }
          }
          devtools.log("Default");
          return const Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [CircularProgressIndicator(), Text("Default")],
          );
        },
      ),
    );
  }
}
