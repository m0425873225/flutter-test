import 'package:flutter/material.dart';

class ReserveBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Text('備用'),
        ],
      ),
    );
  }
}

class Reserve extends StatefulWidget {
  @override
  _ReserveState createState() => _ReserveState();
}

class _ReserveState extends State<Reserve> {
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
