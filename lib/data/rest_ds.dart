import 'dart:async';

import 'package:testcoo_inspector/utils/network_util.dart';
import 'package:testcoo_inspector/models/user.dart';

class RestDatasource {
  NetworkUtil _netUtil = new NetworkUtil();
  static final BASE_URL = "http://zhoujiaman.frpgz1.idcfengye.com/api";
  static final LOGIN_URL = BASE_URL + "/v1/inspector/login";
  static final _API_KEY = "somerandomkey";

  Future<User> login(String username, String password) {
    return _netUtil.post(LOGIN_URL, {
      "token": _API_KEY,
      "type": "phone_number",
      "phone_number": username,
      "password": password
    }).then((dynamic res) {
      return new User.map(res["data"]);
    });
  }
}