import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;

class NetworkUtil {
  // next three lines makes this class a Singleton
  static NetworkUtil _instance = new NetworkUtil.internal();
  NetworkUtil.internal();
  factory NetworkUtil() => _instance;

  final JsonDecoder _decoder = new JsonDecoder();

  Future<dynamic> get(String url) {
    return http.get(url).then((http.Response response) {
      final String res = response.body;
      final int statusCode = response.statusCode;

      if (statusCode < 200 || statusCode > 400 || json == null) {
        throw new Exception("Error while fetching data");
      }
      return _decoder.convert(res);
    });
  }

  Future<dynamic> post(String url, body) {
    return http.post(url, body: body, headers: {
      HttpHeaders.acceptHeader: 'application/json'
    }, encoding: Encoding.getByName("utf-8"))
        .then((http.Response response) {
      final String res = response.body;
      final int statusCode = response.statusCode;

      dynamic data = _decoder.convert(res);

      print(statusCode);
      print(data);

//      if (statusCode < 200 || statusCode > 400 || json == null) {
//        throw new Exception("Error while fetching data");
//      }

      if (statusCode >= 400 && statusCode < 500) {
        throw new Exception(data['message']);
      }

      if (statusCode == 200 && data['code'] != 0) {
        throw new Exception(data['message']);
      }

      return data;
    });
  }
}