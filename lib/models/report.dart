class Report {
  int _id;
  String _locale;
  String _localeName;

  Report(this._id);

  Report.map(dynamic obj) {
    this._id = obj["id"];
    this._locale = obj["locale"];
    this._localeName = obj["locale_name"];
  }

  String get language {
    return _locale;
  }

  String get languageName {
    return _localeName;
  }

  Map<String, dynamic> toMap() {
    var map = new Map<String, dynamic>();
    map["id"] = _id;

    return map;
  }
}