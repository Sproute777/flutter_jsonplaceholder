// import 'dart:convert';
//
// import 'package:http/http.dart' as http;
//
// import '../../../app/constants/http_endpoints.dart';
// import '../../../app/database/drift/drift.dart';
// import '../../../app/utils/http_errors.dart';
//
// class PhotosApiClient {
//   PhotosApiClient({http.Client? httpClient})
//       : _httpClient = httpClient ?? http.Client();
//
//   final http.Client _httpClient;
//
//   // 5000
//   Future<List<Photo>> fetchPhotos(int albumId,
//       {int startIndex = 0, int limit = 20}) async {
//     final queryParams = <String, String>{
//       'albumId': '$albumId',
//       '_start': '$startIndex',
//       '_limit': '$limit'
//     };
//     final uri = Uri.https(baseUrl, photos, queryParams);
//     return _getPhotos(uri);
//   }
//
//   // -----------------------------------------------------------------------------//
//
//   Future<List<Photo>> _getPhotos(Uri uri) async {
//     http.Response response = await _httpClient
//         .get(uri)
//         .onError((error, stackTrace) => throw HttpException());
//
//     if (response.statusCode != 200) {
//       throw HttpRequestFailure(response.statusCode);
//     }
//     List body;
//
//     try {
//       body = json.decode(response.body) as List;
//     } on Exception {
//       throw JsonDecodeException();
//     }
//
//     try {
//       return body
//           .map((dynamic item) => Photo.fromJson(item as Map<String, dynamic>))
//           .toList();
//     } on Exception {
//       throw JsonDeserializationException();
//     }
//   }
// }
