import 'package:connectivity/connectivity.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
class Network{
    static Future<bool> networkCheck() async{
    var connectivityResult = await (Connectivity().checkConnectivity());
    if (connectivityResult == ConnectivityResult.mobile || connectivityResult == ConnectivityResult.wifi)
    {return true;} return false;
}
}

class DisconnectDialog{
   showCupertinoDialog() {
    CupertinoAlertDialog(
      content: Row(
        children: [
          Icon(Icons.perm_scan_wifi_outlined,color: Colors.red,size: 30,),
          Text(
            "您已中斷連線",
            style: TextStyle(fontSize: 20),
          ),
          Text(
            "請重新確認連線",
            style: TextStyle(fontSize: 20),
          ),
        ],
      ),
      actions: <Widget>[
        CupertinoButton(
          child: Text("確定連線"),
          onPressed: () {
          },
        ),
      ],
    );
  }
}

class DisconnectCheck{}
