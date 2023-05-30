import 'package:flutter/material.dart';
import '../../service/api_call.dart';

class Pricepage extends StatefulWidget {
  const Pricepage({super.key});

  @override
  State<Pricepage> createState() => _PricepageState();
}

class _PricepageState extends State<Pricepage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(
            0.0,
            32.0,
            0.0,
            8.0,
          ),
          child: Column(children: [
            Padding(
              padding:
                  const EdgeInsets.only(bottom: 8.0, left: 16.0, right: 16.0),
              child: Column(
                children: [
                  TextFormField(
                    onChanged: (val) {
                      setState(() {
                        search(val);
                      });
                    },
                    style: const TextStyle(
                        fontWeight: FontWeight.w500, fontSize: 18),
                    decoration: InputDecoration(
                      prefixIcon: const Icon(Icons.search),
                      // contentPadding: EdgeInsets.all(18),
                      label: const Text("Search"),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(16),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SearchList(count: _indexes),
          ]),
        ),
      )),
    );
  }
}

class SearchList extends StatelessWidget {
  final int count;
  const SearchList({super.key, required this.count});
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height - 150,
      child: FutureBuilder(
        future: dataCall(),
        builder: (context, snapshot) {
          switch (snapshot.connectionState) {
            case ConnectionState.done:
              return ListView.builder(
                physics: const BouncingScrollPhysics(),
                itemCount: count,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.only(
                      top: 4.0,
                      bottom: 4.0,
                      left: 8,
                      right: 8,
                    ),
                    child: Container(
                      height: 90,
                      width: MediaQuery.of(context).size.width,
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
                      child: Padding(
                        padding: const EdgeInsets.fromLTRB(
                          16.0,
                          16.0,
                          16.0,
                          16.0,
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "${cryptoList[0][index]["name"]}",
                                  style: const TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                                Text(
                                  "\$ ${cryptoList[0][index]["current_price"]}",
                                  style: const TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ],
                            ),
                            Image.network("${cryptoList[0][index]["image"]}")
                          ],
                        ),
                      ),
                    ),
                  );
                },
              );
            default:
              return const Center(child: CircularProgressIndicator());
          }
        },
      ),
    );
  }
}

int _indexes = 15;

void search(String val) {
  if (val.isEmpty) {
    _indexes = 15;
  } else {
    List filteredList = cryptoList[0].where(
      (element) => element["id"].toString().toLowerCase().contains(
            val.toLowerCase(),
          ),
    ).toList(); // Convert the filtered iterable to a list
    _indexes = filteredList.length;
  }
  print("${cryptoList[0][1]["id"]}");
  SearchList(count: _indexes);
}