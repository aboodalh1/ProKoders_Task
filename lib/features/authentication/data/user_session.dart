class UserSession {
  static final UserSession _instance = UserSession._internal();

  UserSession._internal();

  factory UserSession() => _instance;

  String? uid;
  String? email;

  void setUser(String userId, String userEmail) {
    uid = userId;
    email = userEmail;
  }

  void clear() {
    uid = null;
    email = null;
  }
}