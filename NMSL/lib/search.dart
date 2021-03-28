import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:NMSL/DropBottom.dart';
import 'dart:async';

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
          )),
          DropDownStateWidget(),
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
  int _time = 120;
  int _timeMin ;
  int _timesec ;
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
  void timerCountdown(){
    Timer.periodic(Duration(seconds: 1), (timer) {
      _timeMin = (_time / 60).truncate();
      _timesec = _time % 60;
      if (_time==0){
        timer.cancel();
      }else{_time--;}
      print(_time);
      setState(() {
      });
    });
  }
  FutureBuilder _futureHmapi() {
    return FutureBuilder(
        future: this._futureBlockchain,
        builder: (context, projectSnap) {
          if ((projectSnap.connectionState == ConnectionState.none) ||
              (projectSnap.hasData == null) ||
              (projectSnap.data == null)) {
            return Center(
              child:  Container(
                height: MediaQuery.of(context).size.height*0.7,
                width: MediaQuery.of(context).size.width*0.5,
                child: Center(
                  child: CircularProgressIndicator(
                    backgroundColor: Colors.grey[200],
                    valueColor: AlwaysStoppedAnimation(Colors.blue),
                  ),
                ),
              ),
            );

          } else {
            this.blockchaindata = projectSnap.data;
            return Expanded(
              child: Column(
              children: [
                Container(
                  padding: EdgeInsets.only(left: 10,right: 10),
                  child:  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Currency',
                        style: TextStyle(
                          color: Colors.grey,
                          fontSize: 15,
                        ),
                      ),
                      Text(
                        'Market Cap/24h',
                        style: TextStyle(
                          color: Colors.grey,
                          fontSize: 15,
                        ),
                      ),
                      Text(
                        'Price/24h',
                        style: TextStyle(
                          color: Colors.grey,
                          fontSize: 15,
                        ),
                      )
                    ],
                  ),
                ),
                Divider(color: Colors.white,height: 10,),
                Expanded(child:  Container(
                  padding: EdgeInsets.only(left: 10,right: 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        height: MediaQuery.of(context).size.height*0.7,
                        width: MediaQuery.of(context).size.width*0.15,
                        decoration: BoxDecoration(border: Border.all(color: Colors.white)),
                      ),
                      Container(
                        height: MediaQuery.of(context).size.height*0.7,
                        width: MediaQuery.of(context).size.width*0.45,
                        decoration: BoxDecoration(border: Border.all(color: Colors.white)),
                        child: Text('${_timeMin}:${_timesec}'),
                      ),
                      Container(
                        height: MediaQuery.of(context).size.height*0.7,
                        width: MediaQuery.of(context).size.width*0.2,
                        decoration: BoxDecoration(border: Border.all(color: Colors.white)),
                      ),
                    ],
                  ),
                ))
                /*ListView.builder(
                  shrinkWrap: true,
                  itemCount: this.blockchaindata.length,
                  itemBuilder: (context,index){
                    return Container(
                      padding: EdgeInsets.only(left: 10,right: 10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            child:Column(
                              children: [
                                Text('${blockchaindata[index].symbol}',style: TextStyle(color:Colors.white,fontSize: 17),),
                              ],
                            ),
                          ),
                          Container(
                            child: Text('${blockchaindata[index].marketCapUsd}',style: TextStyle(color:Colors.white,fontSize: 17),),
                          ),
                          Container(
                            child: Text('${blockchaindata[index].priceUsd}',style: TextStyle(color:Colors.white,fontSize: 17),),
                          )
                        ],
                      ),
                    );
                  },
                ),*/
              ],
            ),);
          }
        });
  }

  @override
  void initState() {
    timerCountdown();
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
