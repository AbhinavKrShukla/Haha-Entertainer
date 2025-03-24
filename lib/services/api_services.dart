import 'dart:convert';
import 'dart:io';

import 'package:haha_entertainer/constants.dart';
import 'package:http/http.dart' as http;

Future<List> hitApi(value) async{

  http.Response response = await http.get(
    Uri.parse("$baseURL/$value"),
    headers: {api_key_label : api_key_value},
  );

  if (response.statusCode == HttpStatus.ok) {
    final jsonResponse = jsonDecode(response.body);
    return jsonResponse;
  }

  else {
    return [{'quote':'Failed to fetch', 'author':''}];
  }
}