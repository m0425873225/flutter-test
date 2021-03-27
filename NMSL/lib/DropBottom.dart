import 'package:flutter/material.dart';


class DropDownStateWidget extends StatefulWidget{
  @override
  State<StatefulWidget> createState()=>DropDownState();
}

class DropDownState extends State<DropDownStateWidget>{
  var selectItemValue;

  @override
  Widget build(BuildContext context) {
    List<DropdownMenuItem> generateItemList() {
      List<DropdownMenuItem> items = new List();
      DropdownMenuItem item1 = new DropdownMenuItem(
          value: '升序', child: new Text('升序'));
      DropdownMenuItem item2 = new DropdownMenuItem(
          value: '降序', child: new Text('降序'));
      DropdownMenuItem item3 = new DropdownMenuItem(
          value: '依日期', child: new Text('依日期'));
      DropdownMenuItem item4 = new DropdownMenuItem(
          value: '依價格', child: new Text('依價格'));
      items.add(item1);
      items.add(item2);
      items.add(item3);
      items.add(item4);
      return items;
    }
    return new DropdownButtonHideUnderline(
      child: new DropdownButton(
        hint: Icon(Icons.arrow_drop_down_outlined),
        value: selectItemValue,
        items: generateItemList(),
        onChanged: (T){
          setState(() {
            selectItemValue=T;
          });
        },
      ),
    );
  }
}