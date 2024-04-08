// ignore_for_file: lines_longer_than_80_chars

import 'dart:async';
import 'dart:convert';

import 'package:http/http.dart' as http;

class HttpService {
  final String apiKey = '123456';
  final String url = 'integration.micaresvc.com';

  Future<http.Response?> get({
    required Map<String, dynamic> param,
  }) {
    param.removeWhere((key, value) => value == '');

    final dataWithApiKey = param..addAll({'apikey': apiKey});

    final client = http.Client();

    try {
      return client.get(Uri.https(url, '/interviewapi/AssessmentTestRSVP/', dataWithApiKey));
    } catch (error) {
      return Future.error(error);
    }
  }

  Future<http.Response> post(
    Map<String, dynamic> data, {
    bool retry = true,
  }) {
    final client = http.Client();

    final dataWithApiKey = data..addAll({'apikey': apiKey});

    try {
      return client.post(
        Uri(
          scheme: 'https',
          host: url,
          path: '/interviewapi/AssessmentTestRSVP',
        ),
        body: jsonEncode(dataWithApiKey),
      );
    } catch (error) {
      return Future.error(error);
    }
  }
}
