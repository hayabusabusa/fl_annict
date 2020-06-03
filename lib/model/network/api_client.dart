import 'dart:io';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/foundation.dart';

import 'package:fl_annict/secret.dart';
import 'package:fl_annict/entity/entity.dart';

class _APIPath {
  static final String works = '/v1/works';
  static final String episodes = '/v1/episodes';
}

class APIClient {
  static final String baseURL = 'https://api.annict.com';
  static final String token = 'Bearer ' + accessToken;

  final http.Client httpClient = http.Client();

  Future<EpisodesResponse> getEpisodes({@required int workId, int page = 1}) async {
    final url = baseURL + _APIPath.episodes + '?filter_work_id=$workId' + '&page=$page' + '&sort_id=asc';
    final headers = {
      HttpHeaders.contentTypeHeader: "application/json",
      HttpHeaders.authorizationHeader: token,
    };
    final response = await httpClient.get(url, headers: headers);

    debugPrint('🛠 [API] $url RESPONSE: ${response.body}');

    if (response.statusCode == 200) {
      final raw = json.decode(response.body);
      return EpisodesResponse.fromJson(raw);
    } else {
      throw Exception('Failed to GET $url. (code=${response.statusCode})');
    }
  }

  Future<WorksResponse> getWorks({@required DateTime time, int page = 1}) async {
    final url = baseURL + _APIPath.works + '?filter_season=${time.toFilterSeasonParam()}' + '&page=$page' + '&sort_id=asc';
    final headers = {
      HttpHeaders.contentTypeHeader: "application/json",
      HttpHeaders.authorizationHeader: token,
    };
    final response = await httpClient.get(url, headers: headers);

    debugPrint('🛠 [API] $url RESPONSE: ${response.body}');

    if (response.statusCode == 200) {
      final raw = json.decode(response.body);
      return WorksResponse.fromJson(raw);
    } else {
      throw Exception('Failed to GET $url. (code=${response.statusCode})');
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