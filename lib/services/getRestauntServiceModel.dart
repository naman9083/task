import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:i_task/services/restroModel.dart';

Future<Data> getRestroDetails() async {
  final url = Uri.parse(
      "https://api.flunkey.app/api/explore/restaurants?&pageNo=0&size=10&direction=asc");

  final response = await http.get(
    url,
    headers: {
      'Content-Type': 'application/json; charset=UTF-8',
    },
  );
  if (response.statusCode == 200) {
    return Data.fromJson(jsonDecode(response.body));
  } else {
    throw Exception('Failed to create post');
  }
}
