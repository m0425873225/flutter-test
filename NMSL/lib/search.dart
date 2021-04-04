import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:NMSL/DropBottom.dart';
import 'package:NMSL/model.dart';
import 'package:NMSL/searchPage.dart';

class SearchBar extends StatefulWidget {
  @override
  _SearchBarState createState() => _SearchBarState();
}

class _SearchBarState extends State<SearchBar> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(),
      height: 40,
      width: 220,
      child: Row(
        children: [
          Expanded(
              child: TextField(
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
          )),
          Container(
            child: DropDownStateWidget(),
          )
        ],
      ),
    );
  }
}

class Search extends StatefulWidget {
  @override
  _SearchPage createState() => _SearchPage();
}

class _SearchPage extends State<Search> {
  bool _pageChange = false;

  @override
  void initState() {
    getonlinedata();
    getonlinedata().futureBlockchain=getonlinedata().BlockchainApi();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Container(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Container(
                  width: MediaQuery.of(context).size.width * 0.5,
                  decoration: BoxDecoration(
                      color: Colors.white10,
                      border: Border(
                          bottom: BorderSide(
                              width: 3,
                              color: _pageChange
                                  ? Colors.white24
                                  : Colors.purple))),
                  child: IconButton(
                    icon: Icon(
                      Icons.person,
                      color: _pageChange ? Colors.white24 : Colors.purple,
                    ),
                    onPressed: () {
                      setState(() {
                        _pageChange = !_pageChange;
                      });
                    },
                  ),
                ),
                Container(
                  width: MediaQuery.of(context).size.width * 0.5,
                  decoration: BoxDecoration(
                      color: Colors.white10,
                      border: Border(
                          bottom: BorderSide(
                              width: 3,
                              color: _pageChange
                                  ? Colors.purple
                                  : Colors.white24))),
                  child: IconButton(
                    icon: Icon(
                      Icons.menu,
                      color: _pageChange ? Colors.purple : Colors.white24,
                    ),
                    onPressed: () {
                      setState(() {
                        _pageChange = !_pageChange;
                      });
                    },
                  ),
                ),
              ],
            ),
          ),
          FutureBuilder(
              future: getonlinedata().BlockchainApi(),
              builder: (context, projectSnap) {
                if ((projectSnap.connectionState == ConnectionState.none) ||
                    (projectSnap.hasData == null) ||
                    (projectSnap.data == null)) {
                  return Center(
                    child: Container(
                      height: MediaQuery.of(context).size.height * 0.6,
                      width: MediaQuery.of(context).size.width * 0.4,
                      child: Center(
                        child: CircularProgressIndicator(
                          backgroundColor: Colors.grey[200],
                          valueColor: AlwaysStoppedAnimation(Colors.blue),
                        ),
                      ),
                    ),
                  );
                } else {
                  /*getonlinedata().blockchaindata = projectSnap.data;*/
                  return _pageChange ? ListPage(data:projectSnap.data) : PersonPage(data:projectSnap.data);
                }
              }),
        ],
      ),
    );
  }
}
