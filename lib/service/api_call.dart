import 'dart:convert';
import 'dart:developer' as devtools show log;
import 'package:coindcx/constant/info.dart';
import 'package:http/http.dart' as http;

List<dynamic> cachedCryptoList = [];

Future<List> dataCall() async {
  final response = await http.get(Uri.parse(
      "https://api.coingecko.com/api/v3/coins/markets?vs_currency=usd&order=market_cap_desc&per_page=100&page=1&sparkline=false"));
  if (response.statusCode == 200) {
    devtools.log('1');
    cachedCryptoList.add(jsonDecode(response.body));
    devtools.log('2');
    Apkdata.list.add(jsonDecode(response.body));
    devtools.log('3');
    // devtools.log(Apkdata.list.toString());
    devtools.log('4');
    return Apkdata.list;
    // return cachedCryptoList;
  } else {
    devtools.log("Error");
    throw Exception("Failed to load ${response.statusCode}");
  }
}
