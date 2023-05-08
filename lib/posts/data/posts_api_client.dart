// import 'dart:convert';
//
// import 'package:http/http.dart' as http;
//
// import '../../../app/constants/http_endpoints.dart';
// import '../../../app/database/drift/database_client.dart';
// import '../../../app/models/post_with_comments.dart';
// import '../../../app/utils/http_errors.dart';
//
// class PostsApiClient {
//   PostsApiClient({http.Client? httpClient})
//       : _httpClient = httpClient ?? http.Client();
//
//   final http.Client _httpClient;
//
// // 200 штук ,может быть грузить порциями
//   Future<List<PostWithComments>> fetchPosts(int userId) async {
//     final queryParams = <String, String>{
//       'userId': '$userId',
//       // '_sort': 'userId,id',
//       // '_order': 'asc,desc',
//       '_embed': 'comments',
//       // 'postId_gte': '',
//       // 'userId_gte': '1',
//       // 'userId_like': '1',
//       // 'userId_ne': '2',
//       // 'userId_lte': '4',
//       // '_limit': '20'
//     };
//     final uri = Uri.https(baseUrl, posts, queryParams);
//     final response = await _get(uri);
//
//     try {
//       final body = json.decode(response.body) as List;
//
//       return body.map((dynamic item) {
//         return PostWithComments(
//             post: Post.fromJson(item as Map<String, dynamic>),
//             comments: List<Comment>.from(item['comments']
//                 .map((c) => Comment.fromJson(c as Map<String, dynamic>))));
//       }).toList();
//     } on Exception {
//       throw JsonDeserializationException();
//     }
//   }
//
//   Future<http.Response> _get(Uri uri) async {
//     http.Response response = await _httpClient
//         .get(uri)
//         .onError((error, stackTrace) => throw HttpException());
//
//     if (response.statusCode != 200) {
//       throw HttpRequestFailure(response.statusCode);
//     }
//     return response;
//   }
// }
