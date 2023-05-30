import 'package:flutter/material.dart';

class Dialogbox {
  void popup(context, msg) async {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text("Alert"),
          content: Text("$msg"),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: const Text("OK"),
            ),
          ],
        );
      },
    );
  }
}
