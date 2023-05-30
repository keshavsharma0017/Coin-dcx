// To parse this JSON data, do
//
//     final stockData = stockDataFromJson(jsonString);

// import 'package:meta/meta.dart';
import 'dart:convert';

List<StockData> stockDataFromJson(String str) => List<StockData>.from(json.decode(str).map((x) => StockData.fromJson(x)));

String stockDataToJson(List<StockData> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class StockData {
    StockData({
        required this.id,
        required this.symbol,
        required this.name,
        required this.image,
        required this.currentPrice,
        required this.high24H,
        required this.low24H,
        required this.priceChange24H,
        required this.lastUpdated,
    });

    final String id;
    final String symbol;
    final String name;
    final String image;
    final int currentPrice;
    final int high24H;
    final int low24H;
    final double priceChange24H;
    final DateTime lastUpdated;

    factory StockData.fromJson(Map<String, dynamic> json) => StockData(
        id: json["id"],
        symbol: json["symbol"],
        name: json["name"],
        image: json["image"],
        currentPrice: json["current_price"],
        high24H: json["high_24h"],
        low24H: json["low_24h"],
        priceChange24H: json["price_change_24h"].toDouble(),
        lastUpdated: DateTime.parse(json["last_updated"]),
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "symbol": symbol,
        "name": name,
        "image": image,
        "current_price": currentPrice,
        "high_24h": high24H,
        "low_24h": low24H,
        "price_change_24h": priceChange24H,
        "last_updated": lastUpdated.toIso8601String(),
    };
}
