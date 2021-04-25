import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SettingsBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Text('設定'),
        ],
      ),
    );
  }
}

class Setting extends StatefulWidget {
  @override
  _SettingState createState() => _SettingState();
}

class _SettingState extends State<Setting> {
  List<String> _imageList = [];
  int _photoIndex = 0;

  //action sheet
  List _actionSheet = [
    {"name": "拍照", "icon": Icon(Icons.camera_alt)},
    {"name": "相册", "icon": Icon(Icons.photo)}
  ];


  Future _getImage() async {
    Navigator.of(context).pop();
    ImagePicker picker = ImagePicker();
    var image = await picker.getImage(
        source: _photoIndex == 0 ? ImageSource.camera : ImageSource.gallery);


    if (image != null) {
      await _imageStore();
      setState(() {
        _imageList.add(image.path);
      });
    }
  }


  Future _getActionSheet() async {
    await showModalBottomSheet(
        context: context,
        builder: (ctx) {
          return Container(
            padding: EdgeInsets.all(10.0),
            child: ListView.builder(
              shrinkWrap: true,
              itemCount: _actionSheet.length,
              itemExtent: 50.0,
              itemBuilder: (innerCtx, i) {
                return ListTile(
                  title: Text(_actionSheet[i]["name"]),
                  leading: _actionSheet[i]["icon"],
                  onTap: () {
                    setState(() {
                      _photoIndex = i;
                    });
                    _getImage();
                  },
                );
              },
            ),
          );
        });
  }

  _imageStore()async{
    SharedPreferences prefs = await SharedPreferences.getInstance();
    bool imagestore = await prefs.setStringList('key', _imageList);
    print(imagestore);
  }
  Future<List<String>> _imageLoad()async{
    SharedPreferences prefs = await SharedPreferences.getInstance();
    List<String> imageLoad = prefs.getStringList('key')??[];
    print('test=$imageLoad');
    return imageLoad;
  }

  @override
  void initState() {
     _imageLoad().then((imageLoad) => setState((){
       _imageList = imageLoad;
     }) );
  }
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          RaisedButton(
            child: Text("拍照或上傳"),
            onPressed: () => _getActionSheet(),
          ),
          Text("----照片列表----"),
          _imageList.isNotEmpty
              ? Wrap(
            spacing: 10.0,
            children: _getImageList(),
          )
              : Text("暂无内容")
        ],
      ),
    );
  }


  List<Widget> _getImageList() {
    return _imageList.map((img) {
      return ClipRRect(
        borderRadius: BorderRadius.circular(10.0),
        child: Stack(
          children: <Widget>[
            Image.file(
              File(img),
              fit: BoxFit.cover,
              width: 100.0,
              height: 70.0,
            ),
            Positioned(
              right: 5.0,
              top: 5.0,
              child: GestureDetector(
                child: ClipOval(
                  child: Container(
                    width: 15.0,
                    height: 15.0,
                    color: Colors.lightBlue,
                    child: Icon(
                      Icons.close,
                      color: Colors.white,
                      size: 12.0,
                    ),
                  ),
                ),
                onTap: () {
                  setState(() {
                    _imageList.remove(img);
                  });
                },
              ),
            )
          ],
        ),
      );
    }).toList();
  }
}
