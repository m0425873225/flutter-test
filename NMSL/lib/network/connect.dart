import 'dart:async';
import 'package:connectivity/connectivity.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class NetworkConnect{

  StreamController controller = StreamController.broadcast();

  Stream get myStream => controller.stream;

  Connectivity connectivity = Connectivity();

  void init() async {
    controller.sink.add({
      'status': checkConnection(event: await connectivity.checkConnectivity()),
    });
    connectivity.onConnectivityChanged.listen((event) {
      controller.sink.add({
        'status': checkConnection(event: event),
      });
    });
  }

  static bool checkConnection({ConnectivityResult event}) {
    if (event == ConnectivityResult.mobile || event == ConnectivityResult.wifi) {
      return true;
    }
    return false;
  }

  void cancel() {
    controller.close();
  }

  static final NetworkConnect _instance = NetworkConnect._internal();

  static NetworkConnect get instance => _instance;

  NetworkConnect._internal();
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
