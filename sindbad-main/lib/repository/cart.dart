import 'dart:convert';

import 'package:sindbad/model/cart_responce.dart';
import 'package:sindbad/utils/di.dart';
import 'package:sindbad/utils/shared_pref.dart';
import 'package:http/http.dart' as http;
import 'package:sindbad/utils/string.dart';

class CartRepository{
  Future<dynamic> getCart() async {
    String token = getIt<SharedPref>().getTokenAccess();
    var request = await http.get(
        Uri.parse('${getIt<MString>().BASE_URL}/cartitems/'),
        headers: {'Authorization': 'Bearer $token'});
    if (request.statusCode == 200) {
      return CartResponceModel.fromJson(json.decode(utf8.decode(request.bodyBytes)));
    } else {
      return false;
    }
  }
  Future<dynamic> addCart(int productId, int quantity) async {
    String token = getIt<SharedPref>().getTokenAccess();
    var request = await http.post(
        Uri.parse('${getIt<MString>().BASE_URL}/cartitems/'),
        headers: {'Authorization': 'Bearer $token'},
        body: {'product': '$productId', 'quantity': '$quantity'});
    if (request.statusCode==201) {
      return true;
    } else {
      return false;
    }
  }
  Future<void> removeCart(int id) async {
    String token = getIt<SharedPref>().getTokenAccess();
    var request = await http.delete(
        Uri.parse('${getIt<MString>().BASE_URL}/cartitems/$id'),
        headers: {'Authorization': 'Bearer $token'},);
        return;
  }
}