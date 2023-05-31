import 'dart:developer';
import 'package:flutter/material.dart';
import '../../service/api_call.dart';

class SearchData extends ChangeNotifier {
  String _searchText = "";
  String get searchText => _searchText;
  set searchText(String val) {
    _searchText = val;
    notifyListeners();
  }
}

final searchData = SearchData();

class SearchInheritedNotifier extends InheritedNotifier<SearchData> {
  const SearchInheritedNotifier({
    Key? key,
    required Widget child,
    required SearchData searchProvider,
  }) : super(
          key: key,
          notifier: searchProvider,
          child: child,
        );
  static String of(BuildContext context) =>
      context
          .dependOnInheritedWidgetOfExactType<SearchInheritedNotifier>()
          ?.notifier
          ?.searchText ??
      '';
}

class Pricepage extends StatelessWidget {
  const Pricepage({super.key});

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
            child: SearchInheritedNotifier(
              searchProvider: searchData,
              child: Builder(
                builder: (context) {
                  return Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(
                            bottom: 8.0, left: 16.0, right: 16.0),
                        child: Column(
                          children: [
                            TextFormField(
                              onFieldSubmitted: (value) {
                                // log(cachedCryptoList.toString());
                                // print('\n\n\n\n\n\n\n');
                                cachedCryptoList = search(value);
                                log(cachedCryptoList.toString());
                                searchData.searchText =
                                    SearchInheritedNotifier.of(context);
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
                      SizedBox(
                        width: MediaQuery.of(context).size.width,
                        height: MediaQuery.of(context).size.height - 150,
                        child: ListView.builder(
                          physics: const BouncingScrollPhysics(),
                          itemCount: cachedCryptoList.length,
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
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            "${cachedCryptoList[0][index]['name']}",
                                            style: const TextStyle(
                                              fontSize: 18,
                                              fontWeight: FontWeight.w500,
                                            ),
                                          ),
                                          Text(
                                            "\$ ${cachedCryptoList[0][index]['current_price']}",
                                            style: const TextStyle(
                                              fontSize: 14,
                                              fontWeight: FontWeight.w500,
                                            ),
                                          ),
                                        ],
                                      ),
                                      // Image.network(
                                      //     "${cachedCryptoList[0][index]['image']}")
                                    ],
                                  ),
                                ),
                              ),
                            );
                          },
                        ),
                      ),
                    ],
                  );
                },
              ),
            ),
          ),
        ),
      ),
    );
  }
}

List<dynamic> search(String val) {
  List<dynamic> filteredList = [];
  if (val.isNotEmpty) {
    filteredList = cachedCryptoList[0]
        .where(
          (element) => element["id"].toString().toLowerCase().contains(
                val.toLowerCase(),
              ),
        )
        .toList();
  } else {
    filteredList = cachedCryptoList[0];
  }
  cachedCryptoList[0] = filteredList;
  return filteredList;
}
