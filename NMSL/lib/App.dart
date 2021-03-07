import 'package:NMSL/search.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:NMSL/home.dart';
import 'package:NMSL/setting.dart';
class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: new ThemeData(brightness: Brightness.dark),
      home: AppPage(),
    );
  }
}

class AppPage extends StatefulWidget {
  @override
  _AppState createState() => _AppState();
}

class _AppState extends State<AppPage> {
  int _currentIndex = 0;
  final List<Widget> _children = [Home(), Search(),Setting()];
  final List<Widget> _appBar = [HomeBar(),SearchBar(),SettingsBar()];
  void onTabTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Container(
          child:_appBar[_currentIndex]
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.mail_outline),
            onPressed: (){
              showModalBottomSheet(context: context, builder: (BuildContext context){
                return Container(
                  height: 200,
                  color: Colors.transparent,
                  child: Column(
                    children: [
                      Container(
                        child: Column(
                          children: [
                            ClipOval(
                                child:Image.network('https://upload.wikimedia.org/wikipedia/zh/b/b6/Honkai_Impact_3.png',
                              fit: BoxFit.cover,
                              height: 70,
                              width: 70,
                            ))
                          ],
                        ),
                      ),
                      ListTile(),
                      ListTile(),
                    ],
                  ),
                );
              });
            }
          )
        ],
      ),
      body: _children[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        onTap: onTabTapped,
        currentIndex: _currentIndex,
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(icon: Icon(Icons.home), label: '首頁'),
          BottomNavigationBarItem(icon: Icon(Icons.search), label: '搜尋'),
          BottomNavigationBarItem(icon: Icon(Icons.settings), label: '設定'),
        ],
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            DrawerHeader(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      ClipOval(
                        child: Image.network(
                          'https://www.steamxo.com/wp-content/uploads/2019/11/5ggL5q154529_874683.jpg',
                          fit: BoxFit.cover,
                          width: 70,
                          height: 70,
                        ),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'NMSL',
                        style: TextStyle(color: Colors.white, fontSize: 17),
                      ),
                      Icon(
                        Icons.add_circle_outline,
                        size: 30,
                        color: Colors.blue,
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Text(
                        'yan@gmail.com',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 17,
                        ),
                      )
                    ],
                  ),
                  Row(
                    children: [
                      Text(
                        '@fuckUbitch',
                        style: TextStyle(
                          color: Colors.grey,
                          fontSize: 12,
                        ),
                      )
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
              title: Text(
                '個人資訊',
                style: TextStyle(fontSize: 20),
              ),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: Icon(Icons.list),
              title: Text(
                '列表',
                style: TextStyle(fontSize: 20),
              ),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: Icon(Icons.ac_unit),
              title: Text(
                'test1',
                style: TextStyle(fontSize: 20),
              ),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: Icon(Icons.star),
              title: Text(
                'test2',
                style: TextStyle(fontSize: 20),
              ),
              onTap: () {
                Navigator.pop(context);
              },
            ),
          ],
        ),
      ),
    );
  }
}
