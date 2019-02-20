import 'package:testcoo_inspector/models/report.dart';
import 'dart:collection';

class Order {
  int _id;
  Map<String, dynamic> _inspectionAddress = {};
  List<dynamic> _inspectionDates = [];
  String _workload;
  double _commission;
  double _otherFee;
  bool _isMain;
  List<Report> _reports;

  Order(this._id);

  Order.map(dynamic obj) {
    this._id = obj["id"];
    this._inspectionAddress = obj["inspection_address"];
    this._inspectionDates = obj["inspection_dates"];
    this._workload = obj["workload"];
    this._commission = double.parse(obj["commission"]);
    this._otherFee = double.parse(obj["other_fee"]);
    this._isMain = obj["is_main"];
    this._reports = (obj['reports'] as List).map((i) => new Report.map(i)).toList();
  }

  // 验货地址
  String get address {
    return this._inspectionAddress['address_detail'] ?? '';
  }

  // 验货时间
  String get inspectionDates {
    return _inspectionDates.join(',');
  }

  // 工作量
  String get workload {
    return double.parse(_workload).toString();
  }

  bool get isMain {
    return _isMain;
  }

  // 提成金额
  String get commission {
    return (this._commission + this._otherFee).toString();
  }

  List<Map> get reportLanguages {
    var reports = ListQueue.from(_reports);
    Map<String, int> languages = {};
    reports.forEach((report) {
      var key = report.languageName;
      if (!languages.containsKey(key)) {
        languages[key] = 0;
      }
      languages[key]++;
    });
    List<Map> items = [];
    languages.forEach((language, count) {
      items.add({ 'language': language, 'count': count.toString() });
    });
    return items;
  }

  Map<String, dynamic> toMap() {
    var map = new Map<String, dynamic>();
    map["id"] = _id;

    return map;
  }
}