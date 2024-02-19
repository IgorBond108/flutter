import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:sindbad/utils/di.dart';
import 'package:sindbad/utils/shared_pref.dart';
import 'package:sindbad/utils/string.dart';

class AuthRepository {
  Future<bool> login() async {
    var request = await http.post(
        Uri.parse('${getIt<MString>().BASE_URL}/client_jwt/'),
        body: {'phone_number': '+79280912332', 'verification_code': '1111'});
    if (request.statusCode == 200) {
      getIt<SharedPref>().saveToken(json.decode(request.body)['refresh'],
          json.decode(request.body)['access']);
      getIt<SharedPref>().isAuth(authorized: true);
      return true;
    } else {
      return false;
    }
  }
}
