import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import '../../constant/info.dart';
import '../../constant/routes.dart';
import 'dart:developer' as devtools show log;

class MyHomePage extends StatefulWidget {
  const MyHomePage({
    super.key,
  });

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Row(
          children: [
            // CircleAvatar(
            //   radius: 20,
            //   backgroundImage: NetworkImage(
            //     Apkdata.temppimage.toString(),
            //   ),
            // ),
            const SizedBox(
              width: 10,
            ),
            Text(
              "Hello ${Apkdata.pname}",
              style: const TextStyle(
                  color: Color.fromARGB(255, 45, 121, 243), fontSize: 17),
            ),
          ],
        ),
        backgroundColor: const Color.fromARGB(255, 255, 255, 255),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              ClipOval(
                child: Image.asset(
                  "assets/st1.jpeg",
                ),
              ),
              Container(
                height: MediaQuery.of(context).size.height,
                decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(15),
                        topRight: Radius.circular(15))),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            IconButton(
                                onPressed: () {
                                  FirebaseAuth.instance.signOut();
                                  Navigator.of(context).pushNamed(startRoute);
                                },
                                icon: const Icon(Icons.monetization_on)),
                            const Text(
                              "Add Funds ",
                              style: TextStyle(fontSize: 14),
                            ),
                            const Text(
                              "\$0 ",
                              style: TextStyle(fontSize: 14),
                            )
                          ],
                        ),
                        Column(
                          children: [
                            IconButton(
                                onPressed: () {
                                  returnInfo();
                                },
                                icon:
                                    const Icon(Icons.shopping_basket_rounded)),
                            const Text(
                              "Instant",
                              style: TextStyle(fontSize: 14),
                            ),
                            const Text(
                              " Buy",
                              style: TextStyle(fontSize: 14),
                            )
                          ],
                        ),
                        Column(
                          children: [
                            IconButton(
                                onPressed: () {
                                  // Navigator.pushNamed(context, structureRoute);
                                },
                                icon: const Icon(Icons.group)),
                            const Text(
                              "Customer ",
                              style: TextStyle(fontSize: 14),
                            ),
                            const Text(
                              "Buy",
                              style: TextStyle(fontSize: 14),
                            ),
                          ],
                        ),
                        Column(
                          children: [
                            IconButton(
                                onPressed: () {},
                                icon: const Icon(Icons.auto_graph_rounded)),
                            const Text(
                              "Crypto ",
                              style: TextStyle(fontSize: 14),
                            ),
                            const Text(
                              "SIP",
                              style: TextStyle(fontSize: 14),
                            ),
                          ],
                        ),
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Text(
                        "Upnext",
                        style: TextStyle(color: Colors.grey[600], fontSize: 24),
                      ),
                    ),
                    SizedBox(
                      height: 150,
                      child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        physics: const BouncingScrollPhysics(),
                        itemCount: 10,
                        itemBuilder: (context, index) {
                          return GestureDetector(
                            onTap: () async {
                              // devtools.log("${Apkdata.list[0][index]}");
                              // devtools
                              //     .log("${Apkdata.list[0][index].runtimeType}");
                              setState(() {
                                Apkdata.searchList = Apkdata.list[0][index];
                              });
                              Navigator.pushNamed(context, infoRoute);
                            },
                            child: Padding(
                              padding: const EdgeInsets.only(
                                top: 5.0,
                                bottom: 10.0,
                                left: 5.0,
                                right: 5.0,
                              ),
                              child: Container(
                                width: 120,
                                decoration: BoxDecoration(
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.grey.shade400,
                                      blurRadius: 5,
                                      offset: const Offset(5, 5),
                                    ),
                                    const BoxShadow(
                                      color: Colors.white,
                                      blurRadius: 1,
                                      offset: Offset(-1, -1),
                                    ),
                                  ],
                                  color: Colors.lightBlue[50],
                                  borderRadius: BorderRadius.circular(16),
                                ),
                                child: Column(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Text(
                                      "${Apkdata.list[0][index]["name"]}",
                                      style: const TextStyle(
                                        fontSize: 14,
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ),
                                    Image.network(
                                        "${Apkdata.list[0][index]["image"]}",
                                        height: 55),
                                  ],
                                ),
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Text(
                        "On High Demand",
                        style: TextStyle(color: Colors.grey[600], fontSize: 24),
                      ),
                    ),
                    SizedBox(
                      height: 150,
                      child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        physics: const BouncingScrollPhysics(),
                        itemCount: 10,
                        itemBuilder: (context, index) {
                          index = index + 10;
                          return GestureDetector(
                            onTap: () async {
                              setState(() {
                                Apkdata.searchList = Apkdata.list[0][index];
                              });
                              Navigator.pushNamed(context, infoRoute);
                            },
                            child: Padding(
                              padding: const EdgeInsets.only(
                                top: 5.0,
                                bottom: 10.0,
                                left: 5.0,
                                right: 5.0,
                              ),
                              child: Container(
                                width: 120,
                                decoration: BoxDecoration(
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.grey.shade400,
                                      blurRadius: 5,
                                      offset: const Offset(5, 5),
                                    ),
                                    const BoxShadow(
                                      color: Colors.white,
                                      blurRadius: 1,
                                      offset: Offset(-1, -1),
                                    ),
                                  ],
                                  color: Colors.lightBlue[50],
                                  borderRadius: BorderRadius.circular(16),
                                ),
                                child: Column(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Text(
                                      "${Apkdata.list[0][index]["name"]}",
                                      style: const TextStyle(
                                        fontSize: 14,
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ),
                                    Image.network(
                                        "${Apkdata.list[0][index]["image"]}",
                                        height: 55),
                                  ],
                                ),
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Text(
                        "On low Demand",
                        style: TextStyle(color: Colors.grey[600], fontSize: 24),
                      ),
                    ),
                    SizedBox(
                      height: 150,
                      child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        physics: const BouncingScrollPhysics(),
                        itemCount: 10,
                        itemBuilder: (context, index) {
                          index = index + 20;
                          return GestureDetector(
                            onTap: () async {
                              // devtools.log("${Apkdata.list[0][index]}");
                              // devtools
                              //     .log("${Apkdata.list[0][index].runtimeType}");
                              setState(() {
                                Apkdata.searchList = Apkdata.list[0][index];
                              });
                              Navigator.pushNamed(context, infoRoute);
                            },
                            child: Padding(
                              padding: const EdgeInsets.only(
                                top: 5.0,
                                bottom: 10.0,
                                left: 5.0,
                                right: 5.0,
                              ),
                              child: Container(
                                width: 120,
                                decoration: BoxDecoration(
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.grey.shade400,
                                      blurRadius: 5,
                                      offset: const Offset(5, 5),
                                    ),
                                    const BoxShadow(
                                      color: Colors.white,
                                      blurRadius: 1,
                                      offset: Offset(-1, -1),
                                    ),
                                  ],
                                  color: Colors.lightBlue[50],
                                  borderRadius: BorderRadius.circular(16),
                                ),
                                child: Column(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Text(
                                      "${Apkdata.list[0][index]["name"]}",
                                      style: const TextStyle(
                                        fontSize: 14,
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ),
                                    Image.network(
                                        "${Apkdata.list[0][index]["image"]}",
                                        height: 55),
                                  ],
                                ),
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future<String> returnInfo() async {
    User user = FirebaseAuth.instance.currentUser!;
    DocumentSnapshot snapshot = await FirebaseFirestore.instance
        .collection('users')
        .doc(user.uid)
        .get();
    String username = snapshot.data().toString();
    devtools.log(username);
    return username;
  }
}
