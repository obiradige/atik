import 'dart:convert';

import 'package:dio/dio.dart';
class ApiService {
  ApiService({this.isMacellan = false});

  Dio dio = Dio();

  final bool isMacellan;
  
  String basicAuth = '';
  final baseUrl = 'https://anibalbilisim.com/sifiratik/api/v1';
  final baseMacellanUrl = 'https://api.altpay.dev';
  final String _bearerAuth = '';

  Dio init() {
    dio.options.headers.addAll({
      'Content-Type': 'application/json; charset=UTF-8',
      'Authorization': isMacellan ? _bearerAuth : basicAuth
    });
    dio.options.baseUrl = isMacellan ? baseMacellanUrl : baseUrl;
    return dio;
  }
}