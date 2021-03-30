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
          child: new Text('升序'));
      DropdownMenuItem item2 = new DropdownMenuItem(
          child: new Text('降序'));
      DropdownMenuItem item3 = new DropdownMenuItem(
          child: new Text('依日期'));
      DropdownMenuItem item4 = new DropdownMenuItem(
          child: new Text('依價格'));
      items.add(item1);
      items.add(item2);
      items.add(item3);
      items.add(item4);
      return items;
    }
    return new DropdownButtonHideUnderline(
      child: new DropdownButton(
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