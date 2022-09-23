import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:i_task/services/restroModel.dart';

Future<Data> getRestroDetails() async {
  final response = await Dio().get(
      "https://api.flunkey.app/api/explore/restaurants?&pageNo=0&size=10&direction=asc");

  if (response.statusCode == 200) {
    return Data.fromJson((jsonDecode(response.data)));
  } else {
    throw Exception(
        "Failed to Load Detail Restaurant, Please Check Your Internet");
  }
}
