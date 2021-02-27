import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: new ThemeData(
        brightness: Brightness.dark
      ),
        home: Scaffold(
      appBar: AppBar(
        title: Text('NMSL'),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
              icon:Icon(Icons.home),
          label:'首頁'),
          BottomNavigationBarItem(
              icon:Icon(Icons.ac_unit),
              label:'test1'),
          BottomNavigationBarItem(
              icon:Icon(Icons.settings),
              label:'設定'),
        ],
      ),
          drawer: Drawer(
            child: ListView(
              padding: EdgeInsets.zero,
              children: <Widget>[
                DrawerHeader(
                  child:Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text('帳戶資訊',style: TextStyle(
                              color: Colors.grey,
                              fontSize: 25
                          ),),
                          Icon(Icons.add_circle_outline,size: 30,color: Colors.blue,)
                        ],
                      ),
                      Row(
                        children: [
                          Icon(Icons.person),
                          Text('name',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 17
                            ),
                          )
                        ],
                      ),
                      Row(
                        children: [
                          Text('yan@gmail.com',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 17,
                          ),)
                        ],
                      ),
                      Row(
                        children: [
                          Text('@fuckUbitch',
                          style: TextStyle(
                            color: Colors.grey,
                            fontSize: 12,
                          ),)
                        ],
                      )
                    ],
                  ),
                  decoration: BoxDecoration(
                    color: Colors.black,
                  ),
                ),
                ListTile(
                  leading: Icon(Icons.person_outline),
                  title: Text('個人資訊',
                  style: TextStyle(
                    fontSize: 20
                  ),),
                  onTap: () {
                    Navigator.pop(context);
                  },
                ),
                ListTile(
                  leading: Icon(Icons.list),
                  title: Text('列表',
                    style: TextStyle(
                        fontSize: 20
                    ),),
                  onTap: () {
                    Navigator.pop(context);
                  },
                ),
                ListTile(
                  leading: Icon(Icons.ac_unit),
                  title: Text('test1',
                    style: TextStyle(
                        fontSize: 20
                    ),),
                  onTap: () {
                    Navigator.pop(context);
                  },
                ),
                ListTile(
                  leading: Icon(Icons.star),
                  title: Text('test2',
                    style: TextStyle(
                        fontSize: 20
                    ),),
                  onTap: () {
                    Navigator.pop(context);
                  },
                ),
              ],
            ),
          ),
      body: Home(),
    ));
  }
}

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class Product {
  final String tittle;
  final String tag;
  final String num;

  Product({this.tittle, this.tag, this.num});
}

class _HomeState extends State<Home> {
  final List<Product> listItems = new List<Product>.generate(500, (i) {
    return Product(
      tittle: 'title: $i',
      tag: '#tag：$i',
      num: 'num: $i',
    );
  });
  int comments = 0;
  void increasenum() {
    setState(() {
      comments++;
    });
  }

  double star = 0;
  void increasenum2() {
    setState(() {
      if (star < 4.9)
        star = star + 0.1;
      else
        star = star + 0;
    });
  }

  void setzero() {
    setState(() {
      star = 0;
    });
  }
  
  Widget _TESTLIST(listdata) {
    final size = MediaQuery.of(context).size;
    final width = size.width;
    final height = size.height;
    return Container(
      height: 500,

      child: ListView.builder(
          itemCount: listItems.length,
          itemBuilder: (context, index) {
            return Container(
              padding:EdgeInsets.symmetric(vertical: 15.0, horizontal: 20),
              child:new Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('${listItems[index].tittle}',
                style: TextStyle(
                  color: Colors.grey,
                  fontSize: 12
                ),),
                Text('${listItems[index].tag}',
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 22
                  ),),
                Text('${listItems[index].num}',
                  style: TextStyle(
                      color: Colors.grey,
                      fontSize: 12
                  ),),
              ],
            ),
              decoration: BoxDecoration( //                    <-- BoxDecoration
                border: Border(bottom: BorderSide(color: Colors.grey)),
              ),);
          }),
    );
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final width = size.width;
    final height = size.height;
    print('width is $width; height is $height');

    return Container(
        child: Center(
            child: Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          mainAxisSize: MainAxisSize.max,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(left: 10),
              child: Icon(Icons.accessibility),
            ),
            Container(
              width: 250,
              child: TextField(
                autofocus: true,
                decoration: InputDecoration(
                    fillColor: Colors.grey,
                    filled: true,
                    contentPadding: EdgeInsets.all(10.0),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15.0),
                        borderSide: BorderSide(
                            color: Colors.black,
                            width: 3.0,
                            style: BorderStyle.solid)),
                    hintText: "搜尋",
                    prefixIcon: Icon(Icons.search, color: Colors.black)),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(right: 10),
              child: Icon(Icons.settings),
            ),
          ],
        ),
        Container(
          /*padding:EdgeInsets.symmetric(vertical: 20.0, horizontal: 40),*/
          child: _TESTLIST(listItems),

        ),
      ],
    )));
  }

  Widget CONTENT(CONTEXT) {
    Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          '${this.star.toStringAsFixed(1)}',
          style: TextStyle(fontSize: 50),
        ),
      ],
    );
    Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        (this.star >= 0.9)
            ? Icon(Icons.star)
            : ((this.star > 0.1)
                ? Icon(Icons.star_half)
                : Icon(Icons.star_border)),
        (this.star >= 2)
            ? Icon(Icons.star)
            : ((this.star > 1.0)
                ? Icon(Icons.star_half)
                : Icon(Icons.star_border)),
        (this.star >= 3)
            ? Icon(Icons.star)
            : ((this.star > 2.1)
                ? Icon(Icons.star_half)
                : Icon(Icons.star_border)),
        (this.star >= 4)
            ? Icon(Icons.star)
            : ((this.star > 3.1)
                ? Icon(Icons.star_half)
                : Icon(Icons.star_border)),
        (this.star >= 4.9)
            ? Icon(Icons.star)
            : ((this.star > 4.1)
                ? Icon(Icons.star_half)
                : Icon(Icons.star_border)),
      ],
    );
    Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          '$comments篇評論',
          style: TextStyle(fontSize: 20, color: Colors.grey),
        ),
      ],
    );
    Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        RaisedButton(onPressed: increasenum, child: Text(' 評論 ')),
        RaisedButton(onPressed: increasenum2, child: Text(' 分數 ')),
        RaisedButton(onPressed: setzero, child: Text(' 歸零 '))
      ],
    );
    Container(
      child: CachedNetworkImage(
        imageUrl:
            "https://cdn-msp.msp-comic1.xyz/media/albums/235551.jpg?v=1613363352",
        placeholder: (context, url) => CircularProgressIndicator(),
        errorWidget: (context, url, error) => Icon(Icons.error),
      ),
    );
  }
}
