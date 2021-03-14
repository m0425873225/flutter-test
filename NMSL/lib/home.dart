import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
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

  Future<List<TestJson>> Apitest() async{
    try {
      final data =  await http.get('https://jsonplaceholder.typicode.com/todos');
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
  
  void initState(){
    super.initState();
    this.Apitest().then((value) {
      setState(() {
        this.datas = value;
      });
    });
  }
  @override
  Widget build(BuildContext context) {
    return Container(
      child:Column(
        children: [
          InkWell(
            onTap: ()async{
              this.Apitest().then((result){
                setState(() {
                  this.datas = result;
                });
              });
            },
            child:Text('test')
          ),
          (datas == null)?
          Container():
          Expanded(child: ListView.builder(
            shrinkWrap:true,
            itemBuilder: (context,index){
              return ListView.builder(
                shrinkWrap: true,
                itemCount: this.datas.length,
                itemBuilder: (context,index){
                  return ListTile(
                    title: Text('${datas[index].title}'),
                    subtitle: Text('${datas[index].completed}'),
                  );
                },
              );
            },
         ))
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