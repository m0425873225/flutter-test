import 'package:flutter/material.dart';

class SearchBar extends StatefulWidget{
  @override
  _SearchBarState createState()=>_SearchBarState();
}
class _SearchBarState extends State<SearchBar>{
  @override
  Widget build(BuildContext context){
    return Container(
      margin: EdgeInsets.only(),
      height: 40,
      width: 220,
      child:  Row(
        children: [
          Expanded(child: TextField(
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
  _SearchPage createState() =>_SearchPage();
}


class Product {
  final String tittle;
  final String tag;
  final String num;

  Product({this.tittle, this.tag, this.num});
}

class _SearchPage extends State<Search>{
  final List<Product> listItems = new List<Product>.generate(500, (i) {
    return Product(
      tittle: 'title: $i',
      tag: '#tag：$i',
      num: 'num: $i',
    );
  });

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final width = size.width;
    final height = size.height;
    print('width is $width; height is $height');

    return SingleChildScrollView(
        child: Center(
            child: Column(
              children: [
                Container(
                  child: _TESTLIST(listItems),
                ),
              ],
            )));
  }
  Widget _TESTLIST(listdata) {
    final size = MediaQuery.of(context).size;
    final width = size.width;
    final height = size.height;
    return Container(
      height: 600,
      child: ListView.builder(
          itemCount: listItems.length,
          itemBuilder: (context, index) {
            return Container(
              padding: EdgeInsets.symmetric(vertical: 15.0, horizontal: 20),
              child: new Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    '${listItems[index].tittle}',
                    style: TextStyle(color: Colors.grey, fontSize: 12),
                  ),
                  Text(
                    '${listItems[index].tag}',
                    style: TextStyle(color: Colors.white, fontSize: 22),
                  ),
                  Text(
                    '${listItems[index].num}',
                    style: TextStyle(color: Colors.grey, fontSize: 12),
                  ),
                ],
              ),
              decoration: BoxDecoration(
                //                    <-- BoxDecoration
                border: Border(bottom: BorderSide(color: Colors.grey)),
              ),
            );
          }),
    );
  }
}