// To parse this JSON data, do
//
//     final cryptoDataResponse = cryptoDataResponseFromJson(jsonString);

import 'dart:convert';

CryptoDataResponse cryptoDataResponseFromJson(String str) =>
    CryptoDataResponse.fromJson(json.decode(str));

String cryptoDataResponseToJson(CryptoDataResponse data) =>
    json.encode(data.toJson());

class CryptoDataResponse {
  CryptoDataResponse({
    required this.status,
    required this.data,
  });

  Status status;
  List<Datum> data;

  factory CryptoDataResponse.fromJson(Map<String, dynamic> json) =>
      CryptoDataResponse(
        status: Status.fromJson(json["status"]),
        data: List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "status": status.toJson(),
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
      };
}

class Datum {
  Datum({
    required this.id,
    required this.name,
    required this.symbol,
    required this.slug,
    required this.numMarketPairs,
    required this.dateAdded,
    required this.tags,
    this.maxSupply,
    required this.circulatingSupply,
    required this.totalSupply,
    this.platform,
    required this.cmcRank,
    this.selfReportedCirculatingSupply,
    this.selfReportedMarketCap,
    this.tvlRatio,
    required this.lastUpdated,
    required this.quote,
  });

  int id;
  String name;
  String symbol;
  String slug;
  int numMarketPairs;
  DateTime dateAdded;
  List<String> tags;
  int? maxSupply;
  double circulatingSupply;
  double totalSupply;
  Platform? platform;
  int cmcRank;
  double? selfReportedCirculatingSupply;
  double? selfReportedMarketCap;
  double? tvlRatio;
  DateTime lastUpdated;
  Quote quote;

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        id: json["id"],
        name: json["name"],
        symbol: json["symbol"],
        slug: json["slug"],
        numMarketPairs: json["num_market_pairs"],
        dateAdded: DateTime.parse(json["date_added"]),
        tags: List<String>.from(json["tags"].map((x) => x)),
        maxSupply: json["max_supply"],
        circulatingSupply: json["circulating_supply"]?.toDouble(),
        totalSupply: json["total_supply"]?.toDouble(),
        platform: json["platform"] == null
            ? null
            : Platform.fromJson(json["platform"]),
        cmcRank: json["cmc_rank"],
        selfReportedCirculatingSupply:
            json["self_reported_circulating_supply"]?.toDouble(),
        selfReportedMarketCap: json["self_reported_market_cap"]?.toDouble(),
        tvlRatio: json["tvl_ratio"]?.toDouble(),
        lastUpdated: DateTime.parse(json["last_updated"]),
        quote: Quote.fromJson(json["quote"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "symbol": symbol,
        "slug": slug,
        "num_market_pairs": numMarketPairs,
        "date_added": dateAdded.toIso8601String(),
        "tags": List<dynamic>.from(tags.map((x) => x)),
        "max_supply": maxSupply,
        "circulating_supply": circulatingSupply,
        "total_supply": totalSupply,
        "platform": platform?.toJson(),
        "cmc_rank": cmcRank,
        "self_reported_circulating_supply": selfReportedCirculatingSupply,
        "self_reported_market_cap": selfReportedMarketCap,
        "tvl_ratio": tvlRatio,
        "last_updated": lastUpdated.toIso8601String(),
        "quote": quote.toJson(),
      };
}

class Platform {
  Platform({
    required this.id,
    required this.name,
    required this.symbol,
    required this.slug,
    required this.tokenAddress,
  });

  int id;
  Name name;
  Symbol symbol;
  Slug slug;
  String tokenAddress;

  factory Platform.fromJson(Map<String, dynamic> json) => Platform(
        id: json["id"],
        name: nameValues.map[json["name"]]!,
        symbol: symbolValues.map[json["symbol"]]!,
        slug: slugValues.map[json["slug"]]!,
        tokenAddress: json["token_address"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": nameValues.reverse[name],
        "symbol": symbolValues.reverse[symbol],
        "slug": slugValues.reverse[slug],
        "token_address": tokenAddress,
      };
}

enum Name { ethereum, bnb, aptos, tron, optimism, arbitrum }

final nameValues = EnumValues({
  "Aptos": Name.aptos,
  "Arbitrum": Name.arbitrum,
  "BNB": Name.bnb,
  "Ethereum": Name.ethereum,
  "Optimism": Name.optimism,
  "TRON": Name.tron
});

enum Slug { ethereum, bnb, aptos, tron, optimismEthereum, arbitrumEthereum }

final slugValues = EnumValues({
  "aptos": Slug.aptos,
  "arbitrum-ethereum": Slug.arbitrumEthereum,
  "bnb": Slug.bnb,
  "ethereum": Slug.ethereum,
  "optimism-ethereum": Slug.optimismEthereum,
  "tron": Slug.tron
});

enum Symbol { eth, bnb, apt, trx, op, arbitrum }

final symbolValues = EnumValues({
  "APT": Symbol.apt,
  "ARBITRUM": Symbol.arbitrum,
  "BNB": Symbol.bnb,
  "ETH": Symbol.eth,
  "OP": Symbol.op,
  "TRX": Symbol.trx
});

class Quote {
  Quote({
    required this.usd,
  });

  Usd usd;

  factory Quote.fromJson(Map<String, dynamic> json) => Quote(
        usd: Usd.fromJson(json["USD"]),
      );

  Map<String, dynamic> toJson() => {
        "USD": usd.toJson(),
      };
}

class Usd {
  Usd({
    required this.price,
    required this.volume24H,
    required this.volumeChange24H,
    required this.percentChange1H,
    required this.percentChange24H,
    required this.percentChange7D,
    required this.percentChange30D,
    required this.percentChange60D,
    required this.percentChange90D,
    required this.marketCap,
    required this.marketCapDominance,
    required this.fullyDilutedMarketCap,
    this.tvl,
    required this.lastUpdated,
  });

  double price;
  double volume24H;
  double volumeChange24H;
  double percentChange1H;
  double percentChange24H;
  double percentChange7D;
  double percentChange30D;
  double percentChange60D;
  double percentChange90D;
  double marketCap;
  double marketCapDominance;
  double fullyDilutedMarketCap;
  double? tvl;
  DateTime lastUpdated;

  factory Usd.fromJson(Map<String, dynamic> json) => Usd(
        price: json["price"]?.toDouble(),
        volume24H: json["volume_24h"]?.toDouble(),
        volumeChange24H: json["volume_change_24h"]?.toDouble(),
        percentChange1H: json["percent_change_1h"]?.toDouble(),
        percentChange24H: json["percent_change_24h"]?.toDouble(),
        percentChange7D: json["percent_change_7d"]?.toDouble(),
        percentChange30D: json["percent_change_30d"]?.toDouble(),
        percentChange60D: json["percent_change_60d"]?.toDouble(),
        percentChange90D: json["percent_change_90d"]?.toDouble(),
        marketCap: json["market_cap"]?.toDouble(),
        marketCapDominance: json["market_cap_dominance"]?.toDouble(),
        fullyDilutedMarketCap: json["fully_diluted_market_cap"]?.toDouble(),
        tvl: json["tvl"]?.toDouble(),
        lastUpdated: DateTime.parse(json["last_updated"]),
      );

  Map<String, dynamic> toJson() => {
        "price": price,
        "volume_24h": volume24H,
        "volume_change_24h": volumeChange24H,
        "percent_change_1h": percentChange1H,
        "percent_change_24h": percentChange24H,
        "percent_change_7d": percentChange7D,
        "percent_change_30d": percentChange30D,
        "percent_change_60d": percentChange60D,
        "percent_change_90d": percentChange90D,
        "market_cap": marketCap,
        "market_cap_dominance": marketCapDominance,
        "fully_diluted_market_cap": fullyDilutedMarketCap,
        "tvl": tvl,
        "last_updated": lastUpdated.toIso8601String(),
      };
}

class Status {
  Status({
    required this.timestamp,
    required this.errorCode,
    this.errorMessage,
    required this.elapsed,
    required this.creditCount,
    this.notice,
    required this.totalCount,
  });

  DateTime timestamp;
  int errorCode;
  dynamic errorMessage;
  int elapsed;
  int creditCount;
  dynamic notice;
  int totalCount;

  factory Status.fromJson(Map<String, dynamic> json) => Status(
        timestamp: DateTime.parse(json["timestamp"]),
        errorCode: json["error_code"],
        errorMessage: json["error_message"],
        elapsed: json["elapsed"],
        creditCount: json["credit_count"],
        notice: json["notice"],
        totalCount: json["total_count"],
      );

  Map<String, dynamic> toJson() => {
        "timestamp": timestamp.toIso8601String(),
        "error_code": errorCode,
        "error_message": errorMessage,
        "elapsed": elapsed,
        "credit_count": creditCount,
        "notice": notice,
        "total_count": totalCount,
      };
}

class EnumValues<T> {
  Map<String, T> map;
  late Map<T, String> reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    reverseMap = map.map((k, v) => MapEntry(v, k));
    return reverseMap;
  }
}
