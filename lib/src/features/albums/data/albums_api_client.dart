import 'dart:convert';

import 'package:flutter_jsonplaceholder/src/core/models/album_with_photo.dart';
import 'package:http/http.dart' as http;

import '../../../core/models/models.dart';
import '../../../core/constants/http_endpoints.dart';
import '../../../core/utils/http_errors.dart';

class AlbumsApiClient {
  AlbumsApiClient({http.Client? httpClient})
      : _httpClient = httpClient ?? http.Client();

  final http.Client _httpClient;

// 100
  Future<List<AlbumWithPhotos>> fetchAlbums(int userId) async {
    final queryParams = <String, String>{
      'userId': '$userId',
      '_embed': 'photos',
    };
    final uri = Uri.https(baseUrl, albums, queryParams);
    final response = await _get(uri);
    try {
      final body = json.decode(response.body) as List;

      return body.map((dynamic item) {
        return AlbumWithPhotos(
            album: Album.fromJson(item as Map<String, dynamic>),
            photos: List<Photo>.from(item['photos']
                .map((c) => Photo.fromJson(c as Map<String, dynamic>))));
      }).toList();
    } on Exception {
      throw JsonDeserializationException();
    }
  }

  Future<http.Response> _get(Uri uri) async {
    http.Response response = await _httpClient
        .get(uri)
        .onError((error, stackTrace) => throw HttpException());

    if (response.statusCode != 200) {
      throw HttpRequestFailure(response.statusCode);
    }
    return response;
  }
}
