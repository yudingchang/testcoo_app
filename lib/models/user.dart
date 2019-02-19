class User {
  String _username;
  String _password;

  String _api_token;
  int _expired_at;

  User(this._username, this._password);

  User.map(dynamic obj) {
    this._api_token = obj["api_token"];
  }

  String get username => _username;
  String get password => _password;

  Map<String, dynamic> toMap() {
    var map = new Map<String, dynamic>();
    map["username"] = _username;
    map["password"] = _password;

    return map;
  }
}