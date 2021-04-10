import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class DrawerChange extends StatefulWidget {
  @override
  _DrawerChange createState() => _DrawerChange();
}

class _DrawerChange extends State<DrawerChange> {
  bool drawerBottom = false;
  @override
  Widget build(BuildContext context) {
    return Container(
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
                    SizedBox(
                        height: 30,
                        width: 30,
                        child: IconButton(
                            icon: Icon(
                                drawerBottom
                                    ? Icons.keyboard_arrow_up_sharp
                                    : Icons.keyboard_arrow_down_sharp,
                                size: 30,
                                color: Colors.blue),
                            onPressed: () {
                              setState(() {
                                drawerBottom = !drawerBottom;
                              });
                            }))
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
          Container(
            child: drawerBottom?DrawerClose():DrawerOpen()
          )
        ],
      ),
    );
  }
}

class DrawerOpen extends StatelessWidget {
  final double listSize = 20;
  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListView(
        shrinkWrap: true,
        children: <Widget>[
          ListTile(
            leading: Icon(Icons.person_outline),
            title: Text(
              '個人資訊',
              style: TextStyle(fontSize: listSize),
            ),
            onTap: () {
              Navigator.pop(context);
            },
          ),
          ListTile(
            leading: Icon(Icons.list),
            title: Text(
              '列表',
              style: TextStyle(fontSize: listSize),
            ),
            onTap: () {
              Navigator.pop(context);
            },
          ),
          ListTile(
            leading: Icon(Icons.ac_unit),
            title: Text(
              'test1',
              style: TextStyle(fontSize: listSize),
            ),
            onTap: () {
              Navigator.pop(context);
            },
          ),
          ListTile(
            leading: Icon(Icons.star),
            title: Text(
              'test2',
              style: TextStyle(fontSize: listSize),
            ),
            onTap: () {
              Navigator.pop(context);
            },
          ),
        ],
      ),
    );
  }
}

class DrawerClose extends StatelessWidget {
  final double listSize = 20;
  @override
  Widget build(BuildContext context) {
      return Container(
      child: ListView(
        shrinkWrap: true,
        children: <Widget>[
          ListTile(
            leading: Icon(Icons.person),
            title: Text(
              '我已經有帳號了',
              style: TextStyle(fontSize: listSize),
            ),
            onTap: () {
              Navigator.pop(context);
            },
          ),
          ListTile(
            leading: Icon(Icons.person_outline),
            title: Text(
              '立即加入 > < ',
              style: TextStyle(fontSize: listSize),
            ),
            onTap: () {
              Navigator.pop(context);
            },
          ),
        ],
      ),
    );
  }
}
