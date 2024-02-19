import 'package:shared_preferences/shared_preferences.dart';

class SharedPref {
  late SharedPreferences _pref;

  Future<void> init() async {
    _pref = await SharedPreferences.getInstance();
    return;
  }

  void saveToken(refresh, access) {
    _pref.setString('rr', refresh);
    _pref.setString('aa', access);
  }

  String getTokenAccess() {
    return _pref.getString('aa') ?? '';
  }
  String getTokenRefresh() {
    return _pref.getString('rr') ?? '';
  }
  bool isAuth({bool? authorized}) {
    if (authorized!=null){
      _pref.setBool('auth', authorized);
    }
    return _pref.getBool('auth')??false;
  }
}
