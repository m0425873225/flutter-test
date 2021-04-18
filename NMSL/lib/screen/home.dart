import 'dart:convert';
import 'package:NMSL/network/connect.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:NMSL/UrlLaunch.dart';
import 'package:connectivity/connectivity.dart';
class HomeBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Text('首頁'),
        ],
      ),
    );
  }
}


class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List<TestJson> datas ;
  Future<List<TestJson>> _futuredata;


  Future<List<TestJson>> Apitest() async{
    try {
      Uri _uri = Uri.parse('https://jsonplaceholder.typicode.com/todos');
      final data =  await http.get(_uri);
      if(data.statusCode == 200){
        List dk =  json.decode(data.body) as List;
        return dk.map((e) => TestJson.fromJson(e)).toList();
      } else if (data.statusCode == 404){return null;}
      else{return null;}
    }
    catch (e) {
      throw Exception(e);
    }
  }

  FutureBuilder _futureBuilder(){
    return FutureBuilder(
      future: this._futuredata,
      builder: (context,projectSnap){
        if ((projectSnap.connectionState == ConnectionState.none)||
            (projectSnap.hasData == null)||
            (projectSnap.data == null))
            {return Container();}
        else{
          this.datas = projectSnap.data;
          return Expanded(
          child: ListView.builder(
          shrinkWrap: true,
          itemCount: this.datas.length,
          itemBuilder: (context,index){
            return ListTile(
              title: Text('${datas[index].title}'),
              subtitle: Text('${datas[index].completed}'),
            );
          },
        ),
              );
        }
      });
  }

  @override
  void initState(){
    super.initState();
    this._futuredata = this.Apitest();
    NetworkConnect.instance.myStream.listen((event) {
      Map<String,bool> connectEvent = event as Map<String,bool>;
      if(!connectEvent['status']){
        showDialog(
            barrierDismissible: false,
            context: context, builder: (context){
          return AlertDialog(
            title: Center(child:Column(
              children: [
                Icon(Icons.perm_scan_wifi,color: Colors.red,),
                Text('已中斷網路連線'),
              ],
            )),
            actions: <Widget>[
              FlatButton(
                child: Center(child: Text('已重新連接'),),
                onPressed: () async{
                  if(NetworkConnect.checkConnection(event: await Connectivity().checkConnectivity())){
                    Navigator.of(context).pop(true);
                  } else {}
                },
              ),
            ],
          );
        },);
      }else{}
    });
    NetworkConnect.instance.init();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child:Column(
        children: [
          Center(
            child: InkWell(
              onTap: ()async{
                UrlLaunch().urlLaunch('https://www.pressplay.cc/');
              },
              child: Text('超連結點擊'),
            ),
          ),
          Container(
            /*child:_futureBuilder(),*/
          )
        ],
      )
      );
  }
}


class TestJson {
  int userId;
  int id;
  String title;
  bool completed;

  TestJson({this.userId, this.id, this.title, this.completed});

  TestJson.fromJson(Map<String, dynamic> json) {
    userId = json['userId'];
    id = json['id'];
    title = json['title'];
    completed = json['completed'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['userId'] = this.userId;
    data['id'] = this.id;
    data['title'] = this.title;
    data['completed'] = this.completed;
    return data;
  }
}