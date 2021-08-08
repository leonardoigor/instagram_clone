import 'dart:convert';

class UserDataEntity {
  String? _user;
  String? _password;

  String? get passworddata => _password;

  set passworddata(String? password) {
    this._password = password;
  }

  String? get userdata => _user;

  set userdata(String? user) => this._user = user;

  Map<String, dynamic> toMap() {
    return {
      'user': _user,
      'password': _password,
    };
  }

  String toJson() => json.encode(toMap());

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is UserDataEntity &&
        other._user == _user &&
        other._password == _password;
  }

  @override
  int get hashCode => _user.hashCode ^ _password.hashCode;
}
