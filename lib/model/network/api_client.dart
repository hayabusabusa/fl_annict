import 'dart:io';
import 'dart:convert';
import 'package:http/http.dart' as http;

import 'package:fl_annict/secret.dart';
import 'package:fl_annict/entity/entity.dart';

class _APIPath {
  static final String works = '/v1/works';
}

class APIClient {
  static final String baseURL = 'https://api.annict.com';
  static final String token = 'Bearer ' + accessToken;

  final http.Client httpClient = http.Client();

  Future<WorksResponse> getWorks(DateTime time) async {
    final url = baseURL + _APIPath.works + '?filter_season=${time.toFilterSeasonParam()}';
    final headers = {
      HttpHeaders.contentTypeHeader: "application/json",
      HttpHeaders.authorizationHeader: token,
    };
    final response = await httpClient.get(url, headers: headers);

    if (response.statusCode == 200) {
      final raw = json.decode(response.body);
      return WorksResponse.fromJson(raw);
    } else {
      throw Exception('Failed to GET ${_APIPath.works}. (code=${response.statusCode})');
    }
  }
}

extension DateTimeExtension on DateTime {
  /// `DateTime`の`month`から文字列の`spring`、`summer`、`fall`、`winter`に変換する.
  String toSeason() {
    if (this.month >= 1 && this.month <= 3) {
      return 'winter';
    } else if (this.month >= 4 && this.month <= 6) {
      return 'spring';
    } else if (this.month >= 7 && this.month <= 9) {
      return 'summer';
    } else if (this.month >= 10 && this.month <= 12) {
      return 'fall';
    } else {
      return '';
    }
  }

  /// `/works`のパラメータ`YYYY-Season`に変換する.
  String toFilterSeasonParam() {
    return '${this.year}-${this.toSeason()}';
  }
}