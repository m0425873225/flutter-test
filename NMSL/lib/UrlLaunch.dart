import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class UrlLaunch{
  Future urlLaunch(String url) async{
    await canLaunch(url)?await launch(url):throw '無法連接到 $url ' ;
  }
}
