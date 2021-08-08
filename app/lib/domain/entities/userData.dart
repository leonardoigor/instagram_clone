import 'dart:convert';

class UserDataEntity {
  String user;
  String password;

  String get passworddata => password;

  set passworddata(String password) {
    password = password;
  }

  UserDataEntity({
    required this.user,
    required this.password,
  });

  String get userdata => user;

  set userdata(String user) => user = user;

  Map<String, dynamic> toMap() {
    return {
      'user': user,
      'password': password,
    };
  }

  factory UserDataEntity.fromMap(Map<String, dynamic> map) {
    return UserDataEntity(
      user: map['user'],
      password: map['password'],
    );
  }

  String toJson() => json.encode(toMap());

  factory UserDataEntity.fromJson(String source) =>
      UserDataEntity.fromMap(json.decode(source));

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is UserDataEntity &&
        other.user == user &&
        other.password == password;
  }

  @override
  int get hashCode => user.hashCode ^ password.hashCode;
}
