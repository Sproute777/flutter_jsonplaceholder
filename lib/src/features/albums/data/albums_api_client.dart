import 'dart:convert';

import 'package:http/http.dart' as http;

import '../../../common/models/models.dart';
import '../../../common/remote_datasource/endpoints.dart';
import '../../../common/utils/http_errors.dart';

class AlbumsApiClient {
  AlbumsApiClient({http.Client? httpClient})
      : _httpClient = httpClient ?? http.Client();

  final http.Client _httpClient;

// 100
  Future<List<Album>> fetchAlbums(int userId) async {
    final queryParams = <String, String>{
      'userId': '$userId',
    };
    final uri = Uri.https(baseUrl, albums, queryParams);
    return _getAlbums(uri);
  }

  Future<List<Album>> _getAlbums(Uri uri) async {
    http.Response response = await _httpClient
        .get(uri)
        .onError((error, stackTrace) => throw HttpException());

    if (response.statusCode != 200) {
      throw HttpRequestFailure(response.statusCode);
    }
    List body;

    try {
      body = json.decode(response.body) as List;
    } on Exception {
      throw JsonDecodeException();
    }

    try {
      return body
          .map((dynamic item) => Album.fromJson(item as Map<String, dynamic>))
          .toList();
    } on Exception {
      throw JsonDeserializationException();
    }
  }
}
