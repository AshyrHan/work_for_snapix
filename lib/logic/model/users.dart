class Users {
  final String login;
  final String password;

  Users({this.login, this.password});

  factory Users.fromJson(Map<String, dynamic> json) {
    return Users(login: json['login'], password: json['json']);
  }

  Map<String, dynamic> toJson() => {
        'login': login,
        'password': password,
      };
}

// factory Category.fromJson(Map<String, dynamic> json) =>
//       _$CategoryFromJson(json);

//   Map<String, dynamic> toJson() => _$CategoryToJson(this);
