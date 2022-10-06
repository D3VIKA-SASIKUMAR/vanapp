import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import '/utils/constants/constant.dart';

const Map<String, dynamic> temp = {};

Future getData(String url,
    {Map<String, dynamic> params = temp,
    post = false,
    String token = ""}) async {
  final Uri URL =
      Uri.parse("${Constants.BASE_URL}$url"); //https://hosted_url.com/login_api
  final http.Response result;
  final header = token.isEmpty
      ? {
          'Content-Type': 'application/json',
          'Accept': 'application/json',
        }
      : {
          'Content-Type': 'application/json',
          'Accept': 'application/json',
          'Authorization': 'Bearer $token'
        };

  if (post) {
    result = await http.post(URL, headers: header, body: json.encode(params));
  } else {
    result = await http.get(URL, headers: header);
  }
  if (kDebugMode) {
    print(result.body);
  }

  final data = result.body;
  return jsonDecode(data);
}
