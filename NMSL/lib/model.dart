import 'dart:convert';
import 'package:http/http.dart' as http;
import 'dart:async';

class getonlinedata{
  List<blockchainApi> blockchaindata;
  Future<List<blockchainApi>> futureBlockchain;
  Future<List<blockchainApi>> BlockchainApi() async {
    try {
      Uri _uri = Uri.parse('https://api.coinlore.net/api/tickers/');
      final data = await http.get(_uri);
      if (data.statusCode == 200) {
        if (jsonDecode(data.body)['info']['coins_num'] is int) {
          List dk = json.decode(data.body)['data'] as List;
          return dk.map((e) => blockchainApi.fromJson(e)).toList();
        }
      } else if (data.statusCode == 404) {
        return null;
      } else {
        return null;
      }
    } catch (e) {
      throw Exception(e);
    }
  }

}

class blockchainApi {
  String id;
  String symbol;
  String name;
  String nameid;
  int rank;
  String priceUsd;
  String percentChange24h;
  String percentChange1h;
  String percentChange7d;
  String priceBtc;
  String marketCapUsd;
  double volume24;
  double volume24a;
  String csupply;
  String tsupply;
  String msupply;

  blockchainApi(
      {this.id,
        this.symbol,
        this.name,
        this.nameid,
        this.rank,
        this.priceUsd,
        this.percentChange24h,
        this.percentChange1h,
        this.percentChange7d,
        this.priceBtc,
        this.marketCapUsd,
        this.volume24,
        this.volume24a,
        this.csupply,
        this.tsupply,
        this.msupply});

  blockchainApi.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    symbol = json['symbol'];
    name = json['name'];
    nameid = json['nameid'];
    rank = json['rank'];
    priceUsd = json['price_usd'];
    percentChange24h = json['percent_change_24h'];
    percentChange1h = json['percent_change_1h'];
    percentChange7d = json['percent_change_7d'];
    priceBtc = json['price_btc'];
    marketCapUsd = json['market_cap_usd'];
    volume24 = json['volume24'];
    volume24a = json['volume24a'];
    csupply = json['csupply'];
    tsupply = json['tsupply'];
    msupply = json['msupply'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['symbol'] = this.symbol;
    data['name'] = this.name;
    data['nameid'] = this.nameid;
    data['rank'] = this.rank;
    data['price_usd'] = this.priceUsd;
    data['percent_change_24h'] = this.percentChange24h;
    data['percent_change_1h'] = this.percentChange1h;
    data['percent_change_7d'] = this.percentChange7d;
    data['price_btc'] = this.priceBtc;
    data['market_cap_usd'] = this.marketCapUsd;
    data['volume24'] = this.volume24;
    data['volume24a'] = this.volume24a;
    data['csupply'] = this.csupply;
    data['tsupply'] = this.tsupply;
    data['msupply'] = this.msupply;
    return data;
  }
}