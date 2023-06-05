import 'dart:math';
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
        if (snapshot.hasError) {
          return const Center(child: Text('Error Occured\nTry After Sometime'));
        }
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
        if (snapshot.hasData && snapshot.data != null) {
          devtools.log("100000\n10000");
          Apkdata.list = snapshot.data!;
          return const Scaffold(
            body: SafeArea(
              child: Testpage(),
            ),
          );
        }
        return const CircularProgressIndicator();
      },
    );
  }
}
