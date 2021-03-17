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
  List<ApiHm> hmApi ;
  Future<List<ApiHm>> _futureHm;
  Future<List<ApiHm>> ApiHmtest() async{
    try {
      final data =  await http.get('http://taco-randomizer.herokuapp.com/random/?full-taco=true');
      if(data.statusCode == 200){
        List hm =  json.decode(data.body) as List;
        return hm.map((e) => ApiHm.fromJson(e)).toList();
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
            this.hmApi = projectSnap.data;
            return Expanded(
              child: ListView.builder(
                shrinkWrap: true,
                itemCount: this.hmApi.length,
                itemBuilder: (context,index){
                  for(int i =0;i <= 10 ; i++)
                    {return ListTile(
                      title: Text('${hmApi[index].name}'),
                      subtitle: Text('${hmApi[index].shellUrl}'),
                    );
                    }
                },
              ),
            );
          }
        });
  }
  @override
  void initState(){
    super.initState();
    this._futureHm = this.ApiHmtest();
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

class ApiHm {
  BaseLayer baseLayer;
  String condimentUrl;
  String url;
  Null mixinUrl;
  String name;
  String slug;
  Null seasoningUrl;
  String recipe;
  Null shellUrl;
  BaseLayer condiment;
  String baseLayerUrl;

  ApiHm(
      {this.baseLayer,
        this.condimentUrl,
        this.url,
        this.mixinUrl,
        this.name,
        this.slug,
        this.seasoningUrl,
        this.recipe,
        this.shellUrl,
        this.condiment,
        this.baseLayerUrl});

  ApiHm.fromJson(Map<String, dynamic> json) {
    baseLayer = json['base_layer'] != null
        ? new BaseLayer.fromJson(json['base_layer'])
        : null;
    condimentUrl = json['condiment_url'];
    url = json['url'];
    mixinUrl = json['mixin_url'];
    name = json['name'];
    slug = json['slug'];
    seasoningUrl = json['seasoning_url'];
    recipe = json['recipe'];
    shellUrl = json['shell_url'];
    condiment = json['condiment'] != null
        ? new BaseLayer.fromJson(json['condiment'])
        : null;
    baseLayerUrl = json['base_layer_url'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.baseLayer != null) {
      data['base_layer'] = this.baseLayer.toJson();
    }
    data['condiment_url'] = this.condimentUrl;
    data['url'] = this.url;
    data['mixin_url'] = this.mixinUrl;
    data['name'] = this.name;
    data['slug'] = this.slug;
    data['seasoning_url'] = this.seasoningUrl;
    data['recipe'] = this.recipe;
    data['shell_url'] = this.shellUrl;
    if (this.condiment != null) {
      data['condiment'] = this.condiment.toJson();
    }
    data['base_layer_url'] = this.baseLayerUrl;
    return data;
  }
}

class BaseLayer {
  String recipe;
  String name;
  String url;
  String slug;

  BaseLayer({this.recipe, this.name, this.url, this.slug});

  BaseLayer.fromJson(Map<String, dynamic> json) {
    recipe = json['recipe'];
    name = json['name'];
    url = json['url'];
    slug = json['slug'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['recipe'] = this.recipe;
    data['name'] = this.name;
    data['url'] = this.url;
    data['slug'] = this.slug;
    return data;
  }
}