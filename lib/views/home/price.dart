import 'package:flutter/material.dart';

import '../../constant/info.dart';
import '../../constant/routes.dart';

class Pricepage1 extends StatefulWidget {
  final List<dynamic>? dataList;
  const Pricepage1({Key? key, required this.dataList}) : super(key: key);

  @override
  State<Pricepage1> createState() => _Pricepage1State();
}

class _Pricepage1State extends State<Pricepage1> {
  late List<dynamic>? filteredList;

  @override
  void initState() {
    super.initState();
    filteredList = widget.dataList;
  }

  void search(String query) {
    if (widget.dataList != null) {
      setState(() {
        filteredList = widget.dataList!
            .where((data) => data['name']
                .toString()
                .toLowerCase()
                .contains(query.toLowerCase()))
            .toList();
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.fromLTRB(
              16.0,
              16.0,
              16.0,
              0.0,
            ),
            child: Column(
              children: [
                Column(
                  children: [
                    //search Bar
                    Padding(
                      padding: const EdgeInsets.only(bottom: 8.0),
                      child: TextFormField(
                        onChanged: search,
                        style: const TextStyle(
                            fontWeight: FontWeight.w500, fontSize: 18),
                        decoration: InputDecoration(
                          prefixIcon: const Icon(Icons.search),
                          label: const Text("Search"),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(16),
                          ),
                        ),
                      ),
                    ),
                    //list view
                    SizedBox(
                      width: MediaQuery.of(context).size.width,
                      height: MediaQuery.of(context).size.height - 180,
                      child: filteredList!.isEmpty
                          ? const Center(child: Text('No items found'))
                          : ListView.builder(
                              physics: const BouncingScrollPhysics(),
                              itemCount: filteredList!.length,
                              itemBuilder: (context, index) {
                                final item = filteredList![index];
                                return GestureDetector(
                                  onTap: () async {
                                    setState(() {
                                      Apkdata.searchList = item;
                                    });
                                    Navigator.pushNamed(context, infoRoute);
                                  },
                                  child: Padding(
                                    padding: const EdgeInsets.only(
                                      top: 10.0,
                                      bottom: 0,
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
                                        color: Colors.lightBlue.shade50,
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
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Column(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Text(
                                                  "${item['name']}",
                                                  style: const TextStyle(
                                                    fontSize: 18,
                                                    fontWeight: FontWeight.w500,
                                                  ),
                                                ),
                                                Text(
                                                  "\$ ${item['current_price']}",
                                                  style: const TextStyle(
                                                    fontSize: 14,
                                                    fontWeight: FontWeight.w500,
                                                  ),
                                                ),
                                              ],
                                            ),
                                            Image.network("${item['image']}")
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                );
                              },
                            ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
