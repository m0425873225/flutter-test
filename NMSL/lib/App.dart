import 'file:///D:/github/flutter-test/NMSL/lib/screen/search.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'file:///D:/github/flutter-test/NMSL/lib/screen/home.dart';
import 'file:///D:/github/flutter-test/NMSL/lib/screen/setting.dart';
import 'file:///D:/github/flutter-test/NMSL/lib/screen/Reserve.dart';
import 'package:NMSL/DrawerChange.dart';
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
  final List<Widget> _children = [Home(), Search(),Setting(),Reserve()];
  final List<Widget> _appBar = [HomeBar(),SearchBar(),SettingsBar(),ReserveBar()];
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
                  height: 220,
                  color: Colors.transparent,
                  child: Column(
                    children: [
                      Container(
                        margin: EdgeInsets.all(2),
                        child: Column(
                          children: [
                            ClipOval(
                                child:Image.network('https://upload.wikimedia.org/wikipedia/zh/b/b6/Honkai_Impact_3.png',
                              fit: BoxFit.cover,
                              height: 70,
                              width: 70,
                            )),
                            Text('為美好的世界而戰'),
                            Divider(height:5,color:Colors.white)
                          ],
                        ),
                      ),
                      ListTile(
                        leading: Icon(Icons.list),
                        title: Text('列表'),
                      ),
                      Divider(height:2,color:Colors.grey),
                      ListTile(
                        leading: Icon(Icons.list),
                        title: Text('列表2'),
                      ),
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
        type: BottomNavigationBarType.fixed,
        onTap: onTabTapped,
        currentIndex: _currentIndex,
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(icon: Icon(Icons.home), label: '首頁'),
          BottomNavigationBarItem(icon: Icon(Icons.search), label: '搜尋'),
          BottomNavigationBarItem(icon: Icon(Icons.settings), label: '設定'),
          BottomNavigationBarItem(icon: Icon(Icons.ac_unit),label:'測試'),
        ],
      ),
      drawer: Drawer(
        child: Container(
          width: MediaQuery.of(context).size.width*0.7,
          child: SafeArea(
            child: Container(
              height: MediaQuery.of(context).size.height,
              child:DrawerChange(),
            ),
          ),
        ),
      ),
    );
  }
}
