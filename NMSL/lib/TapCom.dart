import 'package:flutter/material.dart';

class Tap extends StatefulWidget {
  @override
   _TapCom createState() => _TapCom();
}


class _TapCom extends State<Tap> {
  @override
  Widget build(BuildContext context) {}
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
    }
  }
