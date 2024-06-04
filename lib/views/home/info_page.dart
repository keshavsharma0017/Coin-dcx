import 'dart:developer' as devtools show log;
import 'package:coindcx/constant/info.dart';
import 'package:flutter/material.dart';

class InfoPage extends StatefulWidget {
  const InfoPage({Key? key}) : super(key: key);

  @override
  State<InfoPage> createState() => _InfoPageState();
}

class _InfoPageState extends State<InfoPage> {
  @override
  Widget build(BuildContext context) {
    // devtools.log("${Apkdata.searchList}");
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text(
          "${Apkdata.searchList['name']}",
          style: const TextStyle(color: Colors.black),
        ),
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(
            Icons.arrow_back,
            color: Colors.black,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(30.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Image.network(
                "${Apkdata.searchList['image']}",
                height: MediaQuery.of(context).size.height / 6,
              ),
            ),
            Row(
              children: [
                const Text(
                  "Value:",
                  style: TextStyle(fontWeight: FontWeight.w600, fontSize: 16),
                ),
                Text(" ${Apkdata.searchList['current_price']}",
                    style: const TextStyle(fontSize: 16)),
              ],
            ),
            Row(
              children: [
                const Text("Total Volume:",
                    style:
                        TextStyle(fontWeight: FontWeight.w600, fontSize: 16)),
                Text(" ${Apkdata.searchList['total_volume']}",
                    style: const TextStyle(fontSize: 16)),
              ],
            ),
            Row(
              children: [
                Row(
                  children: [
                    const Text("High: ",
                        style: TextStyle(
                            fontWeight: FontWeight.w600, fontSize: 16)),
                    Text("${Apkdata.searchList['high_24h']} ",
                        style: const TextStyle(fontSize: 16)),
                  ],
                ),
                Row(
                  children: [
                    const Text("Low:",
                        style: TextStyle(
                            fontWeight: FontWeight.w600, fontSize: 16)),
                    Text(" ${Apkdata.searchList['low_24h']}",
                        style: const TextStyle(fontSize: 16)),
                  ],
                ),
              ],
            ),
            Row(
              children: [
                const Text("24 Hour Change:",
                    style:
                        TextStyle(fontWeight: FontWeight.w600, fontSize: 16)),
                Text(" ${Apkdata.searchList['price_change_24h']}",
                    style: const TextStyle(fontSize: 14)),
              ],
            ),
            Row(
              children: [
                const Text("Percent Up/down: ",
                    style:
                        TextStyle(fontWeight: FontWeight.w600, fontSize: 16)),
                Text("${Apkdata.searchList['price_change_percentage_24h']}",
                    style: const TextStyle(fontSize: 16)),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
