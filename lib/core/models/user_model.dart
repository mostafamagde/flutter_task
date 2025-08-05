class UserModel {
  String? email;

  UserModel._();

  static final UserModel _singletonInstance = UserModel._();

  static UserModel get instance => _singletonInstance;

  void setFromJson(Map<String, dynamic> json) {
    email = json['user'];
  }
}
