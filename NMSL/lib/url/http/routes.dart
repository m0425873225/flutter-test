import 'config.dart';

class ApiRoutes {

  static final ApiRoutes _instance = ApiRoutes._internal();

  factory ApiRoutes() {
    return _instance;
  }

  ApiRoutes._internal();

  String _govLandRateApi = 'api.kcg.gov.tw/api/service/get/0223bf7c-21b6-41ba-86e1-23e81969e771';
  Uri get govLandRateApi => parseUri(_govLandRateApi);

  Uri parseUri(String url) {
    return Uri.parse(HttpConfig.protocol + url);
  }
}