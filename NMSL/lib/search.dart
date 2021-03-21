import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class SearchBar extends StatefulWidget {
  @override
  _SearchBarState createState() => _SearchBarState();
}

class _SearchBarState extends State<SearchBar> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(),
      height: 40,
      width: 220,
      child: Row(
        children: [
          Expanded(
              child: TextField(
            autofocus: false,
            decoration: InputDecoration(
                fillColor: Colors.grey,
                filled: true,
                contentPadding: EdgeInsets.all(0),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15.0),
                ),
                hintText: "搜尋",
                prefixIcon: Icon(Icons.search, color: Colors.black)),
          ))
        ],
      ),
    );
  }
}

class Search extends StatefulWidget {
  @override
  _SearchPage createState() => _SearchPage();
}

class _SearchPage extends State<Search> {
  List<blockchainApi> blockchaindata;
  Future<List<blockchainApi>> _futureBlockchain;
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

  FutureBuilder _futureHmapi() {
    return FutureBuilder(
        future: this._futureBlockchain,
        builder: (context, projectSnap) {
          if ((projectSnap.connectionState == ConnectionState.none) ||
              (projectSnap.hasData == null) ||
              (projectSnap.data == null)) {
            return Container(
              child: Text('test'),
            );
          } else {
            this.blockchaindata = projectSnap.data;
            return Expanded(
              child: ListView.builder(
                padding: EdgeInsets.only(left: 10,right: 10),
                shrinkWrap: true,
                itemCount: blockchaindata.length,
                itemBuilder: (context, index) {
                  return Container(
                    width: MediaQuery.of(context).size.width * 0.8,
                    padding: EdgeInsets.symmetric(vertical: 30),
                    decoration: new BoxDecoration(
                      border: new Border.all(color: Colors.white, width: 0.5),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      mainAxisSize: MainAxisSize.max,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      verticalDirection: VerticalDirection.down,
                      children: [
                        Container(
                          padding: EdgeInsets.only(left: 5),
                          width: MediaQuery.of(context).size.width * 0.55,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                '${blockchaindata[index].symbol}',
                                style: TextStyle(
                                    color: Colors.grey, fontSize: 20),
                              ),
                              Row(
                                children: [
                                  Container(
                                    padding: EdgeInsets.zero,
                                    child: Row(
                                      children: [
                                        Text(
                                          '${blockchaindata[index].priceUsd}',
                                          style: TextStyle(
                                              color: Colors.amberAccent,
                                              fontSize: 40),
                                        ),
                                        Text(
                                          'usd',
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 10),
                                        )
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                        Container(height:100, child: VerticalDivider(color: Colors.white)),
                        Flexible(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Container(
                                width: MediaQuery.of(context).size.width * 0.45,
                                padding: EdgeInsets.only(right: 10,left: 10),
                                child: Column(
                                  children: [
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: [
                                        Row(
                                          children: [
                                            Icon(Icons.trending_up),
                                            Text('1H:'),
                                          ],
                                        ),
                                        Text(
                                          '${blockchaindata[index].percentChange1h}',
                                          style: TextStyle(
                                              color: Colors.white, fontSize: 17),
                                        ),
                                      ],
                                    ),
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: [
                                        Row(
                                          children: [
                                            Icon(Icons.trending_up),
                                            Text('1D:'),
                                          ],
                                        ),
                                        Text(
                                          '${blockchaindata[index].percentChange24h}',
                                          style: TextStyle(
                                              color: Colors.white, fontSize: 17),
                                        ),
                                      ],
                                    ),
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: [
                                        Row(
                                          children: [
                                            Icon(Icons.trending_up),
                                            Text('7D:'),
                                          ],
                                        ),
                                        Text(
                                          '${blockchaindata[index].percentChange7d}',
                                          style: TextStyle(
                                              color: Colors.white, fontSize: 17),
                                        )
                                      ],
                                    ),
                                  ],
                                ),
                              )
                            ],
                          ),
                        ),
                      ],
                    ),
                  );
                },
              ),
            );
          }
        });
  }

  @override
  void initState() {
    this._futureBlockchain = this.BlockchainApi();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Container(
            child: _futureHmapi(),
          )
        ],
      ),
    );
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
