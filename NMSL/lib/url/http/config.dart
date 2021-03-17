class HttpConfig{

  static final HttpConfig _instance = HttpConfig._internal();

  factory HttpConfig() {
    return _instance;
  }

  HttpConfig._internal();

  static String protocol = 'http';
}