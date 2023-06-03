import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert';
import '../config.dart';
import '../screens/login/login.dart';
import '../styles/common Color.dart';
import '../widgets/toaster.dart';

class LogoutControl extends GetConnect {
  String? service;
  static const String _baseUrl = '${ApiConfig.service}CommonCustomUpdate/';
  Future logOut(BuildContext context) async {
    final prefs = await SharedPreferences.getInstance();
    int? sessionId = prefs.getInt('SessionId');
    final url = Uri.parse(_baseUrl);
    final headers = {
      'Accept': 'application/json',
      'Content-Type': 'application/json'
    };
    final json = '{"data": {"SessionID": "$sessionId"}}';
    final response =
        await http.post(url, headers: headers, body: json.toString());
    if (response.statusCode == 400) {
      String err = 'something went wrong!';
      toaster(context, err, red, Icons.error);
    } else {
      final datas = jsonDecode(response.body);
      var statusVal = ('${datas['Output']['status']['code']}');
      if (statusVal == "200") {
        await prefs.remove('SessionId');
        Get.to(Login());
        return response;
      } else {
        final datas = jsonDecode(response.body);
        String error = ('${datas['Output']['status']['code']['message']}');
        toaster(context, error, red, Icons.error);
        throw Exception('Check statusCode');
      }
    }
  }
}
