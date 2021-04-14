import 'dart:async';
import 'package:connectivity/connectivity.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Network {
  StreamController controller = StreamController.broadcast();
  Stream get mystream => controller.stream;
  Connectivity connectivity = Connectivity();

  Future<void> init()async{
    controller.sink.add({'status':networkCheck(await connectivity.checkConnectivity())});
    
}
  static bool networkCheck(ConnectivityResult event){
    if (event == ConnectivityResult.mobile ||
        event == ConnectivityResult.wifi) {
      return true;
    }
    return false;
  }

  @override
  void dispose() {
    controller.close();
  }

}

class DisconnectDialog {
  Future<bool> showAlert(BuildContext context) async{
    return await showDialog<bool>(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text('測試標題'),
            content: const Text('測試內容.....'),
            actions: <Widget>[
              FlatButton(
                child: Text('確定'),
                onPressed: () {
                  Navigator.of(context).pop(true);
                },
              ),
            ],
          );
        });
  }
}

class DisconnectCheck {

}
