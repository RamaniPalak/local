import 'package:shared_preferences/shared_preferences.dart';

class UserPrefs {
  static UserPrefs shared = UserPrefs();

  // Set Local Data here
  Future setLocalData({required LocalUser user}) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();

    prefs.setBool('IS_USER_LOGIN', user.isLogin);
    prefs.setString('MEMBER_ID', user.memberID);
    prefs.setString('USER_TOKEN', user.token);
    prefs.setString('MOBILE', user.mobile);
    prefs.setString('EMAIL', user.email);
    prefs.setString('displayName', user.displayName);
    prefs.setString('fcmId', user.fcmId ?? '');
  }

  // Clear Local here
  Future<bool> clear() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();

    return prefs.clear();
  }

  // Get User here
  Future<LocalUser> get getUser => _getUser();

  Future<LocalUser> _getUser() async {

    final SharedPreferences prefs = await SharedPreferences.getInstance();

    bool isLogin = prefs.getBool('IS_USER_LOGIN') ?? false;
    String memberId = prefs.getString('MEMBER_ID') ?? '';
    String token = prefs.getString('USER_TOKEN') ?? '';
    String mobile = prefs.getString('MOBILE') ?? '';
    String email = prefs.getString('EMAIL') ?? '';
    String displayName = prefs.getString('displayName') ?? '';
    String fcmId = prefs.getString('fcmId') ??'';


    return LocalUser(isLogin: isLogin, token: token, memberID: memberId,mobile: mobile,email: email,displayName: displayName,fcmId: fcmId);
  }

  Future setEmail({required String email}) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();

    prefs.setString('EMAIL', email);

  }

  // Get is login here
  Future<bool> get isUserLogin => _isUserLogin();

  Future<bool> _isUserLogin() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();

    bool isLogin = prefs.getBool('IS_USER_LOGIN') ?? false;

    return isLogin;
  }
}

class LocalUser {
  final String memberID;
  final String token;
  final bool isLogin;
  final String mobile;
  final String email;
  final String displayName;
  final String? fcmId;

  LocalUser({
    required this.memberID,
    required this.token,
    required this.isLogin,
    required this.mobile,
    required this.email,
    required this.displayName,
     this.fcmId
  });
}
