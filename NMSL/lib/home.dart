import 'package:flutter/material.dart';

class HomeBar extends StatefulWidget{
  @override
  _HomeBarState createState()=>_HomeBarState();
}
class _HomeBarState extends State<HomeBar>{
  @override
  Widget build(BuildContext context){
    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Text('首頁'),
          Icon(Icons.mail_outline),
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
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}