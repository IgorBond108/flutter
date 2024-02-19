import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:sindbad/model/product_detail.dart';
import 'package:sindbad/model/product_responce.dart';
import 'package:sindbad/utils/di.dart';
import 'package:sindbad/utils/shared_pref.dart';
import 'package:sindbad/utils/string.dart';

class HomeRepository {
  ProductResponceModel? productResponceModel;
  Future<dynamic> getProducts() async {
    String token = getIt<SharedPref>().getTokenAccess();
    if (productResponceModel!=null){
      return productResponceModel;
    }
    var request = await http.get(
        Uri.parse('${getIt<MString>().BASE_URL}/products/'),
        headers: {'Authorization': 'Bearer $token'});
    if (request.statusCode == 200) {
      productResponceModel = ProductResponceModel.fromJson(
          json.decode(utf8.decode(request.bodyBytes)));
      return productResponceModel;
    } else {
      return false;
    }
  }
  Future<dynamic> getProduct(int id) async {
    String token = getIt<SharedPref>().getTokenAccess();
    var request = await http.get(
        Uri.parse('${getIt<MString>().BASE_URL}/products/$id'),
        headers: {'Authorization': 'Bearer $token'});
        print('---product:${utf8.decode(request.bodyBytes)}');
    if (request.statusCode == 200) {
      return ProductDetailModel.fromJson(
          json.decode(utf8.decode(request.bodyBytes)));
    } else {
      return false;
    }
  }
}
