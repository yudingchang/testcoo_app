import 'dart:async';

import 'package:testcoo_inspector/utils/network_util.dart';
import 'package:testcoo_inspector/models/user.dart';
import 'package:testcoo_inspector/models/order.dart';

class RestDatasource {
  NetworkUtil _netUtil = new NetworkUtil();
  static final BASE_URL = "http://zhoujiaman.frpgz1.idcfengye.com/api";
  static final LOGIN_URL = BASE_URL + "/v1/inspector/login";
  static final PUBLICATION_ORDER_URL = BASE_URL + '/v1/inspector/service/publication';
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

  // 已发布待抢列表
  Future<List<Order>> getPublicationOrders(int page) async {
    return _netUtil.get(PUBLICATION_ORDER_URL, queryParameters: { 'page': page.toString() }).then((dynamic res) {
      List<Order> items = (res['data'] as List).map((i) => new Order.map(i)).toList();
      return items;
    });
  }
}