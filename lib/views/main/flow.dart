import 'dart:developer' as devtools show log;
import 'package:coindcx/constant/info.dart';
import 'package:coindcx/service/api_call.dart';
import 'package:coindcx/views/main/test.dart';
import 'package:flutter/material.dart';

class Structure extends StatefulWidget {
  const Structure({super.key});

  @override
  State<Structure> createState() => _StructureState();
}

class _StructureState extends State<Structure> {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: dataCall(),
      builder: (context, snapshot) {
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
              const CircularProgressIndicator(),
              Text("Error: ${snapshot.error}")
            ],
          ));
        }
        if (snapshot.connectionState == ConnectionState.done) {
          devtools.log("Done");
          if (snapshot.hasData && snapshot.data != null) {
            devtools.log("100000\n10000");
            Apkdata.list = snapshot.data!;
            Apkdata.filteredList = snapshot.data!;
            return const Scaffold(
              body: SafeArea(
                child: Testpage(),
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
    );
  }
}
