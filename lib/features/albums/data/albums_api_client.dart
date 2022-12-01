import 'dart:convert';

import 'package:http/http.dart' as http;

import '../../../app/constants/http_endpoints.dart';
import '../../../app/database/drift/app_database.dart';
import '../../../app/models/album_with_photo.dart';
import '../../../app/utils/http_errors.dart';


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
