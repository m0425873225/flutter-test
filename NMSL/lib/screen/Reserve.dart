import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

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
  List<taxdata> hmApi ;
  Future<List<taxdata>> _futureHm;
  Future<List<taxdata>> ApiHmtest() async{
    try {
      Uri _uri = Uri.parse('https://api.kcg.gov.tw/api/service/get/0223bf7c-21b6-41ba-86e1-23e81969e771');
      final data =  await http.get(_uri);
      if(data.statusCode == 200){
        if(json.decode(data.body)['success']){
          List dk = json.decode(data.body)['data'] as List;
          return dk.map((e) => taxdata.fromJson(e)).toList();
        }
      } else if (data.statusCode == 404){return null;}
      else{return null;}
    }
    catch (e) {
      throw Exception(e);
    }
  }

  FutureBuilder _futureHmapi(){
    return FutureBuilder(
        future: this._futureHm,
        builder: (context,projectSnap){
          if ((projectSnap.connectionState == ConnectionState.none)||
              (projectSnap.hasData == null)||
              (projectSnap.data == null))
          {return Container();}
          else{
            this.hmApi= projectSnap.data;
            return Expanded(
              child: ListView.builder(
                shrinkWrap: true,
                itemCount: this.hmApi.length,
                itemBuilder: (context,index){
                  return ListTile(
                    title: Text('${hmApi[index].datayear}'),
                    subtitle: Text('${hmApi[index].seq}'),
                    trailing: Text('${hmApi[index].tax}'),
                  );
                },
              ),
            );
          }
        });
  }
  @override
  void initState(){
    this._futureHm = this.ApiHmtest();
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


class taxdata {
  int seq;
  String datayear;
  String statistics;
  String tax;
  String dataunit;
  String value;

  taxdata(
      {this.seq,
        this.datayear,
        this.statistics,
        this.tax,
        this.dataunit,
        this.value});

  taxdata.fromJson(Map<String, dynamic> json) {
    seq = json['seq'];
    datayear = json['資料年期別'];
    statistics = json['統計項目'];
    tax = json['稅率別'];
    dataunit = json['資料單位'];
    value = json['值'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['seq'] = this.seq;
    data['datayear'] = this.datayear;
    data['statistics'] = this.statistics;
    data['tax'] = this.tax;
    data['dataunit'] = this.dataunit;
    data['value'] = this.value;
    return data;
  }
}