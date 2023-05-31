import 'dart:math';

import 'package:coindcx/constant/routes.dart';
import 'package:flutter/material.dart';
import '../../service/api_call.dart';

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
      backgroundColor: const Color.fromARGB(255, 56, 41, 196),
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Row(
          children: [
            IconButton(
                onPressed: () async {
                  // Navigator.of(context).pushNamed(settingRoute);
                },
                icon: const Icon(
                  Icons.panorama_fish_eye_outlined,
                  color: Color.fromARGB(255, 56, 41, 196),
                )),
            const Text(
              "Hello Keshav",
              style: TextStyle(
                  color: Color.fromARGB(255, 56, 41, 196), fontSize: 17),
            ),
          ],
        ),
        backgroundColor: const Color.fromARGB(255, 255, 255, 255),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            // crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: Image.asset("assets/st1.jpeg"),
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
                        Container(
                          // height: 500,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              IconButton(
                                  onPressed: () {},
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
                        ),
                        Container(
                          // height: 500,
                          child: Column(
                            children: [
                              IconButton(
                                  onPressed: () {},
                                  icon: const Icon(
                                      Icons.shopping_basket_rounded)),
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
                        ),
                        Container(
                          // height: 500,
                          child: Column(
                            children: [
                              IconButton(
                                  onPressed: () {},
                                  icon: const Icon(Icons.group)),
                              const Text(
                                "Get 50% ",
                                style: TextStyle(fontSize: 14),
                              ),
                              const Text(
                                "Commission ",
                                style: TextStyle(fontSize: 14),
                              ),
                            ],
                          ),
                        ),
                        Container(
                          // height: 500,
                          child: Column(
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
                          return Padding(
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
                                color: Colors.grey[300],
                                borderRadius: BorderRadius.circular(16),
                              ),
                              child: Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Text(
                                    "${cachedCryptoList[0][index]["name"]}",
                                    style: const TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                  Image.network(
                                      "${cachedCryptoList[0][index]["image"]}",
                                      height: 55),
                                ],
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
}
