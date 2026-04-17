import 'dart:convert';

import 'package:http/http.dart';

class HTTPClient{
  HTTPClient._internal();

  static final HTTPClient _instance = HTTPClient._internal();

  factory HTTPClient() => _instance;

  static const int _requestTimeOut = 40;

  Future<Map<String, dynamic>> getRequest({required String url}) async {
    try{
      Response response = await get(
        Uri.parse(url),
      ).timeout(const Duration(seconds: _requestTimeOut));
      return {
        "data": jsonDecode(response.body)
      };
    } catch(e) {
      return {'error': e.toString()};
    }
  }

  Future<Map<String, dynamic>> postRequest({required String url, dynamic requestBody}) async {
    try{
      Response response = await post(
        Uri.parse(url),
        body: requestBody,
      ).timeout(const Duration(seconds: _requestTimeOut));
      return {
        "data": jsonDecode(response.body)
      };
    } catch(e) {
      return {'error': e.toString()};
    }
  }
}