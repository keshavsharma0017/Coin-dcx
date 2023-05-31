import 'package:coindcx/constant/routes.dart';
import 'package:flutter/material.dart';

class Startingpage extends StatefulWidget {
  const Startingpage({super.key});

  @override
  State<Startingpage> createState() => _StartingpageState();
}

class _StartingpageState extends State<Startingpage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          color: Colors.white,
          child: Stack(
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                // mainAxisSize: MainAxisSize.max,
                children: [
                  Image.asset(
                    "assets/splash.png",
                    fit: BoxFit.cover,
                    width: double.infinity,
                    // height: MediaQuery.of(context).size.height / 2.5,
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                ],
              ),
              const Positioned(
                child: Center(
                  child: Text(
                    "Welcome to The \n CoinDCX App",
                    style: TextStyle(
                      fontWeight: FontWeight.w700,
                      fontSize: 30,
                    ),
                  ),
                ),
              ),
              Positioned(
                bottom: 0,
                child: Container(
                  decoration: const BoxDecoration(
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(20),
                      topRight: Radius.circular(20),
                    ),
                    color: Color(0xFF142142),
                  ),
                  height: MediaQuery.of(context).size.height / 6,
                  width: MediaQuery.of(context).size.width,
                  // height: 100,
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(12.0),
                        child: ElevatedButton(
                            onPressed: () {
                              Navigator.of(context).pushNamed(registerRoute);
                            },
                            style: ElevatedButton.styleFrom(
                                minimumSize: const Size(300, 50),
                                backgroundColor:
                                    const Color.fromARGB(255, 41, 83, 190)),
                            child: const Text("Create account for free")),
                      ),
                      TextButton(
                          onPressed: () {
                            Navigator.of(context).pushNamed(testRoute);
                          },
                          child: const Text(
                            "Log in",
                            style: TextStyle(
                              decoration: TextDecoration.underline,
                              color: Color.fromARGB(255, 41, 85, 196),
                            ),
                          ))
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}



