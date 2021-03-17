import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:NMSL/url/export.dart';

class ReserveBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Text('備用'),
        ],
      ),
    );
  }
}

class Reserve extends StatefulWidget {
  @override
  _ReserveState createState() => _ReserveState();
}

class _ReserveState extends State<Reserve> {

  Future _landRateFuture;

  Future<List<LandTaxRateData>> futureAPI () async {
    try {
      final data = await http.get(ApiRoutes().govLandRateApi);
      if(data.statusCode == 200) {
        if(json.decode(data.body)['success']){
          List dk = json.decode(data.body)['data'] as List;
          return dk.map((e) => LandTaxRateData.fromJson(e)).toList();
        }
      }
      return null;
    } catch(e) {
      throw Exception(e);
    }
  }

  FutureBuilder _futureBuilder(){
    return FutureBuilder<List<LandTaxRateData>>(
      future: _landRateFuture,
      builder: (context, projectSnap) {
        if ((projectSnap.connectionState == ConnectionState.none) ||
            (projectSnap.hasData == null) ||
            (projectSnap.data == null)) {
          return Container();
        } else {
          List<LandTaxRateData> data = projectSnap.data;
          return Expanded(
            child: ListView.builder(
              itemCount: data.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(data[index].item),
                  subtitle: Text(data[index].value),
                  trailing: Text(data[index].unit),
                );
              },
            ),
          );
        }
      },
    );
  }

  @override
  void initState(){
    this._landRateFuture = this.futureAPI();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Container(
            child: _futureBuilder(),
          )
        ],
      ),
    );
  }
}

class LandTaxRateData {
  int seq;
  String year;
  String item;
  String category;
  String unit;
  String value;

  LandTaxRateData({
    this.seq, this.year, this.item, this.category, this.unit, this.value,});

  LandTaxRateData.fromJson(Map<String, dynamic> json) {
    seq = json['seq'];
    year = json['資料年期別'];
    item = json['統計項目'];
    category = json['稅率別'];
    unit = json['資料單位'];
    value = json['值'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['seq'] = this.seq;
    data['year'] = this.year;
    data['item'] = this.item;
    data['category'] = this.category;
    data['unit'] = this.unit;
    data['value'] = this.value;
    return data;
  }
}
