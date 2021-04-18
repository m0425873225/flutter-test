import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:NMSL/ImageChoose.dart';

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
  @override
  Widget build(BuildContext context) {
    List<ElevatedButton> buttons;

    String imageLocalPath;

    ElevatedButton chooseButton({
      @required ImageSource type,
      @required String text,
    }) {
      return ElevatedButton(
        onPressed: () async {
          String path = await ImageChooseState.getImage(source: type);
          if (path == '') {
            showDialog(
              context: context,
              builder: (context) {
                return AlertDialog(
                  title: Text("錯誤"),
                  content: Text("沒有選擇到照片"),
                );
              },
            );
          } else {
            setState(() {
              imageLocalPath = path;
            });
          }
        },
        child: Text(text),
      );
    }

    @override
    void initState() {
      // TODO: implement initState
      super.initState();
      buttons = [
        chooseButton(type: ImageSource.camera, text: "拍照",),
        chooseButton(type: ImageSource.gallery, text: "相簿",),
      ];
    }

    @override
    Widget build(BuildContext context) {
      return Container(
          padding: EdgeInsets.symmetric(horizontal: 20,),
          child: Center(
              child: Column(
                children: [
                  Container(
                    height: MediaQuery.of(context).size.width * 0.5,
                    width: MediaQuery.of(context).size.width * 0.5,
                    child: (imageLocalPath != null)
                        ? Image.file(File(imageLocalPath))
                        : Container(),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: buttons,
                  ),
                ],
              )
          )
      );
    }
  }
}
