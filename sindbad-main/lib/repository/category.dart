import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:sindbad/model/category_responce.dart';
import 'package:sindbad/utils/di.dart';
import 'package:sindbad/utils/shared_pref.dart';
import 'package:sindbad/utils/string.dart';

class CategoryRepository {
  Future<dynamic> getCategory() async {
    String token = getIt<SharedPref>().getTokenAccess();
    var request = await http.get(
        Uri.parse('${getIt<MString>().BASE_URL}/categories/'),
        headers: {'Authorization': 'Bearer $token'});
    if (request.statusCode == 200) {
      return CategoryResponceMoodel.fromJson(
          json.decode(utf8.decode(request.bodyBytes)));
    } else {
      return false;
    }
  }
}
