import 'dart:convert';
import 'dart:developer';
import 'package:http/http.dart' as http;

List<dynamic> cryptoList = [];

Future<List> dataCall() async {
  log("1");
  final response = await http.get(Uri.parse(
      "https://api.coingecko.com/api/v3/coins/markets?vs_currency=usd&order=market_cap_desc&per_page=100&page=1&sparkline=false"));
  log("2");
  // print(jsonDecode(response.body));
  log("3");

  if (response.statusCode == 200) {
    log("4");
    cryptoList.add(jsonDecode(response.body));
    log("5");
    return cryptoList;
  } else {
    log("0");
    throw Exception("failleddd to loaaaffd");
  }
}
