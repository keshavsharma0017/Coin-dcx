import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:coindcx/constant/info.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import '../../constant/routes.dart';

final FirebaseAuth auth = FirebaseAuth.instance;
String? aUrl;

class Profilepage extends StatefulWidget {
  const Profilepage({super.key});

  @override
  State<Profilepage> createState() => _ProfilepageState();
}

class _ProfilepageState extends State<Profilepage> {
  bool loading = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: SingleChildScrollView(
        child: StreamBuilder(
          stream: FirebaseFirestore.instance
              .collection('users')
              .doc(auth.currentUser!.uid)
              .snapshots(),
          builder: (BuildContext context, AsyncSnapshot snapshot) {
            if (snapshot.hasError) {
              return Text('Error: ${snapshot.error}');
            }
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(child: Text('Loading...'));
            }
            if (snapshot.hasData && snapshot.data != null) {
              return Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: [
                    const SizedBox(
                      height: 180,
                      child: Center(child: Text("Image")),
                    ),
                    // Padding(
                    //   padding: const EdgeInsets.fromLTRB(
                    //     8.0,
                    //     32.0,
                    //     8.0,
                    //     0.0,
                    //   ),
                    //   child: loading
                    //       ? const SizedBox(
                    //           height: 180,
                    //           child: Center(
                    //             child: CircularProgressIndicator(),
                    //           ),
                    //         )
                    //       : Center(
                    //           child: CircleAvatar(
                    //           radius: 90,
                    //           backgroundImage: NetworkImage(
                    //             Apkdata.pimage,
                    //           ),
                    //         )),
                    // ),
                    //NAME
                    Container(
                      height: MediaQuery.of(context).size.height * 0.1,
                      decoration: const BoxDecoration(
                        border: Border(bottom: BorderSide(color: Colors.grey)),
                      ),
                      child: Center(
                        child: Text(
                          "Hey , ${Apkdata.pname}",
                          style: const TextStyle(
                              fontSize: 27, fontWeight: FontWeight.w500),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    //LIST OF OPTIONS
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.5,
                      child: ListView.builder(
                        itemCount: _list.length,
                        itemBuilder: (context, index) {
                          return ListTile(
                            contentPadding: EdgeInsets.all(
                                MediaQuery.of(context).size.height * 0.01),
                            onTap: () async {
                              if (index == 3) {
                                FirebaseAuth.instance.signOut();
                                setState(() {
                                  Apkdata.pimage = Apkdata.pname = '';
                                  Apkdata.temppimage = Apkdata.pname = '';
                                });
                                Navigator.pushNamedAndRemoveUntil(
                                  context,
                                  startRoute,
                                  (route) => false,
                                );
                              }
                              // if (index == 1) {
                              //   await pickImage();
                              //   setState(() {
                              //     loading = true;
                              //   });
                              //   var url = await uploadImageToStorage();

                              //   await FirebaseFirestore.instance
                              //       .collection('users')
                              //       .doc(auth.currentUser!.uid)
                              //       .update({'image_url': url});
                              //   setState(
                              //     () {
                              //       if (url != null) {
                              //         Apkdata.pimage = url.toString();
                              //         Apkdata.temppimage = url.toString();
                              //         loading = false;
                              //       } else {
                              //         Apkdata.pimage = "";
                              //         loading = false;
                              //       }
                              //     },
                              //   );
                              // }
                            },
                            title: Center(
                                child: Text(
                              _list[index],
                              style: const TextStyle(
                                  fontSize: 18, color: Colors.blue),
                            )),
                          );
                        },
                      ),
                    ),
                  ],
                ),
              );
            }
            return const Text('No user data found.');
          },
        ),
      )),
    );
  }
}

List<String> _list = ["Account", "Add/Update Pics", "Settings", "Logout"];
